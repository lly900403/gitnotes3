function[chart] =CumulativeReturn(Name,Time,Half,RealReturn,SimuReturn)
%CumulativeReturn(FundNames(TargetFundID),Dates,NFirstHalf,TargetFund,SameVolFactorPortfolio)

% Calculate cumulative returns
ComRealReturn=cumprod(RealReturn+1)-1;
ComSimuReturn=cumprod(SimuReturn+1)-1;


plot(Time,ComRealReturn,'-b');                                                                     % Plot cumulative returns
plot(Time((1:Half)'),ComSimuReturn((1:Half)'),'-r');

CumRatioAtNinSample=(1+ComRealReturn(Half))/(1+ComSimuReturn(Half));
plot(Time((Half+1:length(Time))'),(1+ComSimuReturn((Half+1:length(Time))'))*CumRatioAtNinSample-1,'-r');

plot([Time(Half),Time(Half)], [-10,10],'-k')                               % Plot NinSample Line

if length(Time) >Half
text(Time(1),min([ComRealReturn;ComSimuReturn])-0.1,'Subperiod 1',...                     
     'VerticalAlignment','bottom');
text(Time(Half),min([ComRealReturn;ComSimuReturn])-0.1,'Subperiod 2',...     
     'VerticalAlignment','bottom');
end

ylim([min([ComRealReturn;ComSimuReturn])-0.1,max([ComRealReturn;(1+ComSimuReturn(Half:end))*CumRatioAtNinSample-1])+0.1]);

datetick('x','yy');                                                                                 % Format chart
title('Cumulative Returns');
xlabel('Time (Year)')
ylabel('Cumulative Returns')
set(gca,'XLim',[min(Time),max(Time)+100]);
Ledgend2=legend([cell2mat(Name),' (Vol: ',...
    num2str(sqrt(12)*std(RealReturn),2),')'],...
    ['Static Factor Replicator',' (Vol: ',...
    num2str(sqrt(12)*std(SimuReturn),2),')']);
set(Ledgend2,'Location','NorthWest')
set(Ledgend2,'color','none');

end

