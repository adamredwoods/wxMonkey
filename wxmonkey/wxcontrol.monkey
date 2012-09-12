''
''wxControl

Import wxmonkey

Extern


Class wxControl Extends wxEvtHandler

	Method Create:wxButton(parent:wxWindow, id:Int, label:wxMString = wxEmptyString, 
		pos:wxPoint = wxDefaultPosition, size:wxSize = wxDefaultSize, style:Int = 0, 
		validator:wxValidator = wxDefaultValidator, name:wxMString = wxString("control")) = "Create"
		
	Method Command:Void(event:wxCommandEvent)

	Method SetLabel:Void(label:wxMString)
	Method GetLabel:wxMString()

	
End

Public


