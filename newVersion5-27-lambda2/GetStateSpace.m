function State_Space= GetStateSpace()
%GETSTATESPACE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
global Resource_networking_max_block Resource_storage_max_block Resource_computing_max_block Request_number_max
global delta_networking delta_storage delta_computing
Space_state_networking=CreateRecourseSpaceState(Resource_networking_max_block,delta_networking);
Space_state_storage=CreateRecourseSpaceState(Resource_storage_max_block,delta_storage);
Space_state_computing=CreateRecourseSpaceState(Resource_computing_max_block,delta_computing);
%�����ߵ�״̬�ռ��������ʾ��

Space_state_recourse_number=length(Space_state_networking);
Space_state_recourse=[];
for i =1:Space_state_recourse_number
    temp=[Space_state_networking(i),Space_state_storage(i),Space_state_computing(i)];
    Space_state_recourse=[Space_state_recourse;temp];
end
%���ڵ�ǰϵͳ���Ŷ�����������ݶ�����ΪRequest_number_max(20)��,��ô����������״̬�ռ�Ϊ[0,1,2,...,30]
Space_state_reqeust=CreateRequestNumberSpaceState(Request_number_max);
Space_state_reqeust_number=Request_number_max+1;%������Ҫ����0�������
%״̬�ռ�ΪSpace_state_reqeust_number,Space_state_networking,Space_state_storage,Space_state_computing���ߵĵѿ�����
fprintf('the space state of request number:%d\n',Space_state_reqeust_number);
%�������ǽ����ߵ�״̬�ռ�����Ӧ����Ϊһ�£����ǽ�n_i_networking��״̬�ռ���Ϊ��״̬�ռ�����
%��Ϊʵ������˵����������Դ��״̬�Ǿ�������Ե�
fprintf('the space state of recourse number:%d\n',Space_state_recourse_number);
fprintf('whole state number:%d\n',Space_state_recourse_number*Space_state_reqeust_number)

%����cell����洢state
State_Space=cell(Space_state_reqeust_number,Space_state_recourse_number);
for i =1:Space_state_reqeust_number
    for j = 1:Space_state_recourse_number
        State_Space{i,j}=[Space_state_reqeust(i),Space_state_networking(j),Space_state_storage(j),Space_state_computing(j)];
    end
end

end

