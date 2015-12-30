function[chart] =ContriToReturns(Names,Time,Half,Contributions,WhichPeriods)
%ContriToReturns(SelectedFactorNames{FirstOrSecond},Dates,NFirstHalf,ArithSameVolFactorContributionsWithActualAlpha{FirstOrSecond},FirstOrSecond) 

    Periods{1}=(1:Half)';
    Periods{2}=(Half+1:length(Time))';
 Bar2=barh(diag([Contributions,sum(Contributions)]),'stacked');    % Plot arithmetic factor contribution to returns

    set(gca,'yticklabel',['Alpha',Names,'Total']);                                        % Format chart
    set(Bar2,'facecolor','b')
    set(Bar2(1),'facecolor','r')
    set(Bar2(end),'facecolor','k')
    
    if length(Time) >Half
         title({'Arithmetic Factor Contribution to Returns'; ['Subperiod ',num2str(WhichPeriods),': ',datestr(Time(Periods{WhichPeriods}(1)),'mmm yy'),' to ',datestr(Time(Periods{WhichPeriods}(end)),'mmm yy')]})
      else
        title({'Static Factor Exposures';[datestr(Time(Periods{WhichPeriods}(1)),'mmm yy'),' to ',datestr(Time(Periods{WhichPeriods}(end)),'mmm yy')]})
    end
    xlabel('Factor Monthly Return * Factor Loading * 12')

    hx=get(Bar2(1),'XData'); 
    hy=get(Bar2(1),'YData');
    text(hy(1)*1.02, hx(1), [num2str(round((hy(1))*100*10^1)/10^1),'%']); 
end

