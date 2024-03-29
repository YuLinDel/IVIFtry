% Intuitionistic fuzzy number sorting in percentage interval
%
% Input
% Output
%

clear 
clc

%input historical values
A=[0.226881615792136,0.341854141458266,0.538794953629984,0.648059407291143;
    0.230664000778561,0.345992306143347,0.533811886643573,0.643309235887510;
    0.228383037319465,0.343475525976917,0.536927089974849,0.646264564673060;
    0.227872542565563,0.342914632432172,0.537439795556604,0.646763855235854;
    0.231286671332267,0.346440573850429,0.533669382009413,0.643049584740802];
B=[0,0.219832516454287,0.455681063471099,0.575920839820106;
    0,0.221193435014007,0.454023766958917,0.574612657109568;
    0,0.220844936850799,0.454590837406309,0.575150172313467;
    0,0.219915574157977,0.455561462993014,0.575747298835953;
    0,0.222992443747547,0.452420527240931,0.573245560986762];
C=[0,0.223961485228046,0.662437892500327,0.746972010584423;
    0,0.225251234079158,0.660998429599830,0.746225714031293;
    0,0.224264876821613,0.662106385218036,0.746732758954804;
    0,0.224265301452983,0.662111457418844,0.746669397047345;
    0,0.226145160571663,0.660228756783580,0.744625791286994];

%incorporate time weighting
wt=[0.238,0.323,0.438];

DD=[A B C];
R=mat2cell(DD,[1,1,1,1,1],[4,4,4]);%directly stored as cell type
A=5;
G=3;
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
        D(i,j)=0.25*(abs(a1-a2)+abs(b1-b2)+abs(c1-c2)+abs(d1-d2));
    end
end

%%requesting static aggregation value
sum_sup=sum(D,2)';
T=zeros(G,G);
sum_e=zeros(1,G);
zs=zeros(1,G);
for i=1:G
    for j=1:G
        if j==i
            continue
        end
        T(i,j)=wt(j)*(1-(D(i,j)/sum_sup(i)));
        T_a=sum(T,2)';
        sum_e(i)=wt(i)*(1+T_a(i));
        sum_zs=sum(sum_e);
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
for i=1:G
    zs(i)=sum_e(i)/sum_zs;
    a_e(i)=DD(1,(i-1)*4+1)^zs(i);
    IA1=IA1*a_e(i);
    b_e(i)=DD(1,(i-1)*4+2)^zs(i);
    IA2=IA2*b_e(i);
    c_e(i)=(1-DD(1,(i-1)*4+3))^zs(i);
    IA3=IA3*c_e(i);
    d_e(i)=(1-DD(1,(i-1)*4+4))^zs(i);
    IA4=IA4*d_e(i);
end
IIFPWGA(l,:)={IA1,IA2,(1-IA3),(1-IA4)};
end

IIFP=cell2mat(IIFPWGA);
for i=1:A
    S(i)=(IIFP(i,1)+IIFP(i,2)-IIFP(i,3)-IIFP(i,4))/2;
    H(i)=(IIFP(i,1)+IIFP(i,2)+IIFP(i,3)+IIFP(i,4))/2;
end


