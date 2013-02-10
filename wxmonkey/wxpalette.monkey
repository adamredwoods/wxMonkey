''
''wxpalette

Import wxmonkey

Extern

Global wxNullPalette:wxPalette ="wxNullPalette"

Class wxPalette

	Method Create:Bool(n:Int, red:Int, green:Int, blue:Int)
	Method GetColoursCount:Int() 
	Method GetPixel:Int(red:Int, green:Int, blue:Int) 	
	Method IsOk:Bool()

End


Public
