'' wxMonkey
'' (c) 2012 Adam Piette
''
'' 

#WXMONKEY=1

'Import "wxMSW-2.8.12/src/msw/app.cpp"
Import "wxmonkey.cpp"


Import constants
Import wxapp
Import wxaboutbox
Import wxbitmap
Import wxbutton
Import wxcontrol
Import wxdc
Import wxdialog
Import wxevthandler
Import wxfiledialog
Import wxframe
Import wximage
Import wxmask
Import wxmenu
Import wxmenubar
Import wxmessagedialog
Import wxobject
Import wxicon

Import wxpanel
Import wxpoint
Import wxsize
Import wxtimer
Import wxrect
Import wxwindow
Import wxvalidator


Import wxtextctrl


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
	
	Class wxMString_ Extends wxMonkeyRef = "wxString"
	End
	
	Class wxWindowID
	End
	
	''pass by reference, picked up by wxTranslator compiler
	Class wxMonkeyRef 'Extends Null
	End
	
	Class wxMonkeyDeref
	End
	
	
	Class wxInitializer
	
	End
	
	''These functions are picked up by wxTranslator and create a casted function pointer
	Function wxFuncPtr:Int(f:Void) ''creates a fp
	Function wxCommandFunc:wxMonkeyRef(f:Int) = "wxCommandEventHandler" ''use with a casted fp
	Function wxPaintFunc:wxMonkeyRef(f:Int) = "wxPaintEventHandler"
	
	
	Function Implement_App_Monkey:Int(a:wxApp)="IMPLEMENT_APP_MONKEY"
	Function IMPLEMENT_WX_THEME_SUPPORT:Void()="IMPLEMENT_WX_THEME_SUPPORT //"
	'Function IMPLEMENT_WXWIN_MAIN_CONSOLE:Int() = "main(int argc, char **argv) { return wxEntry(argc, argv); } //"
	
	Function gcfree:Void(o:Object) = "delete "

	
	
Public

'' wxMonkeyStart(wxApp)
'' -- this will initialize and begin and cleanup the wxApp
'' -- this can be done manually if there are other things that want to be done. (unit testing, console, etc).
Function wxMonkeyStart(app:wxApp)

	wxApp.SetInstance(app)
	'New wxInitializer()
	
	wxEntryStart()

	If wxTheApp.OnInit()
		wxTheApp.OnRun()
		wxTheApp.OnExit()
	Endif
	
	wxEntryCleanup()

End



