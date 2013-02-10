'' wxMonkey
'' (c) 2012 Adam Piette
''
'' 

#WXMONKEY=1

#if TARGET<>"glfw"
#Error "need monkey target"
#endif


'Import "wxMSW-2.8.12/src/msw/app.cpp"
Import "wxmonkey.cpp"


Import constants
Import wxapp
Import wxaboutbox
Import wxbitmap
Import wxbutton
Import wxboxsizer
Import wxcontrol
Import wxdc
Import wxdialog
Import wxevthandler
Import wxfiledialog
Import wxframe
Import wxglcontext
Import wximage
Import wxmask
Import wxmenu
Import wxmenubar
Import wxmessagedialog
Import wxobject
Import wxpalette
Import wxicon

Import wxpanel
Import wxpoint
Import wxsize
Import wxsizer
Import wxtimer
Import wxrect
Import wxwindow
Import wxvalidator


Import wxtextctrl


''MOJO stuff
#BRL_GAME_IMPORTED=0
#if BRL_GAME_IMPORTED<>0

Import "wxmonkeymojo.cpp"
#endif


Extern

	Function gccollect:Void() = "gc_collect"
	
	Global wxEmptyString:wxMString = "wxT(L~q~q)" '"wxStringConv(String(L~q~q))"
	
	Function wxString:wxMString(s:String)="wxStringConv"
	Function wxString:String(s:wxMString)="wxStringConv"
	
	'Function IMPLEMENT_APP() = "IMPLEMENT_APP"
	
	Function wxEntryStart:Bool() = "wxEntryStart(argc,(wxChar**)argv );//"
	Function wxEntry:Bool() = "wxEntry(argc,(wxChar**)argv );//"
	Function wxEntryCleanup:Bool() = "wxEntryCleanup"
	Function wxInitialize:Bool()
	
	'Function wxConstDeref:wxMonkeyRef(b:wxBitmap) = "*"

	Global teststring:wxMString = "wxT(L~qtest string~q)"
	
	Class wxLong ="long"
	End
	
	Class wxMString ' = "wxMString"
	End
	
	Class wxMString_ Extends VarPtr = "wxString"
	End
	
	Class wxWindowID
	End
	
	''pass by reference, picked up by wxTranslator compiler
	Class VarPtr Extends Null
	End
	
	Class Pointer
	End
	
	
	Class wxInitializer
	
	End
	
	''These functions are picked up by wxTranslator and create a casted function pointer
	Function FuncPtr:Int(f:Void) ''creates a fp
	Function wxEventFunc(f:Int) = "wxEventHandler"
	Function wxCommandFunc:VarPtr (f:Int) = "wxCommandEventHandler" ''use with a casted fp
	Function wxPaintFunc:VarPtr (f:Int) = "wxPaintEventHandler"
	Function wxTimerFunc:VarPtr (f:Int) = "wxTimerEventHandler"
	
	
	Function Implement_App_Monkey:Int(a:wxApp)="IMPLEMENT_APP_MONKEY"
	Function IMPLEMENT_WX_THEME_SUPPORT:Void()="IMPLEMENT_WX_THEME_SUPPORT //"
	'Function IMPLEMENT_WXWIN_MAIN_CONSOLE:Int() = "main(int argc, char **argv) { return wxEntry(argc, argv); } //"
	
	Function gcfree:Void(o:Object) = "delete "

	
	
Public

'' wxMonkeyStart(wxApp)
'' -- this will initialize and begin and cleanup the wxApp
'' -- this can be done manually if there are other things that want to be done. (unit testing, console, etc).
Function wxMonkeyStart(app:wxApp)

	wxTheAppSetInstance(app)

	'New wxInitializer()
	wxEntryStart()
	
	'' crashes on exit if using app.OnExit(), so use the textbook way
	If wxTheAppInstanceInit()
		wxTheAppInstanceRun()
		wxTheAppInstanceExit()
	Else
		Print "wxApp init failure."
	Endif
	
	wxEntryCleanup()

End



