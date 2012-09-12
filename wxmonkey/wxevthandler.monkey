'
'wxEventHandler

Import wxmonkey

Extern




Global wxEVT_COMMAND_MENU_SELECTED = "wxEVT_COMMAND_MENU_SELECTED"
Global wxEVT_COMMAND_BUTTON_CLICKED = "wxEVT_COMMAND_BUTTON_CLICKED"
Global wxEVT_PAINT = "wxEVT_PAINT"
Global wxEVT_COMMAND_TEXT_UPDATED = "wxEVT_COMMAND_TEXT_UPDATED"
Global wxEVT_COMMAND_TEXT_ENTER = "wxEVT_COMMAND_TEXT_ENTER"
Global wxEVT_COMMAND_SET_FOCUS = "wxEVT_COMMAND_SET_FOCUS"
Global wxEVT_COMMAND_KILL_FOCUS = "wxEVT_COMMAND_KILL_FOCUS"

Function ProcessWindowEvent(x:wxMonkeyRef) = "ProcessWindowEvent"

Class wxEvtHandler 'Extends Null
	
	Method Connect:Void(id:Int, lastId:Int, eventType:Int, f:wxMonkeyRef, userData:wxObject = Null, eventSink:wxEvtHandler = Null)

	Method Connect:Void(id:Int, eventType:Int, f:wxMonkeyRef, userData:wxObject = Null, eventSink:wxEvtHandler = Null)

	Method Connect:Void(eventType:Int, f:wxMonkeyRef, userData:wxObject = Null, eventSink:wxEvtHandler = Null)
	
	Method ProcessEvent:Bool(x:wxMonkeyRef) 
End


Class wxCommandEvent Extends wxMonkeyRef
	Method GetString:wxMString()
End

Class wxPaintEvent Extends wxMonkeyRef

End

Class wxClientEvent Extends wxMonkeyRef

End

Class wxTimerEvent Extends wxMonkeyRef

End

Class wxKeyEvent Extends wxMonkeyRef

End

Class wxIdleEvent Extends wxMonkeyRef

End

Class wxFocusEvent Extends wxMonkeyRef

End

Class wxJoystickEvent Extends wxMonkeyRef

End

Class wxMouseEvent Extends wxMonkeyRef

End

Public


