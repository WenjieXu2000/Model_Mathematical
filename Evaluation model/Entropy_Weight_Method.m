function [s,w]=Entropy_Weight_Method(x,ind)
% ��Ȩ����EWM��
% ���������
% x��ԭʼ���ݾ���, һ�д���һ������, ÿ�ж�Ӧһ��ָ�ꣻ
% ind��ָʾ������ָʾ��������ָ�껹�Ǹ���ָ�꣬1��ʾ����ָ�꣬2��ʾ����ָ�ꣻ
% ���������
% s�����еĵ÷֣�
% w����ָ��Ȩ�أ�
[n,m]=size(x); % n������, m��ָ��
%%���ݵĹ�һ������
for i=1:m
    if ind(i)==1 %����ָ���һ��
        Y(:,i)=MinMaxNormalized(x(:,i),1,0.0001,0.9999);   
    else %����ָ���һ��
        Y(:,i)=MinMaxNormalized(x(:,i),2,0.0001,0.9999);
    end
end
%����p(i,j)
for i=1:n
    for j=1:m
        p(i,j)=Y(i,j)/sum(Y(:,j));
    end
end
%��j��ָ�����ֵe(j)
k=1/log(n);
for j=1:m
    e(j)=-k*sum(p(:,j).*log(p(:,j)));
end
d=ones(1,m)-e; %��Ϣ�������
w=d./sum(d); 
s=100*w*Y'; 