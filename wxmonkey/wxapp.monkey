Import wxmonkey


Extern

''use to access the main application
Class wxTheApp

	Function OnInit:Bool() = "wxTheApp->OnInit"
	Function CallOnInit:Bool() = "wxTheApp->CallOnInit"
	Function OnRun:Bool() = "wxTheApp->OnRun"
	Function OnExit:Bool() = "wxTheApp->OnExit"
	
End



Class wxApp = "wxMonkeyApp"
	
	
	'' used for initialization
	Function wxInit:Bool() = "wxApp::OnInit"
	Function SetInstance:Int(app:wxApp)="wxApp::SetInstance"
	
	#rem
	bbdoc: This must be provided by the application, And will usually create the application's main window, optionally calling wxApp::SetTopWindow.
	about: You may use OnExit To clean up anything initialized here, provided that the Method returns True.
	
	Notice that If you want To To use the command line processing provided by wxWidgets you have To call the
	base type version in the derived type OnInit().

	Return True To Continue processing, False To Exit the application immediately.

	#End
	Method OnInit:Bool()="OnMonkeyInit"


	#rem
	bbdoc: Override this Method For any processing which needs To be done as the application is about To Exit.
	about: OnExit is called after destroying all application windows And controls, but before wxWidgets cleanup.
	Note that it is Not called at all If OnInit failed.

	The Return value of this Method is currently ignored, Return the same value as returned by the base Class
	Method If you override it.

	#End
	Method OnExit:Bool()

	#rem
	OnRun() does not need to be overloaded, except for non-gui
	#end
	Method OnRun:Bool()
	
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
	
	Function OnRun:Bool() = "wxAppBase::OnRun"
	Function MainLoop:Bool() = "wxAppBase::MainLoop"
	
End

Public
