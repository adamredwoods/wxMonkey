
Import target

Class wxTranslator Extends CppTranslator

	Method TransType$( ty:Type )
		Local objty:ObjectType=ObjectType( ty )
		If objty
			
			If ty.GetClass() = "wxMonkeyRef" Or (objty.classDecl.superTy And objty.classDecl.superTy.ident = "wxMonkeyRef")
				'Print "wxMonkeyEvent found"
				
				Return ty.GetClass().munged+"&"
			Endif
			
			
		Endif
		Return Super.TransType(ty)
	End

	Method TransFunc$( decl:FuncDecl,args:Expr[],lhs:Expr )
		
		''do check here
		
		If decl.IsMethod()
			'Print decl.ToString()
			'If decl.argDecls And decl.argDecls[0].type = "wxMonkeyRef"
				'If lhs Return TransSubExpr( lhs )+"->"+decl.munged+TransArgs( args,decl )
				'Return decl.munged+TransArgs( args,decl )
			'Endif
			Local cl:ClassDecl = ClassDecl( decl.scope)
			If (cl) And ((cl.ident="wxMonkeyRef") Or (cl.superClass And cl.superClass="wxMonkeyRef"))
				Local newline$ = Super.TransFunc(decl,args,lhs )
				Return newline.Replace("->",".")
				'Return cl.munged+"."+args[0]
				
			Endif
		Endif
		
		
		If decl.IsExtern() And args
			'Print decl.munged
			If decl.munged="wxFuncPtr"
				
				'Print "wxMonkeyFunc found"

				'Local oldargs$=TransArgs( args,decl )
				Local newargs$, p1%, p2%, p3%, dex:FuncDecl

				'If StmtExpr(args[0]) Then Print "stmtexpr"
				'If VarExpr(args[0]) Then Print "varexpr"
				'If MemberVarExpr(args[0]) Then dex = MemberVarExpr(args[0]).decl
				If InvokeExpr(args[0]) Then dex = InvokeExpr(args[0]).decl
				If InvokeMemberExpr(args[0]) Then dex = InvokeMemberExpr(args[0]).decl
				'If InvokeSuperExpr(args[0]) Then Print "invokesuperexpr"
				'If NewObjectExpr(args[0]) Then Print "newobjexpr"
				If CastExpr(args[0]) Then dex = InvokeExpr(CastExpr(args[0]).expr).decl

				If dex
		
					newargs = dex.ClassScope().munged+"::"+dex.munged
					Return newargs
					
				Endif
			Endif
#rem			
			If CastExpr(args[0]) And (ObjectType(CastExpr(args[0]).exprType))
				If (ObjectType(CastExpr(args[0]).exprType).GetClass() = "wxMonkeyDeref")
					Print "monkeyDeref"
					Local s:String = "*"+args[0]
					For Local i:=1 To args.Length()-1
						s=s+args[i].Trans
					Next
					Return s
				Endif
			Endif
#end			
			
		Endif
		
		Return Super.TransFunc(decl,args,lhs )
	End
	
	Method TransCastExpr$( expr:CastExpr )
	
		Local t$=Bra( expr.expr.Trans() )
		
		Local dst:=expr.exprType
		Local src:=expr.expr.exprType
		
		If ObjectType( dst ) And ObjectType( src )
			
			If dst.GetClass()="wxMonkeyDeref"
				'Print "monkeyDeref"
				Return Bra( "*"+expr.expr.Trans() )
			Endif
			
		Endif
		
		Return Super.TransCastExpr(expr)
	End

#rem
	Method TransArgs$( args:Expr[],decl:FuncDecl )
		If args ''-------------------------------------------------------
			Local oty:ObjectType = ObjectType(args[0].exprType)
			If oty And (oty.GetClass() = "wxMonkeyRef" Or (oty.classDecl.superTy And oty.classDecl.superTy.ident = "wxMonkeyRef"))
				dbgLocals.Clear
				Return Bra("&"+args[0].Trans())
				'Print "mkev"
			Endif
		Endif
		Return Super.TransArgs(args,decl)
	End
#end	
	
	Method EmitSetErr( info$ )
		For Local decl:=Eachin dbgLocals
			'If decl.ident Print "DBG_LOCAL("+decl.munged+",~q"+decl.ident+"~q)"

			If decl
				Local oty:= ObjectType(decl.type)
				If oty
					If (oty.GetClass() = "wxMonkeyRef" Or (oty.classDecl And oty.classDecl.superTy And oty.classDecl.superTy.ident = "wxMonkeyRef"))
						Return 0
					Endif
				Endif
			Endif
		Next
		Return Super.EmitSetErr(info)
	End
	
End

Class StdcppTarget Extends Target
	
	Field cc_opts:String
	
	Global use_wx:Int=0

	
	Function IsValid()
		If FileType( "stdcpp" )<>FILETYPE_DIR Return False
		Select HostOS
		Case "winnt"
			If MINGW_PATH Return True
		Case "macos"
			Return True
		Case "linux"
			Return True
		End
	End

	Method Begin()
		ENV_TARGET="stdcpp"
		ENV_LANG="cpp"
		_trans=New wxTranslator
	End
	
	Method PreConfig:Void()
		For Local kv:=Eachin Env
			Local remove?=False
			
			If kv.Key = "WXMONKEY" Then use_wx = 1
			If kv.Key.StartsWith("CC_OPTS")
				cc_opts=cc_opts+" "+kv.Value
				remove = True
			Endif
			
			If remove Then Env.Remove(kv.Key)
		Next
	End
	
	Method Config$()
		Local config:=New StringStack

		For Local kv:=Eachin Env
			'If Not kv.Key.StartsWith("CC_OPTS")
				config.Push "#define CFG_"+kv.Key+" "+kv.Value
			'Endif
		Next

		Return config.Join( "~n" )
	End
	
	Method MakeTarget()
	
		Select ENV_CONFIG
		Case "debug" Env.Set "DEBUG","1"
		Case "release" Env.Set "RELEASE","1"
		Case "profile" Env.Set "PROFILE","1"
		End
		
		Local main$
		

		main=LoadString("main.cpp")
		PreConfig()
		
		main=ReplaceBlock( main,"TRANSCODE",transCode )
		main=ReplaceBlock( main,"CONFIG",Config() )
		
		If use_wx
			

			
		Endif
		
		
		SaveString main,"main.cpp"

		If OPT_ACTION>=ACTION_BUILD

			Local out$="main_"+HostOS
			DeleteFile out
			
			Print "cc_opts: "+cc_opts
			
			Select ENV_HOST
			Case "macos"
				Select ENV_CONFIG
				Case "release"
					Execute "g++ -arch i386 -read_only_relocs suppress -mmacosx-version-min=10.3 -O3 -o "+out+" main.cpp"+cc_opts
				Case "debug"
					Execute "g++ -arch i386 -read_only_relocs suppress -mmacosx-version-min=10.3 -o "+out+" main.cpp"+cc_opts
				End
			Default
				Select ENV_CONFIG
				Case "release"
					Execute "g++ -O3 -o "+out+" main.cpp "+cc_opts
				Case "profile"
					Execute "g++ -O3 -o "+out+" main.cpp -lwinmm "+cc_opts
				Case "debug"
					Execute "g++ -o "+out+" main.cpp "+cc_opts
				End
			End

			If OPT_ACTION>=ACTION_RUN
				Execute "~q"+RealPath( out )+"~q"
			Endif
		Endif
	End
	
End

