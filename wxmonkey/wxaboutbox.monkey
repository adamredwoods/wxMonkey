' Copyright (c) 2007,2008 Bruce A Henderson
' 
' 

Import wxmonkey

Extern

Function wxAboutBox(info:wxAboutDialogInfo)

Class wxAboutDialogInfo Extends wxDialog

	Method Create:wxAboutDialogInfo()

	Method AddArtist(name:wxMString)

	Method AddDeveloper(name:wxMString)

	Method AddDocWriter(name:wxMString)

	Method AddTranslator(name:wxMString)

	Method SetArtists(names:wxMString[])

	Method SetCopyright(copyright:wxMString)

	Method SetDescription(desc:wxMString)

	Method SetDevelopers(names:wxMString[])

	Method SetDocWriters(names:wxMString[])
	
	Method SetIcon(icon:wxIcon)

	Method SetLicence(licence:wxMString)

	Method SetLicense(licence:wxMString)

	Method SetName(name:wxMString)

	Method SetTranslators(names:wxMString[])

	Method SetVersion(version:wxMString)

	Method SetWebSite(url:wxMString, desc:wxMString= Null)
	
	Method Delete()
	
End

