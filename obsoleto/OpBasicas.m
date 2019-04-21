function varargout = OpBasicas(varargin)
% OpBasicas MATLAB code for OpBasicas.fig
%      OpBasicas, by itself, creates a new OpBasicas or raises the existing
%      singleton*.
%
%      H = OpBasicas returns the handle to a new OpBasicas or the handle to
%      the existing singleton*.
%
%      OpBasicas('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OpBasicas.M with the given input arguments.
%
%      OpBasicas('Property','Value',...) creates a new OpBasicas or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OpBasicas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OpBasicas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OpBasicas

% Last Modified by GUIDE v2.5 16-Apr-2019 23:30:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OpBasicas_OpeningFcn, ...
                   'gui_OutputFcn',  @OpBasicas_OutputFcn, ...
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


% --- Executes just before OpBasicas is made visible.
function OpBasicas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OpBasicas (see VARARGIN)

% Choose default command line output for OpBasicas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OpBasicas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OpBasicas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_sumar.
function btn_sumar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_sumar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    %Obtengo valores de los textboxs
    a1 = get(handles.txt_a1,'String');
    b1 = get(handles.txt_b1,'String');
   a2 = get(handles.txt_a2,'String');
    b2 = get(handles.txt_a2,'String');
    
        a = NumeroComplejo;
    a.FormBinomica_a = 3;
    
    %Calculos
   % real = (str2num(a1) + str2num(a2));
   real = (a.FormBinomica_a + str2num(a2));
    img = (str2num(b1) + str2num(b2));
    REAL = num2str(real);
    IMG = num2str(img);
    
    %Mostrar resultado
    set(handles.lbl_info,'string',''); 
    set(handles.txt_resultado,'string', ['(', REAL,' + ', IMG,'i', ')']) ;
guidata(hObject, handles);

% --- Executes on button press in btn_restar.
function btn_restar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_restar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
%Obtengo valores de los textboxs
    a1 = get(handles.txt_a1,'String');
    b1 = get(handles.txt_b1,'String');
    a2 = get(handles.txt_a2,'String');
    b2 = get(handles.txt_a2,'String');
    
    %Calculos
    real = (str2num(a1) - str2num(a2));
    img = (str2num(b1) - str2num(b2));
    REAL = num2str(real);
    IMG = num2str(img);
    
    %Mostrar resultado
    set(handles.lbl_info,'string',''); 
    set(handles.txt_resultado,'string', ['(', REAL,' + ', IMG,'i', ')']); 
guidata(hObject, handles);

% --- Executes on button press in btn_dividir.
function btn_dividir_Callback(hObject, eventdata, handles)
% hObject    handle to btn_dividir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    a1 = get(handles.txt_a1,'String');
    b1 = get(handles.txt_b1,'String');
    a2 = get(handles.txt_a2,'String');
    b2 = get(handles.txt_a2,'String');
    
    a = NumeroComplejo;
    a.FormBinomica_a = 3;
    
    %Calculos
    real = (((str2num(a1)*str2num(a2))+((str2num(b1)*str2num(b2))))/((((((str2num(a2))^2))+((str2num(b2))^2)))));
    img = ((str2num(b1)*str2num(a2))-((str2num(a1)*str2num(b2))))/((((((str2num(a2))^2))+((str2num(b2))^2))));
    
    %Validacion division por 0
    if ((((str2num(a2))^2))+((str2num(b2))^2) == 0);
        set(handles.txt_resultado,'string','ERROR') ; 
        set(handles.lbl_info,'string','ERROR: Inserte para "a2" o "b2" un valor distinto de cero') ;
    else   
        REAL=num2str(real);
        IMG=num2str(img);
    
        %Mostrar resultado
        set(handles.lbl_info,'string',''); 
        set(handles.txt_resultado,'string', ['(', REAL,' + ', IMG,'i', ')']);
    end
guidata(hObject, handles);


% --- Executes on button press in btn_multiplicar.
function btn_multiplicar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_multiplicar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    a1 = get(handles.txt_a1,'String');
    b1 = get(handles.txt_b1,'String');
    a2 = get(handles.txt_a2,'String');
    b2 = get(handles.txt_a2,'String');
    
    %Calculos
    real = ((str2num(a1)*str2num(a2))-((str2num(b1)*str2num(b2))));
    img = ((str2num(a1)*str2num(b2))-((str2num(b1)*str2num(a2))));
    REAL = num2str(real);
    IMG = num2str(img);
    
    %Mostrar resultado
    set(handles.lbl_info,'string',''); 
    set(handles.txt_resultado,'string', ['(', REAL,' + ', IMG,'i', ')']);
guidata(hObject, handles);

% --- Executes on button press in btn_limpiar.
function btn_limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.txt_a1,'string','0'); 
    set(handles.txt_b1,'string','0'); 
    set(handles.txt_a2,'string','0'); 
    set(handles.txt_b2,'string','0'); 
    set(handles.lbl_info,'string',''); 
    set(handles.txt_resultado,'string','') ;
guidata(hObject, handles);

function txt_resultado_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resultado as text
%        str2double(get(hObject,'String')) returns contents of txt_resultado as a double


% --- Executes during object creation, after setting all properties.
function txt_resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_b2_Callback(hObject, eventdata, handles)
% hObject    handle to txt_b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_b2 as text
%        str2double(get(hObject,'String')) returns contents of txt_b2 as a double

input = str2num(get(hObject,'String'));
%Si el cuadro no tiene nada escrito, esto lo verifica y pone un cero
if (isempty(input))
     set(hObject,'String','0')
end

% --- Executes during object creation, after setting all properties.
function txt_b2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_a2_Callback(hObject, eventdata, handles)
% hObject    handle to txt_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_a2 as text
%        str2double(get(hObject,'String')) returns contents of txt_a2 as a double

input = str2num(get(hObject,'String'));
%Si el cuadro no tiene nada escrito, esto lo verifica y pone un cero
if (isempty(input))
     set(hObject,'String','0')
end

% --- Executes during object creation, after setting all properties.
function txt_a2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_a1_Callback(hObject, eventdata, handles)
% hObject    handle to txt_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_a1 as text
%        str2double(get(hObject,'String')) returns contents of txt_a1 as a double

input = str2num(get(hObject,'String'));
%Si el cuadro no tiene nada escrito, esto lo verifica y pone un cero
if (isempty(input))
     set(hObject,'String','0')
end

% --- Executes during object creation, after setting all properties.
function txt_a1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_b1_Callback(hObject, eventdata, handles)
% hObject    handle to txt_b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_b1 as text
%        str2double(get(hObject,'String')) returns contents of txt_b1 as a double

input = str2num(get(hObject,'String'));
%Si el cuadro no tiene nada escrito, esto lo verifica y pone un cero
if (isempty(input))
     set(hObject,'String','0')
end

% --- Executes during object creation, after setting all properties.
function txt_b1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_volver.
function btn_volver_Callback(hObject, eventdata, handles)
% hObject    handle to btn_volver (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    close(OpBasicas);
    Menu;
