load fullData/RunningTime.mat
a=156.5580;
RunningTime=[a,RunningTime]
requestNumber=15:5:40;
bar(requestNumber,RunningTime);
xlabel("Max number of slice requests")
ylabel("Rnning time in second")
set(gca,'fontname','times') 
set(gca,'fontsize',16')
saveas(gcf,"./FullFigure/RunningTime.fig");
saveas(gcf,"./FullFigure/RunningTime.eps" );
saveas(gcf,"./FullFigure/RunningTime.png");