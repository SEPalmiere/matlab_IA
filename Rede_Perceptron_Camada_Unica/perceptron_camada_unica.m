close all;clear all;clc % Limpa tudo
file = 'xamostras1.xlsx';
Amostras = xlsread(file) % l� os dados da tabela excel
y = size(Amostras); % pega o tamanho da matriz Amostras
n1 = y(1); % n1 igual a quantidade de linhas
n2 = y(2); % n2 igual a quantidade de colunas
target = Amostras (:,n2);
amostra = Amostras;
amostra(:,2:end)=Amostras(:,1:end-1);
amostra(:,1)= -1;
w = rand (1,n2) % cria um vetor w com valores rand�micos
n = (n1*n2)+(n1*n2);% taxa de aprendizagem � a soma de dois produtos
n = 1/n % taxa de aprendizagem igual a uma porcentagem de seu valor
epoca = 0; % inicia epoca com valor zero
T = 0;
i=1;
for i = 1:n1,
    erro=1;
    while erro == 1, % enquanto erro for 1 fa�a
        u = amostra(i,:)*w';
        if (u >= 0)
            y = 1;
        else
            y = -1;
        end
        if (y~=target(i,1))
            r = n*(target(i,1)-y)*amostra(i,:)
            w = w +r
            epoca= epoca +1;
            erro=1;
        else
            erro=0;
        end 
    end
    i = i+1;
end     
disp('O PESO W VALE:')
disp(w)
disp ('QUANTIDADE DE EPOCAS NECESS�RIAS:')
disp(epoca)
if (erro==0)
    disp('N�o houve erro')
end
if(n1==2|n1==3)
 plotpv(amostra,target);
else
 disp('Grafico n�o � poss�vel por representar um hiperplano')
end

% Opera�ao
file = 'dados.xlsx';
dados = xlsread(file) % l� os dados da tabela excel
y = size(dados); % pega o tamanho da matriz Amostras
y1= y(1,1);
y2 =y(1,2);
i = 1;
dado = ones(y1,y2+1);
dado(:,1)= -1;
dado(:,2:end)= dados(:,1:end);
for i=1:y1,
u = dado(i,:)*w';
if (u >= 0)
            y = 1
        else
            y = -1
end
i = i+1;
end
