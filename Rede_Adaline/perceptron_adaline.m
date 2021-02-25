close all;clear all;clc % Limpa tudo
file = 'xamostras1.xlsx';
Amostras = xlsread(file) % lê os dados da tabela excel
y = size(Amostras); % pega o tamanho da matriz Amostras
n1 = y(1); % n1 igual a quantidade de linhas
n2 = y(2); % n2 igual a quantidade de colunas
target = Amostras (:,n2); % extrai a informação do alvo (target)
amostra = Amostras % cria uma matriz amostra igual a amostras
amostra(:,2:end)=Amostras(:,1:end-1); % acerta o posicionamento das colunas
amostra(:,1)= -1 % insere o limiar de ativação -1 na primeiro coluna e acerta a matriz amostra
w = rand (1,n2) % cria um vetor w com valores randômicos
n = (n1*n2)+(n1*n2);% taxa de aprendizagem é a soma de dois produtos
n = 1/n % taxa de aprendizagem igual a uma porcentagem de seu valor
e = 0.05; % taxa de precisão requerida
eqm = 0; % Erro quadrático médio
epoca = 0; % inicia epoca com valor zero
i=1;
for i = 1:n1;
    eqmant = eqm;
%     flag = true;
        flag = 1;
        while flag > e % enquanto erro maior que a taxa de precisão pedida
        u = amostra(i,:)*w';
        w = w + (n*((target(i,1)-u)*amostra(i,:)))
        epoca= epoca +1;
        eqm = eqm + ((target(i,1)-u)^2);
        eqm = eqm / n1;
        eqmatual = eqm;
        erro = eqmatual - eqmant;
        erro = abs(erro);
        flag = erro;
        end
        i = i + 1
end


% for i = 1:n1;
%     eqmant = eqm;
% %     flag = true;
%         flag = 1;
%         while flag > e % enquanto erro maior que a taxa de precisão pedida
%         u = amostra(i,:)*w';
%         w = w + (n*((target(i,1)-u)*amostra(i,:)))
%         epoca= epoca +1;
%         u = amostra(i,:)*w';
%         eqm = eqm + ((target(i,1)-u)^2);
%         eqm = eqm / n1;
%         eqmatual = eqm;
%         erro = eqmatual - eqmant;
%         erro = abs(erro);
%         flag = erro;
%         end
%         i = i + 1
% end





disp('O PESO W VALE:')
disp(w)
disp ('QUANTIDADE DE EPOCAS NECESSÁRIAS:')
disp(epoca)
if (erro==0)
    disp('Não houve erro')
end
% 
% 
% Operaçao
%file = 'dados2.xlsx';
file = 'xamostras2.xlsx';
dados = xlsread(file)
% read(file) % lê os dados da tabela excel
y = size(dados); % pega o tamanho da matriz Amostras
y1= y(1,1);
y2 =y(1,2);
i = 1;
dado = ones(y1,y2+1);
dado(:,1)= -1;
dado(:,2:end)= dados(:,1:end);
for i=1:y1,
u = dado(i,:)* w';
if (u >= 0)
            y = 1
        else
            y = -1
end
i = i+1;
end
