%Check if association between fibrinogen, d-dimer or PA dim

%Extract and match vectors of data based on pseudoID
%FIBRINOGEN

paFib = [];
fib = [];
n = 0;

for ii = 1:height(CTPAclinicalChemistry)
    
    if isnan(CTPAclinicalChemistry.fib(ii))
        continue
    end
    
    for jj = 1:height(CTPAechoHuddinge)
        
        if strcmp(CTPAclinicalChemistry.PseudoID(ii), CTPAechoHuddinge.PseudoID(jj))
            
            n = n+1;
            
            paFib(n) = CTPAechoHuddinge.PadimTG(jj);
            fib(n) = CTPAclinicalChemistry.fib(ii);
            
            break
            
        end
        
    end
    
end

%Extract and match vectors of data based on pseudoID
%D-DIMER

            
paDdim = [];
dDim = [];
n = 0;

for ii = 1:height(CTPAclinicalChemistry)
    
    if isnan(CTPAclinicalChemistry.ddimer(ii))
        continue
    end
    
    for jj = 1:height(CTPAechoHuddinge)
        
        if strcmp(CTPAclinicalChemistry.PseudoID(ii), CTPAechoHuddinge.PseudoID(jj))
            
            n = n+1;
            
            paDdim(n) = CTPAechoHuddinge.PadimTG(jj);
            dDim(n) = CTPAclinicalChemistry.ddimer(ii);
            
            break
            
        end
        
    end
    
end   


%Plot and model

figure; hold on;
scatter(paDdim, dDim);
mdlDdimPa = fitlm(paDdim, dDim)
plot(mdlDdimPa);
title('PA dim vs D-dim');
set(gca,'FontSize',20);

figure; hold on;
scatter(paFib, fib);
mdlFibPa = fitlm(paFib, fib)
plot(mdlFibPa);
title('PA dim vs fib');
set(gca,'FontSize',20);
