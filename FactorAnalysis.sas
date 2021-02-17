ods rtf file='N:\Multivariate Data Analysis DSCI 449\Final - Women''s Track Factor Analysis\Factor Analysis 1.rtf';

*Factor Analysis on womenstrack Data;
title 'Factor Analysis on Women''s Track Data';
proc corr data=work.womenstrack;
   var _100m -- marathon;
run;
ods rtf close;

ods rtf file='N:\Multivariate Data Analysis DSCI 449\Final - Women''s Track Factor Analysis\Factor Analysis 2.rtf';
proc factor data=work.womenstrack nfactors=1 msa;
   *Check MSA, partial corr, and eigenvalues';
    var _100m -- marathon;
run;
ods rtf close;

ods rtf file='N:\Multivariate Data Analysis DSCI 449\Final - Women''s Track Factor Analysis\Factor Analysis 6.rtf';
proc factor data=work.womenstrack nfactors=1 rotate=varimax;
   title2 'Orthogonal rotation with 1 factor';
   var _100m -- marathon;
run;
ods rtf close;

ods rtf file='N:\Multivariate Data Analysis DSCI 449\Final - Women''s Track Factor Analysis\Factor Analysis 7.rtf';
proc factor data=work.womenstrack nfactors=1 rotate=promax;
   title2 'Oblique rotation with 1 factors';
   var _100m -- marathon;
run;
ods rtf close;

ods rtf file='N:\Multivariate Data Analysis DSCI 449\Final - Women''s Track Factor Analysis\Factor Analysis 8.rtf';
proc factor data=work.womenstrack nfactors=1;
*create new variable -- reverse score pricing;
*forming summated scales;
   title2 'Correlations on new summated scales';
data new;
   set work.womenstrack;
   scale1=sum(_100m -- marathon)/7;
  run;

proc corr data=new alpha;
   *scale1;
   var _100m -- marathon;

*running correlations on summated scales;
proc corr data=new;
   var scale1;
run;
ods rtf close;
