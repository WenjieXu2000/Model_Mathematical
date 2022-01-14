function [indicators,w1,w2,w3]= Comprehensive_index(x,ind)
% �������ַ�����ۺ�����ָ��
% ���������
% x��ԭʼ���ݾ���, һ�д���һ������, ÿ�ж�Ӧһ��ָ�ꣻ
% ind��ָʾ������ָʾ��������ָ�껹�Ǹ���ָ�꣬1��ʾ����ָ�꣬2��ʾ����ָ�ꣻ
% ���������
% ERI������˥��ָ�� economic recession index��
% ESI����̬ϵͳ�ɳ�����ָ�� ecosystem sustainability index��
% SHI�����ɾ�ס�� social habitability index��

% �����һ������
[n,m]=size(x); % n������, m��ָ��
for i=1:m
    if ind(i)==1 %����ָ���һ��
        Y(:,i)=MinMaxNormalized(x(:,i),1,0.0001,0.9999);   
    else %����ָ���һ��
        Y(:,i)=MinMaxNormalized(x(:,i),2,0.0001,0.9999);
    end
end

% ��Ȩ��
[s1,w1]=Entropy_Weight_Method(x(:,1:3),ind(1:3));
[s2,w2]=Entropy_Weight_Method(x(:,4:7),ind(4:7));
[s3,w3]=Entropy_Weight_Method(x(:,8:end),ind(8:end));

% �������ָ�����
ERI = w1(1)*Y(:,1) + w1(2)*Y(:,2) + w1(3)*Y(:,3)
ESI = w2(1)*Y(:,4) + w2(2)*Y(:,5) + w2(3)*Y(:,6) + w2(4)*Y(:,7)
SHI = w3(1)*Y(:,8) + w3(2)*Y(:,9) + w3(3)*Y(:,10) +w3(4)*Y(:,11) + w3(5)*Y(:,12)
indicators = [ERI,ESI,SHI]