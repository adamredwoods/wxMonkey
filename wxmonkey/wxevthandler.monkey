'
'wxEventHandler

Import wxmonkey

Extern

Global wxEVT_MOVE="wxEVT_MOVE"
Global wxEVT_SIZE="wxEVT_SIZE"
Global wxEVT_PAINT = "wxEVT_PAINT"
Global wxEVT_TIMER = "wxEVT_TIMER"

Global wxEVT_COMMAND_SET_FOCUS = "wxEVT_COMMAND_SET_FOCUS"
Global wxEVT_COMMAND_KILL_FOCUS = "wxEVT_COMMAND_KILL_FOCUS"

''item or command event
Global	 wxEVT_COMMAND_BUTTON_CLICKED	=" wxEVT_COMMAND_BUTTON_CLICKED"
Global	 wxEVT_COMMAND_CHECKBOX_CLICKED	=" wxEVT_COMMAND_CHECKBOX_CLICKED"
Global	 wxEVT_COMMAND_CHOICE_SELECTED	=" wxEVT_COMMAND_CHOICE_SELECTED"
Global	 wxEVT_COMMAND_LISTBOX_SELECTED	=" wxEVT_COMMAND_LISTBOX_SELECTED"
Global	 wxEVT_COMMAND_LISTBOX_DOUBLECLICKED	=" wxEVT_COMMAND_LISTBOX_DOUBLECLICKED"
Global	 wxEVT_COMMAND_TEXT_UPDATED	=" wxEVT_COMMAND_TEXT_UPDATED"
Global	 wxEVT_COMMAND_TEXT_ENTER	=" wxEVT_COMMAND_TEXT_ENTER"
Global	 wxEVT_COMMAND_MENU_SELECTED	=" wxEVT_COMMAND_MENU_SELECTED"
Global	 wxEVT_COMMAND_SLIDER_UPDATED	=" wxEVT_COMMAND_SLIDER_UPDATED"
Global	 wxEVT_COMMAND_RADIOBOX_SELECTED	=" wxEVT_COMMAND_RADIOBOX_SELECTED"
Global	 wxEVT_COMMAND_RADIOBUTTON_SELECTED	=" wxEVT_COMMAND_RADIOBUTTON_SELECTED"
Global	 wxEVT_COMMAND_SCROLLBAR_UPDATED	=" wxEVT_COMMAND_SCROLLBAR_UPDATED"
Global	 wxEVT_COMMAND_VLBOX_SELECTED	=" wxEVT_COMMAND_VLBOX_SELECTED"
Global	 wxEVT_COMMAND_COMBOBOX_SELECTED	=" wxEVT_COMMAND_COMBOBOX_SELECTED"
Global	 wxEVT_COMMAND_TOGGLEBUTTON_CLICKED	=" wxEVT_COMMAND_TOGGLEBUTTON_CLICKED"


''mouse events
Global	wxEVT_LEFT_DOWN	="wxEVT_LEFT_DOWN"
Global	 wxEVT_LEFT_UP	=" wxEVT_LEFT_UP"
Global	 wxEVT_MIDDLE_DOWN	=" wxEVT_MIDDLE_DOWN"
Global	 wxEVT_MIDDLE_UP	=" wxEVT_MIDDLE_UP"
Global	 wxEVT_RIGHT_DOWN	=" wxEVT_RIGHT_DOWN"
Global	 wxEVT_RIGHT_UP	=" wxEVT_RIGHT_UP"
Global	 wxEVT_MOTION	=" wxEVT_MOTION"
Global	 wxEVT_ENTER_WINDOW	=" wxEVT_ENTER_WINDOW"
Global	 wxEVT_LEAVE_WINDOW	=" wxEVT_LEAVE_WINDOW"
Global	 wxEVT_LEFT_DCLICK	=" wxEVT_LEFT_DCLICK"
Global	 wxEVT_MIDDLE_DCLICK	=" wxEVT_MIDDLE_DCLICK"
Global	 wxEVT_RIGHT_DCLICK	=" wxEVT_RIGHT_DCLICK"
Global	 wxEVT_NC_LEFT_DOWN	=" wxEVT_NC_LEFT_DOWN"
Global	 wxEVT_NC_LEFT_UP	=" wxEVT_NC_LEFT_UP"
Global	 wxEVT_NC_MIDDLE_DOWN	=" wxEVT_NC_MIDDLE_DOWN"
Global	 wxEVT_NC_MIDDLE_UP	=" wxEVT_NC_MIDDLE_UP"
Global	 wxEVT_NC_RIGHT_DOWN	=" wxEVT_NC_RIGHT_DOWN"
Global	 wxEVT_NC_RIGHT_UP	=" wxEVT_NC_RIGHT_UP"
Global	 wxEVT_NC_MOTION	=" wxEVT_NC_MOTION"
Global	 wxEVT_NC_ENTER_WINDOW	=" wxEVT_NC_ENTER_WINDOW"
Global	 wxEVT_NC_LEAVE_WINDOW	=" wxEVT_NC_LEAVE_WINDOW"
Global	 wxEVT_NC_LEFT_DCLICK	=" wxEVT_NC_LEFT_DCLICK"
Global	 wxEVT_NC_MIDDLE_DCLICK	=" wxEVT_NC_MIDDLE_DCLICK"
Global	 wxEVT_NC_RIGHT_DCLICK	=" wxEVT_NC_RIGHT_DCLICK"

