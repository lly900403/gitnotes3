function[chart] =Exposures(Names,Time,Half,Coefficients,WhichPeriods)
%Exposures(SelectedFactorNames{FirstOrSecond},Dates,NFirstHalf,SameVolCoefficients{FirstOrSecond}(2:end),FirstOrSecond)

Bar2=barh(diag([0;Coefficients;0]),'stacked');
    set(gca,'yticklabel',[' ',Names,' ']);
    set(Bar2,'facecolor','b')
    set(Bar2(1),'facecolor','r')
    set(Bar2(end),'facecolor','k')
    Periods{1}=(1:Half)';
    Periods{2}=(Half+1:length(Time))';
    if length(Time) >Half 
        title({'Static Factor Exposures';['Subperiod ',num2str(WhichPeriods),': ',datestr(Time(Periods{WhichPeriods}(1)),'mmm yy'),' to ',datestr(Time(Periods{WhichPeriods}(end)),'mmm yy')]})
    else
        title({'Static Factor Exposures';[datestr(Time(Periods{WhichPeriods}(1)),'mmm yy'),' to ',datestr(Time(Periods{WhichPeriods}(end)),'mmm yy')]})
    end
    xlabel('Factor Loading')
    
end

