classdef Operaciones
    %Clase para operaciones basicas y avanzadas
    %referencia a NumeroComplejo
    
    %resultado es otro numero complejo.
    
    properties
        
    end
    
    methods

       function result=suma(thisoperaciones, numeroComplejo, otroNumeroComplejo)
                   %suma de numeros complejos
        real= numeroComplejo.FormBinomica_real + otroNumeroComplejo.FormBinomica_real;
        img = numeroComplejo.FormBinomica_img + otroNumeroComplejo.FormBinomica_img;
        str=strcat('(',(num2str(real) ),',', num2str(img), ')');
        result = NumeroComplejo(str);
       end

        function result=resta(thisoperaciones, numeroComplejo, otroNumeroComplejo)
                      %resta de numeros complejos
        real= numeroComplejo.FormBinomica_real - otroNumeroComplejo.FormBinomica_real;
        img = numeroComplejo.FormBinomica_img - otroNumeroComplejo.FormBinomica_img;
        str=strcat('(',(num2str(real) ),',', num2str(img), ')');
        result = NumeroComplejo(str);
       end

        function result=multiplicacion(thisoperaciones, numeroComplejo, otroNumeroComplejo)
                %multiplicacion de numeros complejos
        firstOp = numeroComplejo.FormBinomica_real * otroNumeroComplejo.FormBinomica_real;
        secondOp = numeroComplejo.FormBinomica_img * otroNumeroComplejo.FormBinomica_img;
        real = firstOp - secondOp;
        
        firstOp = numeroComplejo.FormBinomica_real * otroNumeroComplejo.FormBinomica_img;
        secondOp = numeroComplejo.FormBinomica_img * otroNumeroComplejo.FormBinomica_real;
        img = firstOp + secondOp;
        
        str=strcat('(',(num2str(real) ),',', num2str(img), ')');
        result = NumeroComplejo(str);
        end
        function result=division(thisoperaciones, numeroComplejo, otroNumeroComplejo)
            %cociente o division de numeros complejos, el cociente lo
            %realiza desde la forma polar
            modulo = numeroComplejo.FormPolar_ro /  otroNumeroComplejo.FormPolar_ro;
            angulo = numeroComplejo.FormPolar_fi - otroNumeroComplejo.FormPolar_fi;

            str=strcat('[',(num2str(modulo) ),';', num2str(angulo), ']');
            result = NumeroComplejo(str);
        end

         function result=potencia(thisoperaciones, numeroComplejo, n)
            %potencia
            modulo = numeroComplejo.FormPolar_ro ^  n;
            angulo = numeroComplejo.FormPolar_fi *n;

            str=strcat('[',(num2str(modulo) ),';', num2str(angulo), ']');
            result = NumeroComplejo(str);
         end

        
        
    end
    
end

