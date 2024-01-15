x=[1 2 3 4 5 6 7];
st1=[0.657012975804419,0.348217895036821,0.264173992851711,0.586230360629928,0.386252500958044,-0.0844397088110456,0.0864956757277656];
st2=[0.721366105797191,0.349271982741033,0.183021205034334,0.504499838257290,0.336424131820913,-0.153090848878366,0.100019605679379];
st3=[0.666203531845275,0.414758872146329,0.143715530167576,0.597962098156450,0.322304843412559,-0.0467098871112597,0.101848792388734];
sT=[0.683247647821200,0.379718296737806,0.176142839561504,0.562907413686382,0.337362375466992,-0.0912389117048718,0.0974427314022315];

% wt=[0.2357,0.2131,0.2767,0.2745];


plot(x,st1,'-ok');
% plot(x,w1,'-o');
hold on
plot(x,st2,'-*g');
% plot(x,w2,'-*');
hold on
plot(x,st3,'-+b');
% plot(x,w3,'-+');
hold on
plot(x,sT,'-dr');
% plot(x,w4,'-+');
hold on
% plot(x,wt2,'-+r');
% % plot(x,w4,'-+');
% hold on
% plot(x,wt3,'-*r');
% % plot(x,w4,'-+');
% hold on

% l1=legend('t1:weight')
legend('t1时刻的排序为:A1>A4>A5>A2>A3>A7>A6','t2时刻的排序为:A1>A4>A2>A5>A3>A7>A6','t3时刻的排序为:A1>A4>A2>A5>A3>A7>A6','最后综合排序为:A1>A4>A2>A5>A3>A7>A6');
% leg=legend(w1,'t1:weight',w2,'t2:weight',w3,'t3:weight',wt,'t:weight');
% [legh,objh,outh,outm]=
% set(leg,'Box','off');
% set(legh,'position',[0.2,0.8,0.1,0.1]);

% legh2=copyobj(legh,gcf);
% [legh2,objh2,outh2,outm2]=legend(w2,'t2:weight');
% [legh2,objh2]=legend(w2,'t2:weight');
% set(legh2,'Box','off');
% set(legh2,'position',[0.4,0.8,0.1,0.1]);
% 
% legh3=copyobj(legh2,gcf);
% [legh3,objh3,outh3,outm3]=legend(w3,'t3:weight');
% [legh3,objh3]=legend(w3,'t2:weight');
% set(legh3,'Box','off');
% set(legh3,'position',[0.6,0.8,0.1,0.1]);
set(gca,'xtick',1:1:7);
set(gca,'xticklabel',{'1','2','3','4','5','6','7'});
xlabel('7个区域');
ylabel('得分函数值');
% title('the sorting of alternatives in different stage');
% text(1.25,0.4,'o--t1-weight');
% text(1.25,0.425,'*--t2-weight');
% text(1.25,0.45,'+--t3-weight');
% legend('t1:weight');
% 
% legend('t2:weight');
% legend('t3:weight');


axis([1 7 -0.5 0.8])
