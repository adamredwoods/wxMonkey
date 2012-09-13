
#include <wx/wxprec.h>
#ifndef WX_PRECOMP
    #include "wx/wx.h"
#endif


#define IMPLEMENT_APP_MONKEY(app) wxAppInitializer wxTheAppInitializer((wxAppInitializerFunction) app); 



wxString wxStringConv(const String& s) { 
	int n = s.Length();
	if (n<1) return wxT(L"");
	//Char* q=(Char*)malloc( (n+1)*sizeof(Char));
	Char q[n];
	memcpy( q,const_cast<Char*>(s.Data()), (n)*sizeof(Char) );
	q[n]=L'\0';
	//return p+n;
	//return wxString(s.ToCString<char>());
	//return wxString::wxString(q, wxMBConvUTF16, n+1);

	return  wxString(q);
	
	}; //return wxString::wxString(s.ToCString<char>() ); };
	
//String wxStringConv(const wxString& s) { return String( s.wc_str(wxConvLibc), s.Len() ); };
#ifdef __OBJC__

String wxStringConv(const wxString& s) { NSString* nss= [NSString stringWithUTF8String: wxstring.mb_str(wxConvUTF8)] ); return String(nss); }; 

#else

String wxStringConv(const wxString& s) { return String( s.wc_str(wxConvUTF8) ); };

#endif


class wxMString : public wxString {
public:
	wxMString () {};
	~wxMString () {};
	//wxString* wxMString (const String& s) { return new wxString(s.ToCString<char>() ); }
};


class GCTimer : public wxTimer {
public:
	//GCTimer(wxEvtHandler* e=NULL, int id=-1):wxTimer(e, id) {};
	gc_object* force;
	
	void Notify() {
		//gc_force();
		gc_object* force = new gc_object;
		force=0;
		gc_collect();
		
	}
};

//const int TIMER_ID = wxID_ANY;

class wxMonkeyApp : public Object, public wxApp {
public:	
	
	wxMonkeyApp() {};

	~wxMonkeyApp() {
		
		delete gctimer;
	
	};

	void mark() {
		//printf("wxappMARK\n"); fflush(stdout);
		Object::mark();
	};

	
	virtual bool OnInit();
	//int MainLoop();
	virtual bool OnMonkeyInit()=0;
	
	GCTimer* gctimer;
	//wxTimer* gctimer;
	
};



bool wxMonkeyApp::OnInit() {
	//setup gctimer here, not ctor, will override others otherwise (weird wx thing)
	gctimer = new GCTimer();
	gctimer->Start(1000);
	OnMonkeyInit();
};

/*
int wxMonkeyApp::MainLoop() {
	//setup gctimer here, not ctor, will override others otherwise (weird wx thing)
			
	// include the monkey GC here, trigger every 2 secs
	gctimer = new GCTimer();
	gctimer->Start(2000, wxTIMER_CONTINUOUS);
	return wxAppBase::MainLoop();
}*/



class wxMonkeyFrame :  public Object, public wxFrame {
public:	
	wxMonkeyFrame();
	~wxMonkeyFrame();
	//wxMonkeyFrame(wxString str);
	//wxMonkeyFrame(const wxString& title);
	//bool Create_(wxWindow* parent, int id, wxString str);
	
	void mark() {
		//printf("mframeMARK\n"); fflush(stdout);
		//Object::mark();
	};
		
	void OnQuit(wxCommandEvent& event);
    void OnAbout(wxCommandEvent& event);


};

wxMonkeyFrame::wxMonkeyFrame() {
};
	
wxMonkeyFrame::~wxMonkeyFrame() {
};




class wxMonkeyPanel : public Object, public wxPanel {
public:	
	
	wxMonkeyPanel(wxWindow* parent, wxWindowID id = wxID_ANY, const wxPoint& pos=wxDefaultPosition, const wxSize& size=wxDefaultSize, long style=0, const wxString& name = wxT(L"panel")) : wxPanel(parent,id,pos,size,style,name) {};
	
	static wxMonkeyPanel* Create_(wxWindow* parent, wxWindowID id = wxID_ANY, const wxPoint& pos=wxDefaultPosition, const wxSize& size=wxDefaultSize, long style=0, const wxString& name= wxT(L"panel")) { 
		return new wxMonkeyPanel(parent,id,pos,size,style,name);
		}
		
	wxMonkeyPanel() ;
	~wxMonkeyPanel() ;
	void mark() {
		//Object::mark();
		//printf("mpanelMARK\n"); fflush(stdout);
	};

	//String debug() {};
};

wxMonkeyPanel::wxMonkeyPanel() {};
wxMonkeyPanel::~wxMonkeyPanel() {};

