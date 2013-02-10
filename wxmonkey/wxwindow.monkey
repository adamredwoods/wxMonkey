''
''wxwindow

'' NOTES
'' -- GetSize() must be on it's own line
''

Import wxmonkey

Extern

Global	wxBORDER_SIMPLE	="wxBORDER_SIMPLE"
Global	wxBORDER_DOUBLE	="wxBORDER_DOUBLE"
Global	wxBORDER_SUNKEN	="wxBORDER_SUNKEN"
Global	wxBORDER_RAISED	="wxBORDER_RAISED"
Global	wxBORDER_STATIC	="wxBORDER_STATIC"
Global	wxBORDER_THEME	="wxBORDER_THEME"
Global	wxBORDER_NONE	="wxBORDER_NONE"
Global	wxTRANSPARENT_WINDOW	="wxTRANSPARENT_WINDOW"
Global	wxTAB_TRAVERSAL	="wxTAB_TRAVERSAL"
Global	wxWANTS_CHARS	="wxWANTS_CHARS"
Global	wxNO_FULL_REPAINT_ON_RESIZE	="wxNO_FULL_REPAINT_ON_RESIZE"
Global	wxVSCROLL	="wxVSCROLL"
Global	wxHSCROLL	="wxHSCROLL"
Global	wxALWAYS_SHOW_SB	="wxALWAYS_SHOW_SB"
Global	wxCLIP_CHILDREN	="wxCLIP_CHILDREN"
Global	wxFULL_REPAINT_ON_RESIZE	="wxFULL_REPAINT_ON_RESIZE"

''extre styles (use setextrastyle)
Global	wxWS_EX_VALIDATE_RECURSIVELY	="wxWS_EX_VALIDATE_RECURSIVELY"
Global	wxWS_EX_BLOCK_EVENTS	="wxWS_EX_BLOCK_EVENTS"
Global	wxWS_EX_TRANSIENT	="wxWS_EX_TRANSIENT"
Global	wxWS_EX_CONTEXTHELP	="wxWS_EX_CONTEXTHELP"
Global	wxWS_EX_PROCESS_IDLE	="wxWS_EX_PROCESS_IDLE"
Global	wxWS_EX_PROCESS_UI_UPDATES	="wxWS_EX_PROCESS_UI_UPDATES"


''

Global wxSIZE_AUTO = "wxSIZE_AUTO"



Class wxWindow Extends wxEvtHandler

	Method Close:Bool(force:Bool = False)
	Method Disable:Bool()
	Method Destroy:Bool()
	Method DestroyChildren:Void()
	Method Enable:Bool(enable:Bool = True)
	Function FindFocus:wxWindow()="FindFocus"
	Method FindWindow:wxWindow(id:Int)
	Method Fit:Void()
	Method GetId:Int()
	Method GetParent:wxWindow()
	Method GetSize:wxSize()="wxMonkeyGetSize" ' "new wxSize(GetSize().x, GetSize().y);//"
	
	Method RegisterHotKey:Bool(hotkeyId:Int, modifiers:Int, virtualKeyCode:Int)
	Method Reparent:Bool(newParent:wxWindow)
	
	Method SetExtraStyle:Void(exStyle:Int)
	Method SetFocus:Void()
	Method SetLabel:Void(label:wxMString)
	Method SetMaxSize:Void(size:wxSize)
	Method SetMinSize:Void(size:wxSize)
	Method SetScrollbar:Void(orientation:Int, position:Int, thumbSize:Int, range:Int, refresh:Bool = True)
	Method SetScrollPos:Void(orientation:Int, pos:Int, refresh:Bool = True)
	Method SetSize:Void(x:Int, y:Int, width:Int, height:Int, sizeFlags:Int = wxSIZE_AUTO)
	Method SetSize:Void(rect:wxRect)
	Method SetSize:Void(width:Int, height:Int)
	Method SetSize:Void(size:wxSize)
	Method SetToolTip:Void(tip:wxMString)
	
	Method UnregisterHotKey:Bool(hotkeyId:Int)

End

Public
