%DESCRIPTIVE STATISTICS OF CTPA COHORT RYSZ ET. AL

%Import the data from Excel, if no variable name is chosen it will be
%called CTPA_echo_Huddinge.
CTPAHuddinge = CTPAechoHuddinge;

%Number of Planned Scans
nPlannedScans = height(CTPAHuddinge);

%Number of Unique patients
[C, iUniquePatients, ic] = unique(CTPAHuddinge.PseudoID);
nUniquePatients = length(iUniquePatients);

%Number of Aborted/not performed scans and table of performed scans
nScansNotPerformed = sum(CTPAHuddinge.NotPerformed);
nScansPerformed = nPlannedScans - nScansNotPerformed;
filteredTableScansNotPerformed = CTPAHuddinge(CTPAHuddinge.NotPerformed == 1, :);
nPatientsScansNotPerformed = length(unique(filteredTableScansNotPerformed.PseudoID));
CTPAHuddingePerformedScans = CTPAHuddinge(CTPAHuddinge.NotPerformed == 0, :);

[C, iUniquePatientsThatPerformedScans, ic] = unique(CTPAHuddingePerformedScans.PseudoID);
totalPatientThatPerformedScan = length(iUniquePatientsThatPerformedScans);

a_countsPatientsThatPerformedScans = accumarray(ic, 1);
value_countsPatientsThatPerformedScans = [C, a_countsPatientsThatPerformedScans];
nPatientsThatPerformed1Scan = length(find(strcmp("1", (value_countsPatientsThatPerformedScans(:,2)))));
nPatientsThatPerformed2Scans = length(find(strcmp("2", (value_countsPatientsThatPerformedScans(:,2)))));
nPatientsThatPerformed3Scans = length(find(strcmp("3", (value_countsPatientsThatPerformedScans(:,2)))));
nPatientsThatPerformed4Scans = length(find(strcmp("4", (value_countsPatientsThatPerformedScans(:,2)))));
nPatientsThatPerformed5Scans = length(find(strcmp("5", (value_countsPatientsThatPerformedScans(:,2)))));

%Number of technical problems
nAnglingProblems = sum(CTPAHuddingePerformedScans.AnglingProblem);
nArtifacts = sum(CTPAHuddingePerformedScans.Artifact);
nTotalTechnicalProblems = nAnglingProblems + nArtifacts;

%Scans left that were performed without technical problems
iTechnicalProblems = find(CTPAHuddingePerformedScans.Artifact | ... 
    CTPAHuddingePerformedScans.AnglingProblem);
CTPAHuddingeToAnalys = CTPAHuddingePerformedScans;
CTPAHuddingeToAnalys(iTechnicalProblems, :) = [];

%Total number of scans analyzed for PA dim
totalScansToAnalys = height(CTPAHuddingeToAnalys);

%Total number of patients for PAdim measurments
totalNumberOfPatientsAnalysed = length(unique(CTPAHuddingeToAnalys.PseudoID));

%Number of scans performed by patients that were analysed
[C, iUniquePatients, ic] = unique(CTPAHuddingeToAnalys.PseudoID);
a_countsScansAnalyzed = accumarray(ic, 1);
value_countsScansAnalyzed = [C, a_countsScansAnalyzed];
nPatientsThatAnalyzed1Scan = length(find(strcmp("1", (value_countsScansAnalyzed(:,2)))));
nPatientsThatAnalyzed2Scans = length(find(strcmp("2", (value_countsScansAnalyzed(:,2)))));
nPatientsThatAnalyzed3Scans = length(find(strcmp("3", (value_countsScansAnalyzed(:,2)))));
nPatientsThatAnalyzed4Scans = length(find(strcmp("4", (value_countsScansAnalyzed(:,2)))));
nPatientsThatAnalyzed5Scans = length(find(strcmp("5", (value_countsScansAnalyzed(:,2)))));

%Mean&SD PAdim from TG
meanPAdimTG = nanmean(CTPAHuddingeToAnalys.PadimTG);
stdPAdimTG = nanstd(CTPAHuddinge.PadimTG);

%Calculating the total number of PAdim over cutoff
cutoff = 28;
totalOverCutoffPa = sum(CTPAHuddingeToAnalys.PadimTG >= cutoff);

%Unique patients with PA dim over cutoff
CTPAHuddingeToAnalysUniquePatients = CTPAHuddingeToAnalys(iUniquePatients, :);
totalOverCutoffPaUniquePatientsFirstScan = sum(CTPAHuddingeToAnalysUniquePatients.PadimTG >= cutoff);

%Percentage over cutoff
PAdimToHigh = totalOverCutoffPa / totalScansToAnalys;

%Total list of patients that were evaluated for PE
iContrastWeak = (CTPAHuddingePerformedScans.ToWeakContrast == 1);
nContrastToWeak = sum(iContrastWeak);
CTPAHuddingeAnalysForPe = CTPAHuddingePerformedScans(~iContrastWeak, :);
totalNumberOfScansAnalysedForPe = height(CTPAHuddingeAnalysForPe);

%Number of unique patients analyzed for PE
[C, iUniquePatients, ic] = unique(CTPAHuddingeAnalysForPe.PseudoID);
totalPatientsAnalysedPE = length(iUniquePatients);
a_countsAnalysedPE = accumarray(ic, 1);
value_countsAnalysedPE = [C, a_countsAnalysedPE];
nPatientsPEAnalyzed1Scan = length(find(strcmp("1", (value_countsAnalysedPE(:,2)))));
nPatientsPEAnalyzed2Scans = length(find(strcmp("2", (value_countsAnalysedPE(:,2)))));
nPatientsPEAnalyzed3Scans = length(find(strcmp("3", (value_countsAnalysedPE(:,2)))));
nPatientsPEAnalyzed4Scans = length(find(strcmp("4", (value_countsAnalysedPE(:,2)))));
nPatientsPEAnalyzed5Scans = length(find(strcmp("5", (value_countsAnalysedPE(:,2)))));

%Total Number of Pulmonary Embolisms in Scans
nPosPulmonaryEmbolismInAllScans = sum(CTPAHuddingeAnalysForPe.PulmonaryThrombosisTrue == 1);
percentagePosPulmonaryEmbolismPerformedScans = nPosPulmonaryEmbolismInAllScans / totalNumberOfScansAnalysedForPe;

%Total Pulmonary Embolism in unique patients
CTPAHuddingeUniqePatientsFirstExamPE = CTPAHuddingeAnalysForPe(iUniquePatients, :);
totalNumberOfPatientsFirstExamForPe = length(unique(CTPAHuddingeUniqePatientsFirstExamPE.PseudoID));

nPosPulmonaryEmbolismUniquePatients = sum(CTPAHuddingeUniqePatientsFirstExamPE.PulmonaryThrombosisTrue == 1);
percentagePosPulmonaryEmbolismUniquePatients = nPosPulmonaryEmbolismUniquePatients / ...
    totalNumberOfPatientsFirstExamForPe;

%Data for SPSS ICC calculation
iccData = [CTPAHuddingeToAnalys.PadimTG CTPAHuddingeToAnalys.PadimJA];
writematrix(iccData, 'iccDataCTPAToAnalys.csv');
