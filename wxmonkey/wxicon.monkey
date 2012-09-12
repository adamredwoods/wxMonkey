''
''wxbitmap

Import wxmonkey

Extern


Global wxBITMAP_TYPE_ICO:Int="wxBITMAP_TYPE_ICO"
Global wxBITMAP_TYPE_ICO_RESOURCE:Int="wxBITMAP_TYPE_ICO_RESOURCE"


Class wxIcon
	
	Method CopyFromBitmap:Void(bmp:wxBitmap)
	Method GetDepth:Int() 
	Method GetHeight:Int() 
	Method GetWidth:Int() 
	Method LoadFile:Bool(name:wxMString, type_const:Int)
	Method IsOk:Bool() 
	Method SetDepth:Void(depth:Int)
	Method SetHeight:Void(height:Int)
	Method SetWidth:Void(width:Int)


End


Public