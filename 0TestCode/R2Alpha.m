function[chart] =R2Alpha(Time,Half,AlphaDist,R2Dist,RealReturn,SimuReturn,Xlim1,Xlim2)
 % R2Alpha(Dates,NFirstHalf,VolAdjAlphaDist,R2Dist,TargetFund,SameVolFactorPortfolio,plot232xlim1,plot232xlim2)
 
 Periods{1}=(1:Half)';
 Periods{2}=(Half+1:length(Time))';
 ActualAlpha{1}=RealReturn(Periods{1})-SimuReturn(Periods{1});
 ActualAlpha{2}=RealReturn(Periods{2})-SimuReturn(Periods{2});
 AR{1}=mean(ActualAlpha{1})*12/(std(ActualAlpha{1})*12^0.5);
 AR{2}=mean(ActualAlpha{2})*12/(std(ActualAlpha{2})*12^0.5);
FirstCorr=corrcoef(RealReturn(Periods{1}),SimuReturn(Periods{1}));
SecondCorr=corrcoef(RealReturn(Periods{2}),SimuReturn(Periods{2}));

scatter(AlphaDist{1}*12,R2Dist{1},'.b');
scatter(12*mean(ActualAlpha{1}),FirstCorr(2,1).^2,'ob');
if length(Time) >Half
scatter(AlphaDist{2}*12,R2Dist{2},'.r');
scatter(12*mean(ActualAlpha{2}),SecondCorr(2,1).^2,'or'); 
end

title('Distribution of Alpha and R-Squared')
xlabel('Alpha')
ylabel('R-squared')

xlim([Xlim1,Xlim2]);
ylim([0,1]);

plot([0,0], [0,1],'-r')                               % Plot zero-alpha line
%plot([-0.1,0.1], [0.5,0.5],'-b')                               % Plot zero-alpha line

text(Xlim1,0,'Low Correlation','VerticalAlignment','Bottom');
text(Xlim1,0.95,'High Correlation','VerticalAlignment','Top');
text(Xlim1,0.05,'Negative Alpha','VerticalAlignment','Bottom');
text(Xlim1,1,'Negative Alpha','VerticalAlignment','Top');

text(Xlim2,0,'Low Correlation', 'VerticalAlignment','Bottom','HorizontalAlignment','Right');
text(Xlim2,0.95,'High Correlation','VerticalAlignment','Top','HorizontalAlignment','Right');
text(Xlim2,0.05,'Positive Alpha', 'VerticalAlignment','Bottom','HorizontalAlignment','Right');
text(Xlim2,1,'Positive Alpha','VerticalAlignment','Top','HorizontalAlignment','Right');

if length(Time) >Half
    if Half==length(Time)
    Legend4=legend('Subperiod 1 Trials',['Subperiod 1 Best Fit,AR=',num2str(round(AR{1}*10^2)/(10^2))]);
else
    Legend4=legend('Subperiod 1 Trials','Subperiod 2 Trials',['Subperiod 1 Best Fit,AR=',num2str(round(AR{1}*10^2)/(10^2))],['Subperiod 2 Best Fit,AR=',num2str(round(AR{2}*10^2)/(10^2))]);
end
else
    Legend4=legend('Trials',['Best Fit,AR=',num2str(round(AR{1}*10^2)/(10^2))]);
end

set(Legend4,'Location','west')
set(Legend4,'color','none');
end


