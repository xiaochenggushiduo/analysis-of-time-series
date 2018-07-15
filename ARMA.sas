data farming;
input GDP@@;
dif_GDP =dif(dif(dif(dif(GDP))));
year = intnx('year','1jan1997'd,_n_-1);
format year year4.;
cards;
1464.34
1577.05
1672.96
1951.51
2120.35
2348.54
2662.08
3122.01
3620.27
4275.12
5284.69
6426.1
7278.75
8667.58
10568.83
11939.24
13046.4
13803.14
14063.13
14776.8
;
proc gplot;
plot dif_GDP*year;
symbol v=star c=black i=join;
run;
proc arima data=farming;
identify var=dif_GDP ;/*平稳性检验*/
estimate p=3 noint ;
forecast lead=5 id=year;
run;
proc arima data=farming;
identify var=dif_GDP stationarity=(adf=1);
run;
