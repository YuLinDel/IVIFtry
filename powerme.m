%区间直觉模糊数排序
%
%输入
%输出
%

clear 
clc   

data=xlsread('power11.xlsx');

G=3;      %属性数
A=7;      %企业数
% R=zeros(A*G,4);

%赋值
R=mat2cell(data,[1,1,1,1,1,1,1],[2,2,2]);%直接存成了cell型




% 这里是竖着加的
for l=1:G

    m=R{1,l};
    D(l,1)=m(1);
    D(l,2)=m(2);
%     c1=m(3);
%     d1=m(4);
    for j=2:A
        n=R{j,l};
        a2=n(1);
        b2=n(2);
%         c2=n(3);
%         d2=n(4);
        D(l,1)=D(l,1)+a2-D(l,1)*a2;
        D(l,2)=D(l,2)*b2;
    end
%     D_s(l,1)=D(1,1);
%     D_s(l,2)=D(1,2);
end
 


