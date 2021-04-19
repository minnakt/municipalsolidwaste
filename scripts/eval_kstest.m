table = readtable('municipal_waste_data.xlsx','Range','A1:W119');

%defining all the variables
ln_y = normalize(table{:,23});
y = normalize(table{:,22});
ln_pop = normalize(table{:,3});
x_pop = normalize(table{:,2});
ln_pd = normalize(table{:,10});
x_pd = normalize(table{:,9});
ln_pbam = normalize(table{:,12});
x_pbam = normalize(table{:,11});
x_as = normalize(table{:,13});
ln_hgs = normalize(table{:,15});
x_hgs = normalize(table{:,14});
ln_ces = normalize(table{:,17});
x_ces = normalize(table{:,16});
ln_dpi = normalize(table{:,20});
x_dpi = normalize(table{:,18});
x_mi = normalize(table{:,21});

[H_y,P_y,KSSTAT_y] = kstest(y)
[H_lny,P_lny,KSSTAT_lny] = kstest(ln_y)

[H_pop,P_pop,KSSTAT_pop] = kstest(x_pop)
[H_lnpop,P_lnpop,KSSTAT_lnpop] = kstest(ln_pop)

[H_pd,P_pd,KSSTAT_pd] = kstest(x_pd)
[H_lnpd,P_lnpd,KSSTAT_lnpd] = kstest(ln_pd)

[H_pbam,P_pbam,KSSTAT_pbam] = kstest(x_pbam)
[H_lnpbam,P_lnpbam,KSSTAT_lnpbam] = kstest(ln_pbam)

[H_as,P_as,KSSTAT_as] = kstest(x_as)

[H_hgs,P_hgs,KSSTAT_hgs] = kstest(x_hgs)
[H_lnhgs,P_lnhgs,KSSTAT_lnhgs] = kstest(ln_hgs)

[H_ces,P_ces,KSSTAT_ces] = kstest(x_ces)
[H_lnces,P_lnces,KSSTAT_lnces] = kstest(ln_ces)

[H_dpi,P_dpi,KSSTAT_dpi] = kstest(x_dpi)
[H_lndpi,P_lnpdi,KSSTAT_lndpi] = kstest(ln_dpi)

[H_mi,P_mi,KSSTAT_mi] = kstest(x_mi)