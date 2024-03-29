function PlotPlot()
Resource_networking_max_unit=20;%SP全部的networking资源，这里的单位为Unit     20*100Mbps
Rescource_storage_max_unit=20;%SP全部的storage资源，这里的单位为Unit               20GB
Resource_computing_max_unit=20;%SP全部的computing资源，这里的单位为Unit    40CPU
Resource_max_unit=[Resource_networking_max_unit,Rescource_storage_max_unit,Resource_computing_max_unit];

delta_networking=1;%一个slice_request请求了1块networking资源 100Mbps
delta_storage=1;%一个slice_request分别请求了2块storage资源 1GB
delta_computing=2;%一个slice_request分别请求了1块computing资源 2CPU
%
delta_recourse=[delta_networking,delta_storage,delta_computing];
load singleData/Value_State_record.mat %figure 1
load singleData/price_record.mat %price iteration plot figure 2
load singleData/X_recourse_record.mat %X_recourse iteration plot figure 3
% size(Value_State_record)
% size(price_record)
% size(price_record)

%figure 5
load singleData/Phi
load singleData/Phi_Greedy.mat
load singleData/Phi_MMF.mat

load singleData/X_Recourse_Unit_Optimal.mat
load singleData/X_Recourse_Unit_Greedy.mat
load singleData/X_Recourse_Unit_MMF.mat

load singleData/Value_State.mat%最优值函数
load singleData/Price_Optimal.mat

load singleData/reward_optimal.mat;%价格 figure 4
load singleData/reward_Greedy.mat;
load singleData/reward_MMF.mat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure 1
%MDP value iteration process
%chose state=State_Space{1,1}
load singleData/State_Space;
state=State_Space{1,6};
[temp,value_state_iteration_times]=size(Value_State_record);
value_iteration_special_state1=[];
for i =1:value_state_iteration_times
    value_iteration_special_state1=[value_iteration_special_state1,Value_State_record{i}(1,6)];
end
value_iteration_special_state2=[]
state=State_Space{13,6};
for i =1:value_state_iteration_times
    value_iteration_special_state2=[value_iteration_special_state2,Value_State_record{i}(13,6)];
end



iteration_times=[];

for i=1:length(value_iteration_special_state1)
    iteration_times=[iteration_times,i];
end


set(gca,'position',[0.15,0.15,0.8,0.8]);
set(gcf,'unit','normalized','position',[0.1,0.1,0.64,0.8]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 640 480]);

figure(1)
p1=plot(iteration_times,value_iteration_special_state1,iteration_times,value_iteration_special_state2);
%axis([1,30,0 800])

p1(1).Marker='o';
p1(2).Marker='s';

