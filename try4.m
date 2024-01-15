%区间直觉模糊数排序
%
%输入
%输出
%

clear 
clc

data=xlsread('数据集\data1\data1.xlsx');

G=4;      %属性数
A=5;      %目标数
% R=zeros(A*G,4);

%赋值
R=mat2cell(data,[1,1,1,1,1],[4,4,4,4]);%直接存成了cell型

D=zeros(A,A);
sum_w=zeros(1,G);
% a1=0;a2=0;b1=0;b2=0;c1=0;c2=0;d1=0;d2=0;
for l=1:G
%     D=zeros(A,A);
%     sum_w=zeros(1,G);
%     a1=0;a2=0;b1=0;b2=0;c1=0;c2=0;d1=0;d2=0;
for i=1:A %上下加，然后将所有目标在所有属性下求出一个总的离差值，最大化。
    m=R{i,l};
    a1=m(1);
    b1=m(2);
    c1=m(3);
    d1=m(4);
    for j=1:A
        if j==i
            continue
        end
        n=R{j,l};
        a2=n(1);
        b2=n(2);
        c2=n(3);
        d2=n(4);
        D(i,j)=0.25*(abs(a1-a2)+abs(b1-b2)+abs(c1-c2)+abs(d1-d2)+abs(b2-b1-d1+d2)+abs(a2+c2-a1-c1));
    end
end
sum_w(l)=sum(sum(D));      
end
sum_z=sum(sum_w);%总和
%求权值
w1=sum_w(1)/sum_z;
w2=sum_w(2)/sum_z;
w3=sum_w(3)/sum_z;
w4=sum_w(4)/sum_z;
w=[w1,w2,w3,w4];
%[m,n]=max(d);

%储存成cell型
% for i=1:A
%     for j=1:G
%         R(i,j)={[data(i,4*(j-1)+1),data(i,4*(j-1)+2),data(i,4*(j-1)+3),data(i,4*(j-1)+4)]};
%     end
% end
% R=mat2cell(data,[1,1,1,1,1],[4,4,4,4]);%直接存成了cell型


%sup
for l=1:A
D=zeros(G,G);
a1=0;a2=0;b1=0;b2=0;c1=0;c2=0;d1=0;d2=0;
for i=1:G
    m=R{l,i};
    a1=m(1);
    b1=m(2);
    c1=m(3);
    d1=m(4);
    for j=1:G
        if j==i
            continue
        end
        n=R{l,j};
        a2=n(1);
        b2=n(2);
        c2=n(3);
        d2=n(4);
        D(i,j)=0.25*(abs(a1-a2)+abs(b1-b2)+abs(c1-c2)+abs(d1-d2)+abs(b2-b1-d1+d2)+abs(a2+c2-a1-c1));
    end
end

%%求静态集结值
sum_sup=sum(D,2)';
T=zeros(G,G);
sum_e=zeros(1,G);
zs=zeros(1,G);
for i=1:4
    for j=1:4
        if j==i
            continue
        end
        T(i,j)=w(j)*(1-(D(i,j)/sum_sup(i)));
        T_a=sum(T,2)';
        sum_e(i)=w(i)*(1+T_a(i));
        sum_zs=sum(sum_e);
%         zs(i)=sum_e(i)/sum_zs;
    end
%     zs(i)=sum_e(i)/sum_zs;
end
% IIFPWGA=zeros(A,G);
a_e=zeros(1,G);
b_e=zeros(1,G);
c_e=zeros(1,G);
d_e=zeros(1,G);
IA1=1;
IA2=1;
IA3=1;
IA4=1;
zs=sum_e./sum_zs;
for i=1:4
%     zs(i)=sum_e(i)/sum_zs;
    a_e(i)=data(l,(i-1)*4+1)^zs(i);
    IA1=IA1*a_e(i);
    b_e(i)=data(l,(i-1)*4+2)^zs(i);
    IA2=IA2*b_e(i);
    c_e(i)=(1-data(l,(i-1)*4+3))^zs(i);
    IA3=IA3*c_e(i);
    d_e(i)=(1-data(l,(i-1)*4+4))^zs(i);
    IA4=IA4*d_e(i);
end
IIFPWGA(l,:)={IA1,IA2,(1-IA3),(1-IA4)};
end
IIFP=cell2mat(IIFPWGA);
for i=1:A
    S(i)=(IIFP(i,1)+IIFP(i,2)-IIFP(i,3)-IIFP(i,4))/2;
    H(i)=(IIFP(i,1)+IIFP(i,2)+IIFP(i,3)+IIFP(i,4))/2;
end