class wxMonkeyDialog : public wxDialog {
public:
	wxMonkeyDialog(wxWindow* parent, wxWindowID id=wxID_ANY, const wxString& title=wxEmptyString, const wxPoint& pos = wxDefaultPosition, const wxSize& size = wxDefaultSize, long style = wxDEFAULT_DIALOG_STYLE, const wxString& name = "dialogBox");
	wxMonkeyDialog() :wxDialog( ) {};
	~wxMonkeyDialog() {};
	//void mark() { Object::mark(); };
};

class wxMonkeyFileDialog : public wxFileDialog {
public:
	wxMonkeyFileDialog() :wxFileDialog(NULL) {};
	~wxMonkeyFileDialog() {};
	//void mark() { Object::mark(); };
};

class wxMonkeyMessageDialog : public wxMessageDialog {
public:
	wxMonkeyMessageDialog() :wxMessageDialog(NULL,L"") {};
	~wxMonkeyMessageDialog() {};
	bool Create(wxWindow* parent, const wxString& title, const wxString& caption, long style = wxDEFAULT_DIALOG_STYLE, const wxPoint& pos = wxDefaultPosition);
	//void mark() { Object::mark(); };
};

bool wxMonkeyMessageDialog::Create(wxWindow* parent, const wxString& title, const wxString& caption, long style , const wxPoint& pos ) {
	m_caption = caption;
    m_message = title;
    m_parent = parent;
    SetMessageDialogStyle(style);
	//this line probably doesn't do anything
	return wxMessageDialog::Create(parent, wxID_ANY, title, pos, wxDefaultSize, style | wxCAPTION , L"");
};

class wxMonkeyDC : public Object {
public:
	wxMonkeyDC() {};
	~wxMonkeyDC() {};
	void mark() { Object::mark(); };
};

class wxMonkeyTimer :  public Object, public wxTimer {
public:
	wxMonkeyTimer() {};
	~wxMonkeyTimer() {};
	void mark() { 
		Object::mark();
	};

	
	//void Notify() {};
};



// ***** WORKS with GC! ******
class wxMonkeyBitmap :  public Object, public wxBitmap {
public:

    //wxMonkeyBitmap(const wxString& name, wxBitmapType type = wxBITMAP_TYPE_BMP_RESOURCE) : wxBitmap(name,type) {};
	bool Create(const wxString& name, wxBitmapType type = wxBITMAP_TYPE_BMP_RESOURCE) { return this->LoadFile(name,type);};
	
    //wxMonkeyBitmap(const void* data, long type, int width, int height, int depth = -1) : wxBitmap(data,type,width,height,depth) {};

    //wxMonkeyBitmap(int width, int height, int depth = -1): wxBitmap(width,height,depth) {};
	
	wxMonkeyBitmap();
	//~wxMonkeyBitmap() { Print(L"wxbitmap delete"); };
	
	void mark() { 
		//printf("mbMARK: %p\n",this);
		//fflush(stdout);
		Object::mark(); 
	}
/*	
	void *operator new( size_t size ){
		printf("mbNEW: %i\n",size);
		fflush(stdout);
		return gc_malloc( size );
	}
	
	void operator delete( void *p ){
		printf("mbDELETE\n");
		fflush(stdout);
		gc_free( (gc_object*)p );
	}*/
};
wxMonkeyBitmap::wxMonkeyBitmap() :wxBitmap() {};

/*
// ***** WORKS with GC! ******
class wxMonkeyBitmap2 : public Object {
public:

    static wxMonkeyBitmap2* Create_(const wxString& name, wxBitmapType type = wxBITMAP_TYPE_BMP_RESOURCE) {
		wxMonkeyBitmap2* mb = new wxMonkeyBitmap2; 
		mb->bitmap = new wxBitmap(name,type);
		return mb;
		};

    static wxMonkeyBitmap2* Create_(const void* data, long type, int width, int height, int depth = -1) {
		wxMonkeyBitmap2* mb= new wxMonkeyBitmap2;
		mb->bitmap = new wxBitmap(data,type,width,height,depth);
		return mb;
		};

    static wxMonkeyBitmap2* Create_(int width, int height, int depth = -1) {
		wxMonkeyBitmap2* mb= new wxMonkeyBitmap2;
		mb->bitmap = new wxBitmap(width,height,depth);
		return mb;
		};

	static wxMonkeyBitmap2* Create_() { 
		wxMonkeyBitmap2* mb= new wxMonkeyBitmap2;
		mb->bitmap = new wxBitmap();
		return mb;
		};
	~wxMonkeyBitmap2() {
		Print (L"bm delete");
		delete bitmap;
		};
	
	bool LoadFile(const wxString& file, wxBitmapType type = wxBITMAP_TYPE_JPEG) {
		return bitmap->LoadFile(file,type);
	}
	
	
	void mark() {Object::mark(); gc_mark_q(bitmap); };
	
	operator const wxBitmap&() const { return *bitmap; };
	
private:
	wxBitmap* bitmap;
	
};

*/