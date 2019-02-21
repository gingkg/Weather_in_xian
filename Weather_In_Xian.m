%绘制西安天气图
%Author:ShenBaoyin
%Date:2018/10/23

close all
clear all

%西安四季温度范围
Spring_Temp = [4,14];
Summer_Temp = [18,30];
Autumn_Temp = [16,25];
Winter_Temp = [1, 8];
Temperature_Range = [Spring_Temp(1),Spring_Temp(2)-Spring_Temp(1);
                     Summer_Temp(1),Summer_Temp(2)-Summer_Temp(1);
                     Autumn_Temp(1),Autumn_Temp(2)-Autumn_Temp(1);
                     Winter_Temp(1),Winter_Temp(2)-Winter_Temp(1)];
SeasonSet = {'春季','夏季','秋季','冬季'};
Season = categorical(SeasonSet,SeasonSet);

Highest_Temp = [6,8,14,21,26,32,32,31,25,19,12,6];
Lowest_Temp = [-4,-1,4,9,14,19,22,21,16,10,3,-3];
Temperature = [Highest_Temp;Lowest_Temp];%温度/摄氏度
Precipitation = [7,10,26,45,50,50,101,77,95,62,26,7];%降水量/mm
MonthSet = {'一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'};
Month = categorical(MonthSet,MonthSet);

Spring_Precip = sum(Precipitation(1:3));
Summer_Precip = sum(Precipitation(4:6));
Autumn_Precip = sum(Precipitation(7:9));
Winter_Precip = sum(Precipitation(10:12));


%绘制西安四季的温度范围图
%直方图
figure
b = bar(Season,Temperature_Range,0.3,'stacked');
b(1,1).Visible = 'off';%不可见
b(1,1).ShowBaseLine = 'off';%基准线不可见
b(1,2).FaceColor = [0,0,1];
ylim([-5,40]);
xlabel('季节');
ylabel('温度变化范围/\circC');
title('西安四季的温度范围图');
grid on
for i = 1:4
    Top = Temperature_Range(i,1)+Temperature_Range(i,2);
    Bottom = Temperature_Range(i,1);
    text(i-0.05,ceil(Top)+1,num2str(Top));
    text(i-0.05,floor(Bottom)-1,num2str(Bottom));
end

%绘制西安1-12月的最高气温曲线图，最低气温曲线图，以及
%降水量曲线图
figure
subplot(2,1,1)
p1 = plot(Month,Highest_Temp,'* - r',Month,Lowest_Temp,'o -- b');
grid on;
ylim([-10,40]);
xlabel('月份');
ylabel('温度/\circC');
title('西安1-12月最高/最低气温曲线图');
legend('日均最高气温','日均最低气温');
for i = 1:12
    Top = Highest_Temp(i);
    Bottom = Lowest_Temp(i);
    text(i-0.06,ceil(Top)+3.5,num2str(Top));
    text(i-0.06,floor(Bottom)-3.5,num2str(Bottom));
end

subplot(2,1,2)
p2 = plot(Month,Precipitation,'. - b','MarkerSize',10);
grid on;
ylim([0,110]);
xlabel('月份');
ylabel('降水量/mm');
title('西安1-12月降水量曲线图');     
legend('平均降水量');
for i = 1:12
    text(i-0.06,ceil(Precipitation(i))+5,num2str(Precipitation(i)));
end

%绘制西安四季和每月降水量饼图
figure
subplot(1,2,1)
pie([Spring_Precip,Summer_Precip,Autumn_Precip,Winter_Precip]);
legend(SeasonSet,'Location','EastOutside');
title('西安四季降水量百分比');  

subplot(1,2,2)
pie(Precipitation);
legend(MonthSet,'Location','EastOutside');
title('西安每月降水量百分比');  

%绘制西安四季和每月降水量直方图
figure
subplot(1,2,1)
bar(Season,[Precipitation(1:3);Precipitation(4:6);Precipitation(7:9);Precipitation(10:12)],'stacked');
grid on;
xlabel('季节');
ylabel('降水量/mm');
title('西安四季降水量直方图');     
for i = 1:4
    text(i-0.06,ceil(sum(Precipitation(3*i-2:3*i)))+7,num2str(sum(Precipitation(3*i-2:3*i))));
end

subplot(1,2,2)
bar(Month,Precipitation);
grid on;
xlabel('月份');
ylabel('降水量/mm');
title('西安每月降水量直方图');   
for i = 1:12
    text(i-0.2,ceil(Precipitation(i))+4,num2str(Precipitation(i)));
end