''keyboard events
Global	 wxEVT_CHAR	=" wxEVT_CHAR"
Global	 wxEVT_CHAR_HOOK	=" wxEVT_CHAR_HOOK"
Global	 wxEVT_KEY_DOWN	=" wxEVT_KEY_DOWN"
Global	 wxEVT_KEY_UP	=" wxEVT_KEY_UP"
Global	 wxEVT_HOTKEY	=" wxEVT_HOTKEY"


''joystick events
Global	 wxEVT_JOY_BUTTON_DOWN	=" wxEVT_JOY_BUTTON_DOWN"
Global	 wxEVT_JOY_BUTTON_UP	=" wxEVT_JOY_BUTTON_UP"
Global	 wxEVT_JOY_MOVE	=" wxEVT_JOY_MOVE"
Global	 wxEVT_JOY_ZMOVE	=" wxEVT_JOY_ZMOVE"


Global wxEVT_DROP_FILES="wxEVT_DROP_FILES"

Global wxEVT_UPDATE_UI="wxEVT_UPDATE_UI"

''mouse capture lost for app
Global wxEVT_MOUSE_CAPTURE_CHANGED="wxEVT_MOUSE_CAPTURE_CHANGED"
Global wxEVT_MOUSE_CAPTURE_LOST="wxEVT_MOUSE_CAPTURE_LOST"

''copy/paste/cut events
Global wxEVT_COMMAND_TEXT_COPY ="wxEVT_COMMAND_TEXT_COPY"
Global wxEVT_COMMAND_TEXT_CUT ="wxEVT_COMMAND_TEXT_CUT"
Global wxEVT_COMMAND_TEXT_PASTE ="wxEVT_COMMAND_TEXT_PASTE"



Function ProcessWindowEvent(x:VarPtr) = "ProcessWindowEvent"

Class wxEvtHandler ="wxMonkeyEvtHandler" 'Extends VarPtr 'Extends Null
	
	Method Connect:Void(id:Int, lastId:Int, eventType:Int, f:VarPtr, userData:wxObject = Null, eventSink:wxEvtHandler = Null)

	Method Connect:Void(id:Int, eventType:Int, f:VarPtr, userData:wxObject = Null, eventSink:wxEvtHandler = Null)

	Method Connect:Void(eventType:Int, f:VarPtr, userData:wxObject = Null, eventSink:wxEvtHandler = Null)
	
	Method ProcessEvent:Bool(x:VarPtr) 
End


Class wxCommandEvent Extends VarPtr
	Method GetString:wxMString()
End

Class wxPaintEvent Extends VarPtr

End

Class wxClientEvent Extends VarPtr

End

Class wxTimerEvent Extends VarPtr

End

Class wxKeyEvent Extends VarPtr

End

Class wxIdleEvent Extends VarPtr

End

Class wxFocusEvent Extends VarPtr

End

Class wxJoystickEvent Extends VarPtr

End

Class wxMouseEvent Extends VarPtr

End

Public


