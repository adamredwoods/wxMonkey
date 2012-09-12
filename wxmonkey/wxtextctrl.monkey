''
''wxTextCtrl
''
''-- a text line or multiline input

Import wxmonkey

Extern


Global	wxTE_PROCESS_ENTER	="wxTE_PROCESS_ENTER"
Global	wxTE_PROCESS_TAB	="wxTE_PROCESS_TAB"
Global	wxTE_MULTILINE	="wxTE_MULTILINE"
Global	wxTE_PASSWORD	="wxTE_PASSWORD"
Global	wxTE_READONLY	="wxTE_READONLY"
Global	wxTE_RICH	="wxTE_RICH"
Global	wxTE_RICH2	="wxTE_RICH2"
Global	wxTE_AUTO_URL	="wxTE_AUTO_URL"
Global	wxTE_NOHIDESEL	="wxTE_NOHIDESEL"
Global	wxHSCROLL	="wxHSCROLL"
Global	wxTE_LEFT	="wxTE_LEFT"
Global	wxTE_CENTRE	="wxTE_CENTRE"
Global	wxTE_RIGHT	="wxTE_RIGHT"
Global	wxTE_DONTWRAP	="wxTE_DONTWRAP"
Global	wxTE_CHARWRAP	="wxTE_CHARWRAP"
Global	wxTE_WORDWRAP	="wxTE_WORDWRAP"
Global	wxTE_BESTWRAP	="wxTE_BESTWRAP"
Global	wxTE_CAPITALIZE	="wxTE_CAPITALIZE"

Global  wxTEXT_TYPE_ANY="wxTEXT_TYPE_ANY"


Class wxTextCtrl
	

	Method Create:Bool(parent:wxWindow, id:Int, value:wxMString = wxEmptyString, pos:wxPoint = wxDefaultPosition,
		 size:wxSize = wxDefaultSize, style:Int = 0, validator:wxValidator = wxDefaultValidator,
		 name:wxMString = wxString("TextCtrl"))
		
	Method AppendText:Void(text:wxMString)
	Method Clear:Void()
	'wxTextAttr& GetDefaultStyle()
	Method GetInsertionPoint:Int() ''uses LONG
	Method GetLineText:wxMString(lineNo:Int)
	Method GetValue:wxMString()
	
	Method IsEditable:Bool() 
	Method IsEmpty:Bool() 
	Method IsModified:Bool() 
	Method IsMultiLine:Bool() 
	Method IsSingleLine:Bool() 
	Method LoadFile:Bool(filename:wxMString, fileType:Int = wxTEXT_TYPE_ANY)
	Method MarkDirty:Void()
	Method SaveFile:Bool(filename:wxMString, fileType:Int = wxTEXT_TYPE_ANY)
	Method SetEditable:Void(editable:Bool)
	Method SetInsertionPoint:Void(pos:Int)
	Method SetInsertionPointEnd:Void()
	Method SetMaxLength:Void(len:Int)
	Method SetModified(modified:Bool)
	Method SetSelection:Void(from_pos:Int, to_pos:Int)
	'Bool SetStyle(long start, long End, Const wxTextAttr& style)
	Method SetValue:Void(value:wxMString)
	
End


Public
