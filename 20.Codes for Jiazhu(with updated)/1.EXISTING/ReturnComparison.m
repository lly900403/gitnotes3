function[chart] =ReturnComparison(Name,Time,Half,RealReturn,SimuReturn,Xlim1,Xlim2,Ylim1,Ylim2)

%ReturnComparison(FundNames(TargetFundID),Dates,NFirstHalf,TargetFund,SameVolFactorPortfolio,plot235xlim1,plot235xlim2,plot235ylim1,plot235ylim2)

plot([Xlim1,Xlim1+min((Xlim2-Xlim1),(Ylim2-Ylim1))],[Ylim1,Ylim1+min((Xlim2-Xlim1),(Ylim2-Ylim1))],'-r');                               % Plot "break-even" line

plot(SimuReturn((1:Half)' ), RealReturn((1:Half)' ),'.b')                                                        % Plot scattered monthly return chart
plot(SimuReturn((Half+1:length(Time))' ), RealReturn((Half+1:length(Time))' ),'.r') 

% Calculate Correlations between Actual and Factor Portfolio
FullCorr=corrcoef(RealReturn,SimuReturn);
FirstCorr=corrcoef(RealReturn((1:Half)' ),SimuReturn((1:Half)' ));
SecondCorr=corrcoef(RealReturn((Half+1:length(Time))' ),SimuReturn((Half+1:length(Time))' ));

if  length(Time) >Half 
text(Xlim1,Xlim2,['Subperiod 2 Correlation: ',num2str(SecondCorr(1,2),'%.4f')],...                              % Dsiplay R-square
     'VerticalAlignment','top','FontWeight','bold');
text(Xlim1,Xlim2*0.9,['Subperiod 1 Correlation: ',num2str(FirstCorr(1,2),'%.4f')],...                              % Dsiplay R-square
     'VerticalAlignment','top','FontWeight','bold');
end
text(Xlim1,Xlim2*0.8,['Correlation: ',num2str(FullCorr(1,2),'%.4f')],...                              % Dsiplay R-square
     'VerticalAlignment','top','FontWeight','bold');
 
title('Monthly Returns Comparison')                 % Format chart
xlabel('Factor Replicator Monthly Returns')
ylabel([cell2mat(Name ),' Monthly Returns'])
set(gca,'XLim',[Xlim1,Xlim2],'YLim',[Ylim1,Ylim2]);

if length(Time) >Half
   if Half==length(Time)
    Ledgend1=legend('Break-Even Line','Subperiod 1 Monthly Returns');
    else
    Ledgend1=legend('Break-Even Line','Subperiod 1 Monthly Returns','Subperiod 2 Monthly Returns');
    end 
else
    Ledgend1=legend('Break-Even Line','Monthly Returns');
end

set(Ledgend1,'Location','SouthEast')
set(Ledgend1,'color','none');
end