table = readtable('municipal_waste_data.xlsx','Range','A1:W119');

ln_y = table{:,23};
ln_pop = table{:,3};
ln_pd = table{:,10};
ln_pbam = table{:,12};
x_as = table{:,13};
ln_dpi = table{:,20};
ln_ces = table{:,17};
ln_hgs = table{:,15};
x_mi = table{:,21};
ones_col = ones(118,1);

% RUN VIF ITERATIONS
all = [x_as,ln_dpi,ln_ces,ln_hgs,x_mi,ln_pop,ln_pd,ln_pbam];
all(any(isnan(all), 2), :) = [];
format long
vif(all)

% eliminate ln_dpi
all = [x_as,ln_ces,ln_hgs,x_mi,ln_pop,ln_pd,ln_pbam];
all(any(isnan(all), 2), :) = [];
format long
vif(all)

% eliminate ln_ces
all = [x_as,ln_hgs,x_mi,ln_pop,ln_pd,ln_pbam];
all(any(isnan(all), 2), :) = [];
format long
vif(all)

% eliminate ln_hgs
all = [x_as,x_mi,ln_pop,ln_pd,ln_pbam];
all(any(isnan(all), 2), :) = [];
format long
vif(all)

% eliminate x_as
all = [x_mi,ln_pop,ln_pd,ln_pbam];
all(any(isnan(all), 2), :) = [];
format long
vif(all)

% PEARSON CORRELATION COEFFICIENT
X = [ln_y,ln_pop,ln_pd,ln_pbam];
Y = [ln_pop,ln_pd,ln_pbam,x_mi];
corr(Y,X,'Rows','pairwise')