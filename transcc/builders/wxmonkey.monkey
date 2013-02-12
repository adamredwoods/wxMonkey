
Import builder

Class wxTranslator Extends CppTranslator



	Method TransType$( ty:Type )
		Local objty:ObjectType=ObjectType( ty )
		If objty
			
			If ty.GetClass() = "VarPtr" Or (objty.classDecl.superTy And objty.classDecl.superTy.ident = "VarPtr")
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
			If (cl) And ((cl.ident="VarPtr") Or (cl.superClass And cl.superClass="VarPtr"))
				Local newline$ = Super.TransFunc(decl,args,lhs )
				Return newline.Replace("->",".")
				'Return cl.munged+"."+args[0]
				
			Endif
		Endif
		
		
		If decl.IsExtern() And args
			'Print decl.munged
			If decl.munged="FuncPtr"
				
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
			
			If dst.GetClass()="Pointer"
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
					If (oty.GetClass() = "VarPtr" Or (oty.classDecl And oty.classDecl.superTy And oty.classDecl.superTy.ident = "VarPtr"))
						Return 0
					Endif
				Endif
			Endif
		Next
		Return Super.EmitSetErr(info)
	End
	
End


Class wxMonkeyBuilder Extends Builder

	Field cc_opts:String
	
	Global use_wx:Int=0
	

	Method New( tcc:TransCC )
		Super.New( tcc )
	End

	Method PreConfig:Void()
		
		If GetCfgVar("WXMONKEY") Then use_wx = 1
	
			
		If GetCfgVar("CC_OPTS")
			cc_opts=cc_opts+" "+GetCfgVar("CC_OPTS")
	
		Endif

		
	End

	Method Config:String()
		Local config:=New StringStack
		For Local kv:=Eachin _cfgVars
			config.Push "#define CFG_"+kv.Key+" "+kv.Value
		Next
		Return config.Join( "~n" )
	End
	
	Method IsValid:Bool()
		Select HostOS
		Case "winnt"
			If tcc.MINGW_PATH Return True
		Default
			Return True
		End
		Return False
	End

	Method Begin:Void()
		ENV_LANG="cpp"
		_trans=New wxTranslator
	End
	
	Method MakeTarget:Void()
		
		CreateDir casedConfig
		
		CreateDataDir casedConfig+"/data"
		
		Select ENV_CONFIG
		Case "debug" SetCfgVar "DEBUG","1"
		Case "release" SetCfgVar "RELEASE","1"
		Case "profile" SetCfgVar "PROFILE","1"
		End
		
		If GetCfgVar("WXMONKEY") Print "WXMONKEY"
		
		Local main:=LoadString( "main.cpp" )
		
		PreConfig()

		main=ReplaceBlock( main,"TRANSCODE",transCode )
		main=ReplaceBlock( main,"CONFIG",Config() )


		SaveString main,"main.cpp"
		
		If tcc.opt_build

			Local out:=casedConfig+"/wxmain_"+HostOS
			DeleteFile out
			
			Local OPTS:="",LIBS:=""
			
			Select ENV_HOST
			Case "macos"
				OPTS+=" -arch i386 -read_only_relocs suppress -mmacosx-version-min=10.3"
			Case "winnt"
				LIBS+=" -lwinmm -lws2_32"
			End
			
			Select ENV_CONFIG
			Case "release"
				OPTS+=" -O3 -DNDEBUG"
			End

			
			If cc_opts Then Print "g++"+OPTS+" -o "+out+" main.cpp"+LIBS+" "+cc_opts
			Execute "g++"+OPTS+" -o "+out+" main.cpp"+LIBS+" "+cc_opts
			
			If tcc.opt_run
				ChangeDir casedConfig
				
				Execute "~q"+RealPath( "wxmain_"+HostOS )+"~q"
			Endif
		Endif
	End
	
End



