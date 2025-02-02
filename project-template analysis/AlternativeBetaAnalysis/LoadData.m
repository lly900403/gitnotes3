
%% =====================================================================
%---------------SECTION 0: Load data----------------------------
%=======================================================================

clear;
clc;

% Load factor data
[TempData1,TempData2 , TempDataRawFactors] = xlsread('L&B GeneralIndex.xlsx');
FactorNames=TempDataRawFactors(1,2:end);

if isnumeric(cell2mat(TempDataRawFactors(2,1)))
    Dates=x2mdate(cell2mat(TempDataRawFactors(2:end,1)));
else
    Dates=datenum(TempDataRawFactors(2:end,1),'mm/dd/yyyy');
end
    
Factors=cell2mat(TempDataRawFactors(2:end,2:end));
%All of the factors should be volatility adjusted
%for i=1:size(Factors,2)
%    Factors(:,i)= Factors(:,i)/std(Factors(:,i));
%end
FactorID=mat2cell([1:length(FactorNames)],[1],ones(length(FactorNames),1));


% Load fund data
[TempData1,TempData2 , TempDataRawFunds] = xlsread('L&B Return.xlsx');
FundNames=TempDataRawFunds(1,2:end);
Funds=cell2mat(TempDataRawFunds(2:end,2:end));
FundID=mat2cell([1:length(FundNames)],[1],ones(length(FundNames),1));

% Load PRIM data
[TempData1,TempData2 , TempDataRawPRIM] = xlsread('L&B PRIM.xlsx');
PRIM=cell2mat(TempDataRawPRIM(2:end,2:end));

% Load factor descriptions
[TempData1,TempData2 , TempDataRawDescriptions] = xlsread('FactorDescription.xlsx');
FactorDescriptions=TempDataRawDescriptions(2:(size(FactorNames,2)+1),:);


% Print factor and fund information
disp('Factor ID and Factor Names')
disp([FactorID',FactorDescriptions]);
disp('Fund ID and Fund Names')
disp([FundID',FundNames']);

if isnumeric(cell2mat(TempDataRawFunds(2,1)))
    Dates2=x2mdate(cell2mat(TempDataRawFunds(2:end,1)));
else
    Dates2=datenum(TempDataRawFunds(2:end,1),'mm/dd/yyyy');
end

if all(Dates==Dates2)
    disp('Dates matched')
    disp(['Number of Periods = ',num2str(length(Dates))])
else
    disp('Dates did NOOOOOOOOOOOOOOOOOOOOOOOT match')
end

clear Dates2 Temp*