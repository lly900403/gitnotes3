function[chart] =RollingReturn(Name,Time,Half,RealReturn,SimuReturn)
%RollingReturn(FundNames(TargetFundID),Dates,NFirstHalf,TargetFund,SameVolFactorPortfolio)

% Calculate x-month rolling returns
RollLength=12;
RollRealReturn=zeros(length(Time),1);
RollSimuReturn=zeros(length(Time),1);

for i=RollLength:length(Time)
    RollRealReturn(i)=prod(RealReturn(i-RollLength+1:i)+1)-1;
    RollSimuReturn(i)=prod(SimuReturn(i-RollLength+1:i)+1)-1;
end

plot(Time,RollRealReturn,'-b');
plot(Time,RollSimuReturn,'-r');

plot([Time(Half),Time(Half)], [-10,10],'-k')                               % Plot NinSample Line

if length(Time) >Half
   text(Time(1),min([RollRealReturn;RollSimuReturn])-0.1,'Subperiod 1',...                     
     'VerticalAlignment','bottom');
text(Time(Half),min([RollRealReturn;RollSimuReturn])-0.1,'Subperiod 2',...     
     'VerticalAlignment','bottom'); 
else
    text(Time(1),min([RollRealReturn;RollSimuReturn])-0.1,' ',...                     
     'VerticalAlignment','bottom');
text(Time(Half),min([RollRealReturn;RollSimuReturn])-0.1,' ',...     
     'VerticalAlignment','bottom');
end


ylim([min([RollRealReturn;RollSimuReturn])-0.1,max([RollRealReturn;RollSimuReturn])+0.1]);


datetick('x','yy');
title('12-Month Rolling Returns')
xlabel('Time (Year)')
ylabel('12-Month Rolling Returns')
set(gca,'XLim',[min(Time),max(Time)+100]);
Ledgend3=legend(cell2mat(Name),'Static Factor Replicator');
set(Ledgend3,'Location','NorthWest')
set(Ledgend3,'color','none');

end