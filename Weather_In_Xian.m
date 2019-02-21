%������������ͼ
%Author:ShenBaoyin
%Date:2018/10/23

close all
clear all

%�����ļ��¶ȷ�Χ
Spring_Temp = [4,14];
Summer_Temp = [18,30];
Autumn_Temp = [16,25];
Winter_Temp = [1, 8];
Temperature_Range = [Spring_Temp(1),Spring_Temp(2)-Spring_Temp(1);
                     Summer_Temp(1),Summer_Temp(2)-Summer_Temp(1);
                     Autumn_Temp(1),Autumn_Temp(2)-Autumn_Temp(1);
                     Winter_Temp(1),Winter_Temp(2)-Winter_Temp(1)];
SeasonSet = {'����','�ļ�','�＾','����'};
Season = categorical(SeasonSet,SeasonSet);

Highest_Temp = [6,8,14,21,26,32,32,31,25,19,12,6];
Lowest_Temp = [-4,-1,4,9,14,19,22,21,16,10,3,-3];
Temperature = [Highest_Temp;Lowest_Temp];%�¶�/���϶�
Precipitation = [7,10,26,45,50,50,101,77,95,62,26,7];%��ˮ��/mm
MonthSet = {'һ��','����','����','����','����','����','����','����','����','ʮ��','ʮһ��','ʮ����'};
Month = categorical(MonthSet,MonthSet);

Spring_Precip = sum(Precipitation(1:3));
Summer_Precip = sum(Precipitation(4:6));
Autumn_Precip = sum(Precipitation(7:9));
Winter_Precip = sum(Precipitation(10:12));


%���������ļ����¶ȷ�Χͼ
%ֱ��ͼ
figure
b = bar(Season,Temperature_Range,0.3,'stacked');
b(1,1).Visible = 'off';%���ɼ�
b(1,1).ShowBaseLine = 'off';%��׼�߲��ɼ�
b(1,2).FaceColor = [0,0,1];
ylim([-5,40]);
xlabel('����');
ylabel('�¶ȱ仯��Χ/\circC');
title('�����ļ����¶ȷ�Χͼ');
grid on
for i = 1:4
    Top = Temperature_Range(i,1)+Temperature_Range(i,2);
    Bottom = Temperature_Range(i,1);
    text(i-0.05,ceil(Top)+1,num2str(Top));
    text(i-0.05,floor(Bottom)-1,num2str(Bottom));
end

%��������1-12�µ������������ͼ�������������ͼ���Լ�
%��ˮ������ͼ
figure
subplot(2,1,1)
p1 = plot(Month,Highest_Temp,'* - r',Month,Lowest_Temp,'o -- b');
grid on;
ylim([-10,40]);
xlabel('�·�');
ylabel('�¶�/\circC');
title('����1-12�����/�����������ͼ');
legend('�վ��������','�վ��������');
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
xlabel('�·�');
ylabel('��ˮ��/mm');
title('����1-12�½�ˮ������ͼ');     
legend('ƽ����ˮ��');
for i = 1:12
    text(i-0.06,ceil(Precipitation(i))+5,num2str(Precipitation(i)));
end

%���������ļ���ÿ�½�ˮ����ͼ
figure
subplot(1,2,1)
pie([Spring_Precip,Summer_Precip,Autumn_Precip,Winter_Precip]);
legend(SeasonSet,'Location','EastOutside');
title('�����ļ���ˮ���ٷֱ�');  

subplot(1,2,2)
pie(Precipitation);
legend(MonthSet,'Location','EastOutside');
title('����ÿ�½�ˮ���ٷֱ�');  

%���������ļ���ÿ�½�ˮ��ֱ��ͼ
figure
subplot(1,2,1)
bar(Season,[Precipitation(1:3);Precipitation(4:6);Precipitation(7:9);Precipitation(10:12)],'stacked');
grid on;
xlabel('����');
ylabel('��ˮ��/mm');
title('�����ļ���ˮ��ֱ��ͼ');     
for i = 1:4
    text(i-0.06,ceil(sum(Precipitation(3*i-2:3*i)))+7,num2str(sum(Precipitation(3*i-2:3*i))));
end

subplot(1,2,2)
bar(Month,Precipitation);
grid on;
xlabel('�·�');
ylabel('��ˮ��/mm');
title('����ÿ�½�ˮ��ֱ��ͼ');   
for i = 1:12
    text(i-0.2,ceil(Precipitation(i))+4,num2str(Precipitation(i)));
end

