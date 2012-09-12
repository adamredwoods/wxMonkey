''
''wxbutton

Import wxmonkey

Extern

Global	wxBU_LEFT	="wxBU_LEFT"
Global	wxBU_TOP	="wxBU_TOP"
Global	wxBU_RIGHT	="wxBU_RIGHT"
Global	wxBU_BOTTOM	="wxBU_BOTTOM"
Global	wxBU_EXACTFIT	="wxBU_EXACTFIT"
Global	wxNO_BORDER	="wxNO_BORDER"


Class wxButton Extends wxControl

	Method Create:wxButton(parent:wxWindow, id:Int, label:wxMString = wxEmptyString, 
		pos:wxPoint = wxDefaultPosition, size:wxSize = wxDefaultSize, style:Int = 0, 
		validator:wxValidator = wxDefaultValidator, name:wxMString = wxString("button")) = "Create"
	Method SetDefault:Void()
	Method SetLabel:Void(label:wxMString)
	Method GetLabel:wxMString()
	Method GetDefaultSize:wxSize()
	
End

Public