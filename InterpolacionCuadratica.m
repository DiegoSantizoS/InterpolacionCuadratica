clc; clear all;

function newtonInterpolacion()
    % Datos
    x = [1, 2, 3];
    y = [0, 0.6931472, 1.098612];
    
    % Punto donde se evalúa la interpolación
    x_eval = 2.5;
    valor_real = log(x_eval); % ln(2.5)

    % Calcular coeficientes de Newton (diferencias divididas)
    coef = diferenciasDivididas(x, y);
    
    % Evaluar el polinomio de Newton en x_eval
    valor_interp = evaluarNewton(coef, x, x_eval);
    
    % Calcular error porcentual
    error_porcentual = abs((valor_real - valor_interp) / valor_real) * 100;
    
    % Mostrar resultados
    fprintf('Valor real de ln(2.5): %.8f\n', valor_real);
    fprintf('Valor interpolado: %.8f\n', valor_interp);
    fprintf('Error porcentual: %.4f%%\n', error_porcentual);
end

function coef = diferenciasDivididas(x, y)
    n = length(x);
    coef = y; % primera columna es igual a y

    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (x(i) - x(i-j+1));
        end
    end
end

function p = evaluarNewton(coef, x, x_eval)
    n = length(coef);
    p = coef(n);

    for i = n-1:-1:1
        p = p * (x_eval - x(i)) + coef(i);
    end
end

newtonInterpolacion();