table = readtable('basededatos.xlsx','Range','A1:W119');

ln_y = table{:,23};
ln_pop = table{:,3};
ln_pd = table{:,10};
ln_pbam = table{:,12};

%cleaning the data by getting rid of the Nan's
ind = ~isnan(ln_pbam);
ln_pbam = ln_pbam(ind);
ln_y = ln_y(ind);
ln_pop = ln_pop(ind);
ln_pd = ln_pd(ind);

ones_col = ones(111,1);

%model 1, regress and anova
md1 = fitlm([ln_pop,ln_pd,ln_pbam],ln_y)
anova(md1,'summary')
[p1,DW1] = dwtest(md1,'exact','both')

%model 2, regress and anova
md2 = fitlm([ln_pop,ln_pbam],ln_y)
anova(md2,'summary')
[p2,DW2] = dwtest(md2,'exact','both')

scatter3(ln_pop,ln_pbam,ln_y,'filled')
hold on
x1fit = min(ln_pop):0.2:max(ln_pop);
x2fit = min(ln_pbam):0.2:max(ln_pbam);
[X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
YFIT = -8.86439448267856 + 1.10558683417128*X1FIT + 0.0658257922865601*X2FIT + 0*X1FIT.*X2FIT;
mesh(X1FIT,X2FIT,YFIT)
xlabel('Population')
ylabel('Population Density')
zlabel('Waste Generation')
view(50,10)

%testing normality probability plots for variables
% x_hgs = table{:,14};
% ln_hgs = table{:,15};
% normplot(x_hgs)
% normplot(ln_hgs)