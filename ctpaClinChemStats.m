%Get descriptive statistics of CTPA clinical chemistry cohort
%Import as numbers!

format compact
format short

%Calculate number of patients
nPatients = height(CTPAclinicalChemistry);

%Get D-dimer descriptive statistics
DdimerQuartile = quantile(CTPAclinicalChemistry.ddimer, 3)
nDidimer = sum(~isnan(CTPAclinicalChemistry.ddimer))

%Get Fibrinogen descriptive statistics
FibriogenQuartile = quantile(CTPAclinicalChemistry.fib, 3)
Fibrinogenn = sum(~isnan(CTPAclinicalChemistry.fib))

%Get IL-10 descriptive statistics
IL10 = quantile(CTPAclinicalChemistry.IL10, 3)
IL10n = sum(~isnan(CTPAclinicalChemistry.IL10))

%Get IL-6 descriptive statistics
IL6 = quantile(CTPAclinicalChemistry.il6, 3)
IL6n = sum(~isnan(CTPAclinicalChemistry.il6))

%Get TNF-alpha descriptive statistics
tnfAlfa = quantile(CTPAclinicalChemistry.TNFalfa, 3)
tnfAlfan = sum(~isnan(CTPAclinicalChemistry.TNFalfa))

format

