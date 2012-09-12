''
''wxpoint

Import wxmonkey

Extern

Global wxDefaultPosition:wxPoint = "wxDefaultPosition"

Function wxCreatePoint:wxPoint(x:Int,y:Int) = "wxPoint"

Class wxPoint

	Field x:Int
	Field y:Int
	
	Function Create:wxPoint(x:Int,y:Int) = "new wxPoint"
	
End

Public

