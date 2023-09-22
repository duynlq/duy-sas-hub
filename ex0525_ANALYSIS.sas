PROC IMPORT OUT= WORK.ex0525 
        DATAFILE= "data\ex0525.csv" 
        DBMS=CSV REPLACE;
    GETNAMES=YES;
    DATAROW=2; 
RUN;

/*--------------ORIGINAL DATA---------------------*/
/*Scatterplots*/
proc sgplot data = ex0525;
scatter x = Educ y = Income2005;
run;

/*Boxplots*/
proc sgplot data = ex0525;
vbox Income2005 / category = Educ;
run;

/*Stacked Histograms*/
proc sgpanel data = ex0525;
panelby Educ / rows = 5 layout = rowlattice;
histogram Income2005;
run;

/*Stacked QQ Plots*/
proc rank data = ex0525 normal = blom out = ex0525Quant;
var Income2005;
ranks Edu_Quant;
run;
proc sgpanel data = ex0525Quant;
panelby Educ;
scatter x = Edu_Quant y = Income2005;
colaxis label="Normal Quantiles";
run;

/*------------------LOG TRANSFORMED DATA-----------------------*/

data logex0525;
set ex0525;
logIncome2005 = log(Income2005);
run;

/*Scatterplots*/
proc sgplot data = logex0525;
scatter x = Educ y = logIncome2005;
run;

/*Boxplots*/
proc sgplot data = logex0525;
vbox logIncome2005 / category = Educ;
run;

/*Stacked Histograms*/
proc sgpanel data = logex0525;
panelby Educ / rows = 5 layout = rowlattice;
histogram logIncome2005;
run;

/*Stacked QQ Plots*/
proc rank data = logex0525 normal = blom out = logex0525Quant;
var logIncome2005;
ranks logex0525Quant;
run;
proc sgpanel data=logex0525Quant;
panelby Educ;
scatter x = logex0525Quant y = logIncome2005 ;
colaxis label = "Normal Quantiles";
run;

/*---------------------PAIRWISE COMPARISON-------------------------*/

proc means data = logex0525 nway;
class Educ;
var Income2005;
output out = incomesummary median = medianIncome;
run;
proc print data = incomesummary;
var Educ medianIncome;
run;

/*--------------------------ANOVA----------------------------*/
proc glm data = logex0525;
class Educ;
model logIncome2005 = Educ;
run;

/*--------------------------TUKEY----------------------------*/
proc glm data = logex0525;
class Educ;
model logIncome2005 = Educ;
lsmeans Educ / pdiff = ALL adjust=tukey cl;
run;

/*-------------------------DUNNETT---------------------------*/
proc glm data = logex0525;
class Educ;
model logIncome2005 = Educ;
lsmeans Educ / pdiff = control("<12"); 
/*--12 is <12 in file for some reason--*/
run;
