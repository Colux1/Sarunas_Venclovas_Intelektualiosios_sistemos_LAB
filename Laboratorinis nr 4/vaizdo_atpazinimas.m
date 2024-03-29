close all
clear all
clc
%% raid�i� pavyzd�i� nuskaitymas ir po�ymi� skai�iavimas
pavadinimas = 'train_data_1.png';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 6);
%% Atpa�intuvo k�rimas
% po�ymiai i� celi� masyvo perkeliami � matric�
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teising� atsakym� matrica: 11 raid�i�, 8 eilut�s mokymui
T = [eye(6), eye(6), eye(6),eye(6), eye(6), eye(6)];
% sukuriamas SBF tinklas duotiems P ir T s�ry�iams
tinklas = newrb(P,T,0,1,20);

%% Tinklo patikra
% skai�iuojamas tinklo i��jimas ne�inomiems po�ymiams
P2 = P(:,6:36);
Y2 = sim(tinklas, P2);
% ie�koma, kuriame i��jime gauta did�iausia reik�m�
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
% apskai�iuosime raid�i� skai�i� - po�ymi� P2 stulpeli� skai�i�
raidziu_sk = size(P2,2);
% rezultat� saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1
            atsakymas = [atsakymas, 'K'];
        case 2
            atsakymas = [atsakymas, '1'];
        case 3
            atsakymas = [atsakymas, 'M'];
        case 4
            atsakymas = [atsakymas, 'S'];
        case 5
            atsakymas = [atsakymas, 'A'];
        case 6
           atsakymas = [atsakymas, 'O'];
          
      
    end
end
% pateikime rezultat� komandiniame lange
% disp(atsakymas)
% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
%% �od�io "KA1MAS" po�ymi� i�skyrimas 
pavadinimas = 'test_euras15_1.png';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raid�i� atpa�inimas
% po�ymiai i� celi� masyvo perkeliami � matric�
P2 = cell2mat(pozymiai_patikrai);
% skai�iuojamas tinklo i��jimas ne�inomiems po�ymiams
Y2 = sim(tinklas, P2);
% ie�koma, kuriame i��jime gauta did�iausia reik�m�
[~, b2] = max(Y2);
%% Rezultato atvaizdavimas
% apskai�iuosime raid�i� skai�i� - po�ymi� P2 stulpeli� skai�i�
raidziu_sk = size(P2,2);
% rezultat� saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
       case 1
            atsakymas = [atsakymas, 'K'];
        case 2
            atsakymas = [atsakymas, 'A'];
        case 3
            atsakymas = [atsakymas, '1'];
        case 4
            atsakymas = [atsakymas, 'M'];
        case 5
            atsakymas = [atsakymas, 'S'];

    end
end
% pateikime rezultat� komandiniame lange
% disp(atsakymas)
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off
% %% �od�io "FIKCIJA" po�ymi� i�skyrimas 
% pavadinimas = 'test_fikcija.png';
% pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

%% Raid�i� atpa�inimas
% po�ymiai i� celi� masyvo perkeliami � matric�
P2 = cell2mat(pozymiai_patikrai);
% skai�iuojamas tinklo i��jimas ne�inomiems po�ymiams
Y2 = sim(tinklas, P2);
% ie�koma, kuriame i��jime gauta did�iausia reik�m�
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
% apskai�iuosime raid�i� skai�i� - po�ymi� P2 stulpeli� skai�i�
raidziu_sk = size(P2,2);
% rezultat� saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
      case 1
            atsakymas = [atsakymas, 'K'];
        case 2
            atsakymas = [atsakymas, '1'];
        case 3
            atsakymas = [atsakymas, 'M'];
        case 4
            atsakymas = [atsakymas, 'S'];
        case 5
            atsakymas = [atsakymas, 'A'];
        case 6
           atsakymas = [atsakymas, 'O'];
          
    end
end
% pateikime rezultat� komandiniame lange
disp(atsakymas)
figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off

