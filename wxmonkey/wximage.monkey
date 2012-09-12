'
'
'wxImage

Import wxmonkey

Extern

	Function wxAddJPEGHandler:Void() = "wxImage::AddHandler(new wxJPEGHandler); //"

Class wxImage Extends wxMonkeyDeref
	
	Function Create:wxImage() = "new wxImage"
	Function Create:wxImage(name:wxMString, mimetype:wxMString, index:Int = -1) = "new wxImage"
	Function Create:wxImage(width:Int, height:Int, clear:Bool=True) = "new wxImage"
	
	Method LoadFile:Bool(name:wxMString, type:Int = wxBITMAP_TYPE_ANY, index:Int = -1)
	
End



Public


