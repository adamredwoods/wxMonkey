''
''wxbitmap

Import wxmonkey

Extern

	Global wxBITMAP_TYPE_BMP = "wxBITMAP_TYPE_BMP"
	Global wxBITMAP_TYPE_BMP_RESOURCE	="wxBITMAP_TYPE_BMP_RESOURCE"
	Global wxBITMAP_TYPE_PICT_RESOURCE	 ="wxBITMAP_TYPE_PICT_RESOURCE"
	Global wxBITMAP_TYPE_GIF	 ="wxBITMAP_TYPE_GIF"
	Global wxBITMAP_TYPE_XBM	 ="wxBITMAP_TYPE_XBM"
	Global wxBITMAP_TYPE_XPM	="wxBITMAP_TYPE_XPM"
	Global wxBITMAP_TYPE_JPEG = "wxBITMAP_TYPE_JPEG"
	Global wxBITMAP_TYPE_PNG = "wxBITMAP_TYPE_PNG"
	Global wxBITMAP_TYPE_ANY = "wxBITMAP_TYPE_ANY"
	
	Function wxInitAllImageHandlers:Void()="wxInitAllImageHandlers"

	

Class wxJPEGHandler Extends wxBitmapHandler = "wxJPEGHandler"
End

Class wxBitmap Extends wxMonkeyDeref= "wxMonkeyBitmap"
	
	Function AddHandler:Void( handler:wxBitmapHandler )="wxBitmap::AddHandler"
	Method CleanUpHandlers:Void()
	Method ConvertToImage:wxImage()
	Method CopyFromIcon(icon:wxIcon)
	
	Method Create:wxBitmap(filename:wxMString, bitmap_type:Int) '="Create_" '= "new wxMonkeyBitmap"
	Method Create:wxBitmap(width:Int, height:Int, depth:Int = -1) '="Create_" '= "new wxMonkeyBitmap"
	Method Create:wxBitmap(bitmap:wxMonkeyDeref) '="Create_" '= "new wxMonkeyBitmap"
	'Method Create:Bool(Const Void* data, type:Int, width:Int, height:Int, depth:Int = -1)
	
	Function FindHandler:wxBitmapHandler(name:wxMString) = "FindHandler"
	Function FindHandler:wxBitmapHandler(extension:wxMString, bitmapType_const:Int) = "FindHandler"
	
	Method GetDepth:Int()
	'Method GetHandlers:wxList()
	Method GetHeight:Int()
	Method GetPalette:wxPalette() 
	Method GetMask:wxMask() 
	Method GetWidth:Int() 
	Method GetSubBitmap:wxBitmap(rect:wxRect) 
	Method InitStandardHandlers:Void()
	Method InsertHandler:Void(handler:wxBitmapHandler)
	Method LoadFile:Bool(name:wxMString, bitmap_type:Int) '="LoadFile(wxT(L~qH:\\_work\\software_dev\\_monkey\\wxMonkey\\183.jpg~q),wxBITMAP_TYPE_JPEG );//"

	Method IsOk:Bool()
	Method SaveFile:Bool(name:wxMString, bitmap_type:Int, palette:wxPalette = Null)
	
	Method SetDepth:Void(depth:Int)
	Method SetHeight:Void(height:Int)
	Method SetMask:Void(mask:wxMask)
	Method SetPalette:Void(palette:wxPalette)
	Method SetWidth:Void(width:Int)

	
End


Class wxBitmapHandler

End

Public