p1(1).LineWidth=2;
p1(1).LineStyle='-';
p1(1).Marker='o';
p1(1).MarkerSize=15;
p1(1).Color='r';
p1(2).LineWidth=2;
p1(2).LineStyle='-';
p1(2).Marker='s';
p1(2).MarkerSize=15;
p1(2).Color='b';
set(gca,'fontname','times') 
set(gca,'xtick',1:1:15);
axis([1,15,0 200])
set(gca,'fontsize',22')
grid on

legend('State1','State2','Location','southeast')
%title('the iteration of value state')
xlabel('The number of iterations')
ylabel('Value of state')
saveas(gca,"./Figure-state1/State1-iterationOfValueState.fig");
saveas(gca,"./Figure-state1/State1-iterationOfValueState.eps",'epsc' );
saveas(gca,"./Figure-state1/State1-iterationOfValueState.png");

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %figure 2
% %game iteration price change
% %choose state = State_Space{1,1}
% %choose first resource
% price_iteration=price_record{1,6};
% price_iteration_x_axis=[];
% for i=1:length(price_iteration)
%     price_iteration_x_axis=[price_iteration_x_axis,i];
% end
% 
% networking_price_iteration=[];
% storage_price_iteration=[];
% computing_price_iteration=[];
% for i=1:length(price_iteration)
%     networking_price_iteration=[networking_price_iteration,price_iteration{i}(1)];
%     storage_price_iteration=[storage_price_iteration,price_iteration{i}(2)];
%     computing_price_iteration=[computing_price_iteration,price_iteration{i}(3)];
%     
% end
% 
% set(gca,'position',[0.15,0.15,0.8,0.8]);
% set(gcf,'unit','normalized','position',[0.1,0.1,0.64,0.8]);
% set(gcf, 'PaperPositionMode', 'manual');
% set(gcf, 'PaperUnits', 'points');
% set(gcf, 'PaperPosition', [0 0 640 480]);
% figure(2)
% % ts1 = timeseries(networking_price_iteration, price_iteration_x_axis);
% % ts2 = timeseries(storage_price_iteration, price_iteration_x_axis);
% % ts3 = timeseries(computing_price_iteration, price_iteration_x_axis);
% % plot(ts1,ts2,ts3)
% p2=plot(price_iteration_x_axis,networking_price_iteration,...
%     price_iteration_x_axis,storage_price_iteration,...
%     price_iteration_x_axis,computing_price_iteration);
% p2(1).LineWidth=2;
% p2(1).LineStyle='-';
% p2(1).Marker='o';
% p2(1).MarkerSize=15;
% p2(1).Color='r';
% p2(2).LineWidth=2;
% p2(2).LineStyle='-';
% p2(2).Marker='s';
% p2(2).MarkerSize=15;
% p2(2).Color='k';
% p2(3).LineWidth=2;
% p2(3).LineStyle='-';
% p2(3).Marker='x';
% p2(3).Color='b';
% p2(3).MarkerSize=15;
% set(gca,'fontsize',22')
% grid on
% axis( [1 8 0.6 1.6] )
% set(gca,'xtick',1:1:9);
% set(gca,'fontname','times')
% %title('the iteration of price')
% xlabel('The number of iterations')
% ylabel('Price')
% legend('Networking','Storage','Computing','Location','southeast')
% 
% saveas(gca,"./Figure-state1/State1-iterationOfPrice.fig");
% saveas(gca,"./Figure-state1/State1-iterationOfPrice.eps",'epsc' );
% saveas(gca,"./Figure-state1/State1-iterationOfPrice.png");
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %figure 3
% X_iteration=X_recourse_record{1,6};
% X_iteration_x_axis=[];
% for i=1:length(X_iteration)
%     X_iteration_x_axis=[X_iteration_x_axis,i];
% end
% 
% networking_X_iteration=[];
% storage_X_iteration=[];
% computing_X_iteration=[];
% for i=1:length(X_iteration)
%     networking_X_iteration=[networking_X_iteration,X_iteration{i}(1)];
%     storage_X_iteration=[storage_X_iteration,X_iteration{i}(2)];
%     computing_X_iteration=[computing_X_iteration,X_iteration{i}(3)]; 
% end
% 
% 
% set(gca,'position',[0.15,0.15,0.8,0.8]);
% set(gcf,'unit','normalized','position',[0.1,0.1,0.64,0.8]);
% set(gcf, 'PaperPositionMode', 'manual');
% set(gcf, 'PaperUnits', 'points');
% set(gcf, 'PaperPosition', [0 0 640 480]);
% 
% figure(3)
% p3=plot(X_iteration_x_axis,networking_X_iteration,...
%     X_iteration_x_axis,storage_X_iteration,...
%     X_iteration_x_axis,computing_X_iteration);
% axis( [1 8 0.5 4] )
% % set(gca,'xtick',1:1:9);
% p3(1).LineWidth=2;
% p3(1).LineStyle='-';
% p3(1).Marker='o';
% p3(1).MarkerSize=15;
% p3(1).Color='r';
% p3(2).LineWidth=2;
% p3(2).LineStyle='-';
% p3(2).Marker='s';
% p3(2).MarkerSize=15;
% p3(2).Color='k';
% p3(3).LineWidth=2;
% p3(3).LineStyle='-';
% p3(3).Marker='x';
% p3(3).Color='b';
% p3(3).MarkerSize=15;
% set(gca,'fontsize',22')
% grid on
% %title('the iteration of x')
% xlabel('The number of iterations')
% ylabel('$x_{i,j,z}(t)$','Interpreter','LaTex')
% set(gca,'fontname','times') 
% 
% legend('Networking','Storage','Computing','Location','northeast')
% saveas(gca,"./Figure-state1/State1-iterationOfX.fig");
% saveas(gca,"./Figure-state1/State1-iterationOfX.eps" ,'epsc');
% saveas(gca,"./Figure-state1/State1-iterationOfX.png");
% 
% 
% % %figure 4
% % %3-D bar
% % figure(4)
% % reward_optimal_new=fliplr(reward_optimal(6:15,1:10));
% % 
% % 
% % h=bar3(reward_optimal_new,'w')
% % pos=axis;
% % xlabel({'   avaliable' 'resource(%)   '},'position',[6 13 0])
% % ylabel('request number','position',[-1 8 0])
% % zlabel('reward')
% % %title('reward of optimal')
% % % %colorbar
% % % %set(h,{'cdata'},cellfun(@(z)kron(z(2:6:end,2:3),ones(6,2)),get(h,'ZData'),'un',0))
% % set(gca,'xticklabel',{'  ','20','  ','  ','  ','60','  ','  ','  ','100'});
% % set(gca,'yticklabel',{'1','  ','  ','  ','5',' ','  ','  ','  ','10'});
% % 
% % set(gca,'fontname','times') 
% % set(gca,'fontsize',16')
% % saveas(gca,"./Figure-state1/State1-reward_of_optimal.fig");
% % saveas(gca,"./Figure-state1/State1-reward_of_optimal.eps",'epsc' );
% % saveas(gca,"./Figure-state1/State1-reward_of_optimal.png");
% % 
% % %figure 5
% % %the percentage of allocate request
% % %choose the resource max situation(in fact, the situtation can be choosed
% % %randomly.
% % %the number of choosen is Phi, Phi_Greedy, Phi_MMF
% % %Phi(:,20) the number is from 30~10
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % 
% % optimal_number=Phi(1:11,1)';
% % Greedy_number=Phi_Greedy(1:11,1)';
% % MMF_number=Phi_MMF(1:11,1)';
% % optimal_X_resource=X_Recourse_Unit_Optimal(1:11,1)';
% % Greedy_X_resource=X_Recourse_Unit_Greedy(1:11,1)';
% % MMF_X_resource=X_Recourse_Unit_MMF(1:11,1)';
% % 
% % %only use first resource
% % 
% % optimal_percentage=[];
% % Greedy_percentage=[];
% % MMF_percentage=[];
% % max_number=state(1);
% % for i =1:length(optimal_number)
% %     
% %     state=State_Space{i,1};
% %     optimal_resource=optimal_X_resource{i};
% %     Greedy_resource=Greedy_X_resource{i};
% %     MMF_resource=MMF_X_resource{i};
% %     optimal_percentage(i)=100*(optimal_number(i)*delta_recourse(1)*optimal_resource(1)/Resource_max_unit(1));
% %     Greedy_percentage(i)=100*(Greedy_number(i)*delta_recourse(1)*Greedy_resource(1)/Resource_max_unit(1));
% %     MMF_percentage(i)=100*(MMF_number(i)*delta_recourse(1)*MMF_resource(1)/Resource_max_unit(1));
% % end
% % optimal_percentage=fliplr(optimal_percentage)./100;
% % Greedy_percentage=fliplr(Greedy_percentage)./100;
% % MMF_percentage=fliplr(MMF_percentage)./100;
% % 
% % barNumber=[];
% % number=5:1:15;
% % % for i=1:length(number)
% % %  
% % %     barNumber=[barNumber
% % %         number(i),number(i),number(i)];
% % % end
% % % bar_percentage=[];
% % % for i=1:length(number)
% % %     bar_percentage=[bar_percentage
% % %         optimal_percentage(i),Greedy_percentage(i),MMF_percentage(i)];
% % % end
% % % 
% % figure(5)
% % %p5=bar(barNumber,bar_percentage);
% % p5=plot(number,optimal_percentage,number,Greedy_percentage,number,MMF_percentage);
% % p5(1).LineWidth=1;
% % p5(1).LineStyle='-';
% % p5(1).Marker='o';
% % p5(2).LineWidth=1;
% % p5(2).LineStyle='-';
% % p5(2).Marker='s';
% % p5(3).LineWidth=1;
% % p5(3).LineStyle='-';
% % p5(3).Marker='x';
% % % 
% % xlabel('request number')
% % ylabel('admissible ratio')
% % legend({'OAR','Greedy','MMF'},'location','southwest')
% % set(gca,'fontname','times') 
% % set(gca,'fontsize',16')
% % saveas(gca,"./Figure-state1/State1-allocatedPercentage.fig");
% % saveas(gca,"./Figure-state1/State1-allocatedPercentage.eps",'epsc' );
% % saveas(gca,"./Figure-state1/State1-allocatedPercentage.png");
% % 
% % figure(6)
% % 
% % optimal_reward=reward_optimal(1:15,5)';
% % Greedy_reward=reward_Greedy(1:15,5)';
% % MMF_reward=reward_MMF(1:15,5)';
% % number=1:1:15;
% % optimal_reward=fliplr(optimal_reward);
% % Greedy_reward=fliplr(Greedy_reward);
% % MMF_reward=fliplr(MMF_reward);
% % p6=plot(number,optimal_reward,number,Greedy_reward,number,MMF_reward);
% % p6(1).LineWidth=1;
% % p6(1).LineStyle='-';
% % p6(1).Marker='o';
% % p6(2).LineWidth=1;
% % p6(2).LineStyle='-';
% % p6(2).Marker='s';
% % p6(3).LineWidth=1;
% % p6(3).LineStyle='-';
% % p6(3).Marker='x';
% % axis([1,10,0,200])
% % xlabel('request number')
% % ylabel('reward')
% % legend({'OAR','Greedy','MMF'},'location','southwest')
% % set(gca,'fontname','times') 
% % set(gca,'fontsize',16')
% % barNumber=[];
% % 
% % % for i=1:length(number)
% % %  
% % %     barNumber=[barNumber
% % %         number(i),number(i),number(i)];
% % % end
% % % bar_reward=[];
% % % for i=1:length(number)
% % %     bar_reward=[bar_reward
% % %         optimal_reward(i),Greedy_reward(i),MMF_reward(i)];
% % % end
% % % p6=bar(barNumber,bar_reward);
% % % xlabel('request number')
% % % ylabel('reward')
% % % legend('optimal','Greedy','MMF')
% % %grid on
% % saveas(gca,"./Figure-state1/State1-RewardCompare.fig");
% % saveas(gca,"./Figure-state1/State1-RewardCompare.eps",'epsc' );
% % saveas(gca,"./Figure-state1/State1-RewardCompare.png");
% % 
% % 
% % 
% % figure(7)
% % 
% % optimal_reward=reward_optimal(1,:);
% % Greedy_reward=reward_Greedy(1,:);
% % MMF_reward=reward_MMF(1,:);
% % number=1:1:11;
% % optimal_reward=fliplr(optimal_reward);
% % Greedy_reward=fliplr(Greedy_reward);
% % MMF_reward=fliplr(MMF_reward);
% % p7=plot(number,optimal_reward,number,Greedy_reward,number,MMF_reward);
% % p7(1).LineWidth=1;
% % p7(1).LineStyle='-';
% % p7(1).Marker='o';
% % p7(2).LineWidth=1;
% % p7(2).LineStyle='-';
% % p7(2).Marker='s';
% % p7(3).LineWidth=1;
% % p7(3).LineStyle='-';
% % p7(3).Marker='x';
% % xlabel('percentage(%)')
% % ylabel('reward')
% % axis([1,10,-50,200])
% % legend({'OAR','Greedy','MMF'},'location','northwest')
% % set(gca,'xticklabel',{'20','40','60','80', '100'});
% % set(gca,'fontname','times') 
% % set(gca,'fontsize',16')
% % barNumber=[];
% % 
% % % for i=1:length(number)
% % %  
% % %     barNumber=[barNumber
% % %         number(i),number(i),number(i)];
% % % end
% % % bar_reward=[];
% % % for i=1:length(number)
% % %     bar_reward=[bar_reward
% % %         optimal_reward(i),Greedy_reward(i),MMF_reward(i)];
% % % end
% % % p6=bar(barNumber,bar_reward);
% % % xlabel('request number')
% % % ylabel('reward')
% % % legend('optimal','Greedy','MMF')
% % %grid on
% % saveas(gca,"./Figure-state1/State1-RewardCompare_resource.fig");
% % saveas(gca,"./Figure-state1/State1-RewardCompare_resource.eps",'epsc' );
% % saveas(gca,"./Figure-state1/State1-RewardCompare_resource.png");

end
