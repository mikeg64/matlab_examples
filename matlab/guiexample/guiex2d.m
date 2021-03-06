function varargout = guiex2d(varargin)
global temp pres volt
% GUIEX2D M-file for guiex2d.fig
%      GUIEX2D, by itself, creates a new GUIEX2D or raises the existing
%      singleton*.
%
%      H = GUIEX2D returns the handle to a new GUIEX2D or the handle to
%      the existing singleton*.
%
%      GUIEX2D('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIEX2D.M with the given input arguments.
%
%      GUIEX2D('Property','Value',...) creates a new GUIEX2D or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiex2d_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiex2d_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help guiex2d

% Last Modified by GUIDE v2.5 02-Feb-2006 14:01:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiex2d_OpeningFcn, ...
                   'gui_OutputFcn',  @guiex2d_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before guiex2d is made visible.
function guiex2d_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiex2d (see VARARGIN)

% Choose default command line output for guiex2d
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiex2d wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiex2d_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
   axes( handles.axes1 );
   cla;
   data_index = get( hObject , 'Value' );
   switch data_index
       case 1
           plot_data = handles.temp ;
           plot_title = 'TEMPERATURE VARIATION ';
       case 2 
           plot_data = handles.pres;
           plot_title = 'PRESSURE VARIATION ' ;        
       case 3 
           plot_data = handles.volt;
           plot_title = 'VOLTAGE VARIATION ' ;         
   end
   plot(plot_data) ;
   set( handles.graphlabel ,'String' , plot_title );
 % Update handles structure
   guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in smooth.
function smooth_Callback(hObject, eventdata, handles)
% hObject    handle to smooth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of smooth


% --- Executes on slider movement.
function smoothfactor_Callback(hObject, eventdata, handles)
% hObject    handle to smoothfactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function smoothfactor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to smoothfactor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --------------------------------------------------------------------
function readmenu_Callback(hObject, eventdata, handles)
global temp pres volt

% hObject    handle to readmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% we will open a file-pick dialog and check the returned file.
 allowedfiles={'*.dat' ,'Data Files' ; '*.txt' , 'Text Files' } ;
 [ fname , pathname ] = uigetfile (allowedfiles ,'Data Source' );
 fname = fullfile ( pathname , fname )
 A= importdata( fname  );
 % temp = A(:,1); pres = A(:,2) ; volt = A(:,3)
 handles.temp = A(:,1) ; handles.pres=A(:,2); handles.volt=A(:,3) ;
 % Update handles structure
 guidata(hObject, handles);
% --------------------------------------------------------------------
function exitmenu_Callback(hObject, eventdata, handles)
% hObject    handle to exitmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete ( handles.figure1 ) ;


% --------------------------------------------------------------------
function Filemenu_Callback(hObject, eventdata, handles)
% hObject    handle to Filemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


