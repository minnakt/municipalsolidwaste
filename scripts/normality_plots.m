table = readtable('municipal_waste_data.xlsx','Range','A1:W119');

% Original variables (9)
y = table{:,22};    %y
pop = table{:,2};   %x1
pd = table{:,9};    %x3
pbam = table{:,11}; %x4
as = table{:,13};   %x5
hgs = table{:,14};  %x6
ces = table{:,16};  %x7
dpi = table{:,18};  %x8
mi = table{:,21};   %x9

% ln variables (7)
ln_y = table{:,23};       %y
ln_pop = table{:,3};      %x1
ln_pd = table{:,10};      %x3
ln_pbam = table{:,12};    %x4
ln_hgs = table{:,15};     %x6
ln_ces = table{:,17};     %x7
ln_dpi = table{:,20};     %x8

%plot_vars(pop, pd, pbam, as, hgs, ces, dpi, mi, y)
%plot_vars(ln_pop, ln_pd, ln_pbam, as, ln_hgs, ln_ces, ln_dpi, mi, ln_y)

[~,p] = kstest(pop);
[~,p] = kstest(pd);
[~,p] = kstest(pbam);
[~,p] = kstest(as);
[~,p] = kstest(hgs);
[~,p] = kstest(ces);
[~,p] = kstest(ces)
ind = ~isnan(ces);
ces = ces(ind);
mu = mean(ces)
dev = std(ces)
[h,p] = kstest2(ces, normrnd(mu, dev, [118, 1]))
[~,p] = kstest(dpi);
% [~,p] = kstest(mi)
% ind = ~isnan(mi);
% mi = mi(ind);
% mu = mean(mi')
% dev = std(mi)
% [h,p] = kstest2(mi, normrnd(mu, dev, [118, 1]))
[~,p] = kstest(y);

% histogram(pop)
% histogram(log(dpi), 'FaceColor', '#62ddee')
% ylabel("Count");
% xlabel("Value");

function [] = plot_vars(x1, x2, x3, x4, x5, x6, x7, x8, y)
    figure;
    subplot(3,3,1);
    normplot(x1);
    xlabel("Ln Population");
    subplot(3,3,2);
    normplot(x2);
    xlabel("Ln Population Density");
    subplot(3,3,3)
    normplot(x3);
    xlabel("Ln PBAM");
    subplot(3,3,4);
    normplot(x4);
    xlabel("Schooling");
    subplot(3,3,5);
    normplot(x5);
    xlabel("Ln Household");
    subplot(3,3,6)
    normplot(x6);
    xlabel("Ln Commercial");
    subplot(3,3,7);
    normplot(x7);
    xlabel("Ln Per Capita Income");
    subplot(3,3,8);
    normplot(x8);
    xlabel("Marginalization");
    subplot(3,3,9)
    normplot(y);
    xlabel("Ln MSW");
end