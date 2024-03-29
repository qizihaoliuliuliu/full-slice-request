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
state=State_Space{1,1};
% [temp,value_state_iteration_times]=size(Value_State_record);
% value_iteration_special_state=[];
% for i =1:value_state_iteration_times
%     value_iteration_special_state=[value_iteration_special_state,Value_State_record{i}(1,1)];
% end
% 
% iteration_times=[];
% 
% for i=1:length(value_iteration_special_state)
%     iteration_times=[iteration_times,i];
% end
% 
% figure(1)
% plot(iteration_times,value_iteration_special_state);
% %axis([1,30,0 800])
% set(gca,'fontname','times') 
% set(gca,'fontsize',16)
% %title('the iteration of value state')
% xlabel('the number of iterations')
% ylabel('value of state')
% saveas(gca,"./Figure/iterationOfValueState.fig");
% saveas(gca,"./Figure/iterationOfValueState.eps",'epsc' );
% saveas(gca,"./Figure/iterationOfValueState.png");
% 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %figure 2
% %game iteration price change
% %choose state = State_Space{1,1}
% %choose first resource
% price_iteration=price_record{1,1};
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
% 
% figure(2)
% p=plot(price_iteration_x_axis,networking_price_iteration,...
%     price_iteration_x_axis,storage_price_iteration,...
%     price_iteration_x_axis,computing_price_iteration);
% p(1).LineWidth=1;
% p(1).LineStyle='-';
% p(1).Marker='o';
% p(2).LineWidth=1;
% p(2).LineStyle='-';
% p(2).Marker='s';
% p(3).LineWidth=1;
% p(3).LineStyle='-';
% p(3).Marker='x';
% axis( [1 8 0.6 1.6] )
% set(1,'DefaultAxesLineStyleOrder',{'-o',':s','--+'})
% %title('the iteration of price')
% xlabel('the number of iterations')
% ylabel('price')
% legend('networking','storage','computing','Location','southeast')
% set(gca,'fontname','times') 
% set(gca,'fontsize',16')
% saveas(gca,"./Figure/iterationOfPrice.fig");
% saveas(gca,"./Figure/iterationOfPrice.eps", 'epsc');
% saveas(gca,"./Figure/iterationOfPrice.png");
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %figure 3
% X_iteration=X_recourse_record{1,1};
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
% figure(3)
% p3=plot(X_iteration_x_axis,networking_X_iteration,...
%     X_iteration_x_axis,storage_X_iteration,...
%     X_iteration_x_axis,computing_X_iteration);
% axis( [1 8 0.5 4] )
% p3(1).LineWidth=1;
% p3(1).LineStyle='-';
% p3(1).Marker='o';
% p3(2).LineWidth=1;
% p3(2).LineStyle='-';
% p3(2).Marker='s';
% p3(3).LineWidth=1;
% p3(3).LineStyle='-';
% p3(3).Marker='x';
% 
% %title('the iteration of x')
% xlabel('the number of iterations')
% ylabel('$x_{i,j,z}(t)$','Interpreter','LaTex')
% set(gca,'fontname','times') 
% set(gca,'fontsize',16')
% legend('networking','storage','computing','Location','northeast')
% saveas(gca,"./Figure/iterationOfX.fig");
% saveas(gca,"./Figure/iterationOfX.eps", 'epsc' );
% saveas(gca,"./Figure/iterationOfX.png");


% %figure 4
% %3-D bar
% figure(4)
% reward_optimal_new=fliplr(reward_optimal(6:15,1:10));
% 
% 
% h=bar3(reward_optimal_new)
% pos=axis;
% xlabel({'   Avaliable resource(%)   '},'position',[6 14 -1])
% ylabel('Slice requests','position',[-1 8 0])
% zlabel('Reward')
% colormap('Bone')
% %title('reward of optimal')
% % %colorbar
% % %set(h,{'cdata'},cellfun(@(z)kron(z(2:6:end,2:3),ones(6,2)),get(h,'ZData'),'un',0))
% set(gca,'xticklabel',{'  ','20','  ','  ','  ','60','  ','  ','  ','100'});
% set(gca,'yticklabel',{'1','  ','  ','  ','5',' ','  ','  ','  ','10'});
% 
% set(gca,'fontname','times') 
% set(gca,'fontsize',16')
% saveas(gca,"./Figure/reward_of_optimal.fig");
% saveas(gca,"./Figure/reward_of_optimal.eps", 'epsc' );
% saveas(gca,"./Figure/reward_of_optimal.png");

% %figure 5
% %the percentage of allocate request
% %choose the resource max situation(in fact, the situtation can be choosed
% %randomly.
% %the number of choosen is Phi, Phi_Greedy, Phi_MMF
% %Phi(:,20) the number is from 30~10
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% optimal_number=Phi(1:11,1)';
% Greedy_number=Phi_Greedy(1:11,1)';
% MMF_number=Phi_MMF(1:11,1)';
% optimal_X_resource=X_Recourse_Unit_Optimal(1:11,1)';
% Greedy_X_resource=X_Recourse_Unit_Greedy(1:11,1)';
% MMF_X_resource=X_Recourse_Unit_MMF(1:11,1)';
% 
% %only use first resource
% 
% optimal_percentage=[];
% Greedy_percentage=[];
% MMF_percentage=[];
% max_number=state(1);
% for i =1:length(optimal_number)
%     
%     state=State_Space{i,1};
%     optimal_resource=optimal_X_resource{i};
%     Greedy_resource=Greedy_X_resource{i};
%     MMF_resource=MMF_X_resource{i};
%     optimal_percentage(i)=100*(optimal_number(i)*delta_recourse(1)*optimal_resource(1)/Resource_max_unit(1));
%     Greedy_percentage(i)=100*(Greedy_number(i)*delta_recourse(1)*Greedy_resource(1)/Resource_max_unit(1));
%     MMF_percentage(i)=100*(MMF_number(i)*delta_recourse(1)*MMF_resource(1)/Resource_max_unit(1));
% end
% optimal_percentage=fliplr(optimal_percentage)./100;
% Greedy_percentage=fliplr(Greedy_percentage)./100;
% MMF_percentage=fliplr(MMF_percentage)./100;
% 
% barNumber=[];
% number=5:1:15;
% % for i=1:length(number)
% %  
% %     barNumber=[barNumber
% %         number(i),number(i),number(i)];
% % end
% % bar_percentage=[];
% % for i=1:length(number)
% %     bar_percentage=[bar_percentage
% %         optimal_percentage(i),Greedy_percentage(i),MMF_percentage(i)];
% % end
% % 
% figure(5)
% %p5=bar(barNumber,bar_percentage);
% p5=plot(number,optimal_percentage,number,Greedy_percentage,number,MMF_percentage);
% p5(1).LineWidth=1;
% p5(1).LineStyle='-';
% p5(1).Marker='o';
% p5(2).LineWidth=1;
% p5(2).LineStyle='-';
% p5(2).Marker='s';
% p5(3).LineWidth=1;
% p5(3).LineStyle='-';
% p5(3).Marker='x';
% % 
% xlabel('request number')
% ylabel('admissible ratio')
% legend({'OAR','Greedy','MMF'},'location','southwest')
% set(gca,'fontname','times') 
% set(gca,'fontsize',16')
% saveas(gca,"./Figure/allocatedPercentage.fig");
% saveas(gca,"./Figure/allocatedPercentage.eps", 'epsc' );
% saveas(gca,"./Figure/allocatedPercentage.png");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set(gca,'position',[0.15,0.15,0.8,0.8]);
% set(gcf,'unit','normalized','position',[0.1,0.1,0.64,0.8]);
% set(gcf, 'PaperPositionMode', 'manual');
% set(gcf, 'PaperUnits', 'points');
% set(gcf, 'PaperPosition', [0 0 640 480]);
% 
% figure(6)
% 
% optimal_reward=reward_optimal(1:15,5)';
% Greedy_reward=reward_Greedy(1:15,5)';
% MMF_reward=reward_MMF(1:15,5)';
% number=1:1:15;
% optimal_reward=fliplr(optimal_reward);
% Greedy_reward=fliplr(Greedy_reward);
% MMF_reward=fliplr(MMF_reward);
% p6=plot(number,optimal_reward,number,Greedy_reward,number,MMF_reward);
% p6=plot(number,optimal_reward,number,Greedy_reward,number,MMF_reward);
% p6(1).LineWidth=2;
% p6(1).LineStyle='-';
% p6(1).Marker='o';
% p6(1).MarkerSize=15;
% p6(1).Color='r';
% p6(2).LineWidth=2;
% p6(2).LineStyle='-';
% p6(2).Marker='s';
% p6(2).MarkerSize=15;
% p6(2).Color='k';
% p6(3).LineWidth=2;
% p6(3).LineStyle='-';
% p6(3).Marker='x';
% p6(3).Color='b';
% p6(3).MarkerSize=15;
% set(gca,'fontsize',22')
% grid on
% axis([1,10,0,200])
% xlabel('Slice requests')
% ylabel('Reward')
% legend({'OAR','Greedy','MMF'},'location','southwest')
% set(gca,'fontname','times') 
% % set(gca,'fontsize',16')
% barNumber=[];
% 
% % for i=1:length(number)
% %  
% %     barNumber=[barNumber
% %         number(i),number(i),number(i)];
% % end
% % bar_reward=[];
% % for i=1:length(number)
% %     bar_reward=[bar_reward
% %         optimal_reward(i),Greedy_reward(i),MMF_reward(i)];
% % end
% % p6=bar(barNumber,bar_reward);
% % xlabel('request number')
% % ylabel('reward')
% % legend('optimal','Greedy','MMF')
% %grid on
% saveas(gca,"./Figure/RewardCompare.fig");
% saveas(gca,"./Figure/RewardCompare.eps" , 'epsc');
% saveas(gca,"./Figure/RewardCompare.png");

% 

% 
figure(7)
set(gca,'position',[0.15,0.15,0.8,0.8]);
set(gcf,'unit','normalized','position',[0.1,0.1,0.64,0.8]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperPosition', [0 0 640 480]);

optimal_reward=reward_optimal(1,:);
Greedy_reward=reward_Greedy(1,:);
MMF_reward=reward_MMF(1,:);
number=1:1:11;
optimal_reward=fliplr(optimal_reward);
Greedy_reward=fliplr(Greedy_reward);
MMF_reward=fliplr(MMF_reward);
number=1:10
optimal_reward=optimal_reward(2:11);
Greedy_reward=Greedy_reward(2:11);
MMF_reward=MMF_reward(2:11);
p7=plot(number,optimal_reward,number,Greedy_reward,number,MMF_reward);
p7(1).LineWidth=2;
p7(1).LineStyle='-';
p7(1).Marker='o';
p7(1).MarkerSize=15;
p7(1).Color='r';
p7(2).LineWidth=2;
p7(2).LineStyle='-';
p7(2).Marker='s';
p7(2).MarkerSize=15;
p7(2).Color='k';
p7(3).LineWidth=2;
p7(3).LineStyle='-';
p7(3).Marker='x';
p7(3).Color='b';
p7(3).MarkerSize=15;
set(gca,'fontsize',22')
grid on
xlabel('Available resource(%)')
ylabel('Reward')
axis([1,10,-50,250])
legend({'OAR','Greedy','MMF'},'location','northwest')
set(gca,'xticklabel',10:10:100);
set(gca,'fontname','times') 
set(gca,'fontsize',22')
barNumber=[];

% for i=1:length(number)
%  
%     barNumber=[barNumber
%         number(i),number(i),number(i)];
% end
% bar_reward=[];
% for i=1:length(number)
%     bar_reward=[bar_reward
%         optimal_reward(i),Greedy_reward(i),MMF_reward(i)];
% end
% p6=bar(barNumber,bar_reward);
% xlabel('request number')
% ylabel('reward')
% legend('optimal','Greedy','MMF')
%grid on
saveas(gca,"./Figure/RewardCompare_resource.fig");
saveas(gca,"./Figure/RewardCompare_resource.eps", 'epsc' );
saveas(gca,"./Figure/RewardCompare_resource.png");

end
