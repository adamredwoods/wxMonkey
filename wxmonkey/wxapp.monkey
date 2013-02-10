Import wxmonkey


Extern

''use to access the main application
Class wxTheApp Extends VarPtr = "wxTheApp"

	Method OnInit:Int() = "OnInit"
	Method CallOnInit:Bool() = "CallOnInit"
	Method OnRun:Int() = "OnRun"
	Method OnExit:Int() = "OnExit"
	
End

Global wxTheAppInstance:wxTheApp = "wxTheApp"
Function wxTheAppSetInstance:Int(app:wxApp) = "wxApp::SetInstance"
Function wxTheAppInstanceInit:Int() = "wxTheApp->OnInit"
Function wxTheAppInstanceRun:Int() = "wxTheApp->OnRun"
Function wxTheAppInstanceExit:Int() = "wxTheApp->OnExit"

Function wxAppBaseInit:Int() = "wxApp::OnInit"

Class wxApp = "wxMonkeyApp"
	
	
	'' used for initialization
	'Function wxInit:Int() = "OnInit"
	Function SetInstance:Int(app:wxApp)="SetInstance"
	
	#rem
	bbdoc: This must be provided by the application, And will usually create the application's main window, optionally calling wxApp::SetTopWindow.
	about: You may use OnExit To clean up anything initialized here, provided that the Method returns True.
	
	Notice that If you want To To use the command line processing provided by wxWidgets you have To call the
	base type version in the derived type OnInit().

	Return True To Continue processing, False To Exit the application immediately.

	#End
	Method OnInit:Int()="OnMonkeyInit"


	#rem
	bbdoc: Override this Method For any processing which needs To be done as the application is about To Exit.
	about: OnExit is called after destroying all application windows And controls, but before wxWidgets cleanup.
	Note that it is Not called at all If OnInit failed.

	The Return value of this Method is currently ignored, Return the same value as returned by the base Class
	Method If you override it.

	#End
	Method OnExit:Int()

	#rem
	OnRun() does not need to be overloaded, except for non-gui
	#end
	Method OnRun:Int()
	
	'' executes OnRun()
	'' *** If you override MainLoop, you will need to call monkey's gc_collect via a timer
	Method MainLoop:Int()
	
	
	Method SetTopWindow(window:wxWindow)

	Method GetTopWindow:wxWindow()

	Method SetAppName(name:wxMString)

	Method GetAppName:String() ''needs conv

	Method SetVendorName(name:wxMString)

	Method GetVendorName:String() ''needs conv

	Method SetExitOnFrameDelete(flag:Int)

	Method IsActive:Int()

	Method Yield:Int(onlyIfNeeded:Bool = False)

	Method Dispatch:Int()


	Method Pending:Int()
	
	Method ProcessIdle:Int()

	Method FilterEvent:Int(event:wxEvent)
	
	Function wxSafeYield:Int(win:wxWindow = Null, onlyIfNeeded:Bool = False)
	
	Function wxWakeUpIdle()
	
End


Class wxAppBase
	
	Function OnRun:Bool() = "OnRun"
	Function MainLoop:Bool() = "MainLoop"
	
End

Public




