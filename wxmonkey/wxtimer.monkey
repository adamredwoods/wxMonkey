''
''wxTimer

Import wxmonkey

Extern

'Global wxID_TIMER:Int = "wxID_TIMER"

Class wxTimer = "wxMonkeyTimer"
	
	Method Create:Void(owner:wxEvtHandler, id:Int = -1) = "SetOwner"	
	Method SetOwner:Void(owner:wxEvtHandler, id:Int = -1)
	Method Start:Bool(milliseconds:Int = -1, oneShot:Bool = False)
	Method Stop:Void()
	Method IsOneShot:Bool()
	Method IsRunning:Bool()
	
	''override this for trigger
	Method Notify:Void()
	
End


Public
