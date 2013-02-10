''
''wxSizer

Import wxmonkey

Extern

Class wxSizerItem
End

Class wxSizeFlags
End

Global wxTOP:wxSizerFlags = "wxTOP"
Global wxBOTTOM:wxSizerFlags = "wxBOTTOM"
Global wxLEFT:wxSizerFlags = "wxLEFT"
Global wxRIGHT:wxSizerFlags = "wxRIGHT"
Global wxALL:wxSizerFlags = "wxALL"	
Global wxEXPAND	:wxSizerFlags = "wxEXPAND"
Global wxSHAPED	:wxSizerFlags = "wxSHAPED"
Global wxFIXED_MINSIZE	:wxSizerFlags = "wxFIXED_MINSIZE"
Global wxRESERVE_SPACE_EVEN_IF_HIDDEN:wxSizerFlags = "wxRESERVE_SPACE_EVEN_IF_HIDDEN"
Global wxALIGN_CENTER:wxSizerFlags = "wxALIGN_CENTER wxALIGN_CENTRE"
Global wxALIGN_LEFT:wxSizerFlags = "wxALIGN_LEFT"
Global wxALIGN_RIGHT:wxSizerFlags = "wxALIGN_RIGHT"
Global wxALIGN_TOP:wxSizerFlags = "wxALIGN_TOP"
Global wxALIGN_BOTTOM:wxSizerFlags = "wxALIGN_BOTTOM"
Global wxALIGN_CENTER_VERTICAL:wxSizerFlags = "wxALIGN_CENTER_VERTICAL"
Global wxALIGN_CENTER_HORIZONTAL:wxSizerFlags = "wxALIGN_CENTER_HORIZONTAL"

Class wxSizer Extends VarPtr

	Method Add:wxSizerItem(window:wxWindow, flags:wxSizerFlags)
	Method Add:wxSizerItem(window:wxWindow, proportion:Int = 0,flag:Int = 0, border:Int = 0, userData:wxObject = Null)
	Method Add:wxSizerItem(sizer:wxSizer, flags:wxSizerFlags)
	Method Add:wxSizerItem(sizer:wxSizer, proportion:Int = 0, flag:Int = 0, border:Int = 0, userData:wxObject = Null)
	Method Add:wxSizerItem(width:Int, height:Int, proportion:Int = 0, flag:Int = 0, border:Int = 0, userData:wxObject = Null)
	
	Method AddSpacer:wxSizerItem(size:Int)
	Method AddStretchSpacer:wxSizerItem(prop:Int = 1)
	Method CalcMin:wxSize()
	Method Clear:Void(delete_windows:Bool = False)
	Method ComputeFittingClientSize:wxSize(window:wxWindow)
	
	Method Detach:Bool(window:wxWindow)
	Method Detach:Bool(sizer:wxSizer)
	Method Detach:Bool(index:Int)
	Method Fit:wxSize(window:wxWindow)
	Method FitInside:Void(window:wxWindow)

	'wxSizerItemList& GetChildren()

	Method GetContainingWindow:wxWindow()
	Method GetItem:wxSizerItem( window:wxWindow, recursive:Bool = False)	
	Method GetItem:wxSizerItem( sizer:wxSizer, recursive:Bool = False)	
	Method GetItem:wxSizerItem(index:Int)	
	Method GetSize:wxSize()	
	Method GetPosition:wxPoint()	
	Method GetMinSize:wxSize()
	
	Method Hide:Bool(window:wxWindow, recursive:Bool = False)	
	Method Hide:Bool(sizer:wxSizer, recursive:Bool = False)	
	Method Hide:Bool(index:Int)
	
	Method Insert:wxSizerItem(index:Int, window:wxWindow, flags:wxSizerFlags)	
	Method Insert:wxSizerItem(index:Int, window:wxWindow, proportion:Int = 0,flag:Int = 0, border:Int = 0, userData:wxObject = Null)	
	Method Insert:wxSizerItem(index:Int, sizer:wxSizer, flags:wxSizerFlags)	
	Method Insert:wxSizerItem(index:Int, sizer:wxSizer, proportion:Int = 0, flag:Int = 0, border:Int = 0, userData:wxObject = Null)	
	Method Insert:wxSizerItem(index:Int, width:Int, height:Int, proportion:Int = 0, flag:Int = 0, border:Int = 0, userData:wxObject = Null)
	
	Method InsertSpacer:wxSizerItem(index:Int, size:Int)	
	Method InsertStretchSpacer:wxSizerItem(index:Int, prop:Int = 1)	
	Method IsShown:Bool(window:wxWindow)	
	Method IsShown:Bool(sizer:wxSizer) 	
	Method IsShown(index:Int)	
	Method Layout:Void()


	Method Prepend:wxSizerItem(window:wxWindow, flags:wxSizerFlags)
	Method Prepend:wxSizerItem(window:wxWindow, proportion:Int = 0, flag:Int = 0, border:Int = 0, userData:wxObject = Null)
	Method Prepend:wxSizerItem(sizer:wxSizer, flags:wxSizerFlags)
	Method Prepend:wxSizerItem(sizer:wxSizer, proportion:Int = 0, flag:Int = 0, border:Int = 0, userData:wxObject = Null)
	Method Prepend:wxSizerItem(width:Int, height:Int, proportion:Int = 0, flag:Int = 0, border:Int= 0, userData:wxObject = Null)
	Method PrependSpacer:wxSizerItem(size:Int)
	Method PrependStretchSpacer:wxSizerItem(prop:Int = 1)
	Method RecalcSizes:Void()
	
	Method Remove:Bool(window:wxWindow)
	Method Remove:Bool(sizer:wxSizer)
	Method Remove:Bool(index:Int)
	Method Replace:Bool(oldwin:wxWindow,newwin:wxWindow, recursive:Bool = False)
	Method Replace:Bool(oldsz:wxSizer, newsz:wxSizer, recursive:Bool = False)
	Method Remove:Bool(oldindex:Int, newitem:Int)
	Method SetDimension:Void(x:Int, y:Int, width:Int, height:Int)
	Method SetMinSize:Void(width:Int, height:Int)
	Method SetMinSize:Void(size:wxSize)
	Method SetItemMinSize:Void(window:wxWindow, width:Int, height:Int)
	Method SetItemMinSize:Void(sizer:wxSizer, width:Int, height:Int)
	Method SetItemMinSize:Void( index:Int, width:Int, height:Int)

	Method SetSizeHints:Void(window:wxWindow)
	Method SetVirtualSizeHints:Void(window:wxWindow)	
	Method Show:Bool(window:wxWindow, show:Bool = True, recursive:Bool = False)	
	Method Show:Bool(sizer:wxSizer, show:Bool = True, recursive:Bool = False)	
	Method Show:Bool(index:Int, show:Bool = True)
	
	
End



Public
