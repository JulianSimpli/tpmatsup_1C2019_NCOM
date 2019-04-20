classdef NumeroComplejo<handle
    %UNTITLED Summary of this class goes here
    %   Clase que define las formas de un numero complejo
    
    properties
       FormBinomica_real % parte real de la forma Binómica
       FormBinomica_img % parte imaginaria de la forma Binómica
       FormPolar_ro   % equivale al módulo del número complejo de la forma Binómica
       FomrPolar_fi   % equivale al ángulo que forma el vector con el semieje positivo
       FormBinomica_string  % forma Binómica completa incluye la i
       FormPolar_string  %forma polar completa ejemplo [5;0.7854] ángulo en radianes
       FormParOrdenado_string    % forma par ordenado, ejemplo (FormBinomica_real;FormBinomica_img)   
       Conjugado_string  %Conjugado del número complejo en forma Binómica
       AnguloGrados % el angulo en grados
       TipoInicial=0%tipo inicial que se ingreso
    end
    
    methods%(Static)
        %validación número complejo
       function tipo=dimeTipoComplejo(thisnumeroComplejo, val)
           tipo=0;  %no es complejo
            %validar que val es complejo
            if(~isempty(regexp(val,'^\((+|-)?\d+(\.\d+)?;(+|-)?\d+(\.\d+)?\)$','match')))
                tipo=1;  %forma par ordenado              
              elseif(~isempty(regexp(val,'^\[(+|-)?\d+(\.\d+)?;(+|-)?\d+(\.\d+)?\]$','match')))
                tipo=2; %formapolar
              elseif(~isempty(regexp(val,'^(+|-)?\d+(\.\d+)?[+-]\d+(\.\d+)?j$','match')))
                 tipo=3; %forma binomica
            end  
            thisnumeroComplejo.TipoInicial = tipo;
       end
       
        %cálculo angulo en radianes
        function ang = getAngulo(thisnumeroComplejo,real, img)
            if(real >0 && img>0)
                ang=atan(img/real);
            end
            if(real <0 && img<0)
                ang=pi + atan(abs(img)/abs(real));
            end
            if(real >0 && img<0)
                ang=2*pi - atan(abs(img)/real);
            end
            if(real <0 && img>0)
                ang=pi - atan(img/abs(real));
            end
            if(real ==0 && img>0)
                ang =pi/2;
            end
            if(real ==0 && img<0)
                ang =3*pi/2;
            end
            if(real >0 && img==0)
                ang = 0;
            end
            if(real <0 && img==0)
                ang =pi;
            end      
            thisnumeroComplejo.FomrPolar_fi = ang;
            thisnumeroComplejo.AnguloGrados =round(ang*180/pi);
        end
        %cálculo módulo
        function mod = getModulo(thisnumeroComplejo,real, img)
          mod=sqrt(real^2+img^2);
          thisnumeroComplejo.FormPolar_ro = mod;
        end
       %convertir Polar a Binomica    
        function str = pol2binomica(thisnumeroComplejo, mod,ang)           
             real=mod*cos(ang);
             img=mod*sin(ang);  
             %forma abreviada pero solo devuelve i
            % str= strcat(num2str(mod*exp(ang*j)));
          str = strcat((num2str(real) ),';', num2str(img), 'j');
        end
        %convertir de Binomica a polar
        function str = bin2polar(thisnumeroComplejo, real,img )
          mod = getModulo(thisnumeroComplejo,real,img);
          ang=  getAngulo(thisnumeroComplejo,real,img);  
          %angulo en grados
          ang = ang*180/pi;
          str = strcat('[',(num2str(mod) ),';', num2str(ang), ']');
        end
        % \['+   +'\]
        %constructor
        function obj=NumeroComplejo( val)
            %validar que val es complejo
            dimeTipoComplejo(obj, val)            
            %realizar conversiones y asignar atributos
            %forma par ordenado 
            if(obj.TipoInicial==1)
              obj.FormPolar_string= val;
              firstPart = regexp(val,'(+|-)?\d+(\.\d+)?;','match');
              secondPart = regexp(val,'(+|-)?\d+(\.\d+)?\)','match');
              obj.FormBinomica_real = str2double(regexprep( firstPart,';','','ignorecase'));
              obj.FormBinomica_img = str2double(regexprep(secondPart,'\)','','ignorecase'));
            end
            %formapolar
            if(obj.TipoInicial==2)
               obj.FormPolar_string=val; 
               firstPart = regexp(val,'(+|-)?\d+(\.\d+)?;','match');
               secondPart = regexp(val,'(+|-)?\d+(\.\d+)?\]','match');
               obj.FormPolar_ro = str2double(regexprep( firstPart,';','','ignorecase'));
               obj.FomrPolar_fi = str2double(regexprep(secondPart,'\]','','ignorecase'));
               obj.AnguloGrados= round(obj.FomrPolar_fi*180/pi);
            end
            %forma binomica
            if(obj.TipoInicial==3)
               obj.FormBinomica_string=val;
               obj.FormBinomica_real = real(str2double(val));
               obj.FormBinomica_img = imag(str2double(val));
              obj.FormPolar_string = bin2polar(obj, obj.FormBinomica_real,obj.FormBinomica_img );
            end
            if(obj.TipoInicial==0)
                error('no es un numero complejo');
            end
        end
    end    
end

