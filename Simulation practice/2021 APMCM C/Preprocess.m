file = xlsread("C:\Git Code\Mathematical-modeling\Simulation practice\2021 APMCM C\Initial Data\2021��̫������1.xlsx");
result = fillmissing(file,'linear') ;
csvwrite("C:\Git Code\Mathematical-modeling\Simulation practice\2021 APMCM C\Preprocess Data\����1-1.csv",result);