'
'wxpanel

Import wxmonkey

Extern


Class wxPanel Extends wxWindow = "wxMonkeyPanel"
	
	Method Create:wxPanel(parent:wxWindow, id:Int = wxID_ANY, pos:wxPoint = wxDefaultPosition,
			size:wxSize = wxDefaultSize, style:Int = wxTAB_TRAVERSAL, name:wxMString = wxString("panel")) '= "new wxMonkeyPanel"


End

Function test3:wxPanel() = "f_paintpanel=static_cast<bb_wx_bitmap_app_PaintPanel*>(t_m);//"

Public

#rem
Class wxPanel Extends wxMonkeyPanel
	
	Function Create:wxPanel(parent:wxWindow, id:Int = 0, pos:wxPoint = wxDefaultPosition,
			size:wxSize = wxDefaultSize, style:Int = wxTAB_TRAVERSAL, name:String = "panel")
			Local m:wxPanel = New wxPanel
			If id=0 Then id = wxID_ANY
			wxMonkeyPanel(m).Create_(parent,id,pos,size,style,wxString(name))
			Return m
	End
	
End
#end

