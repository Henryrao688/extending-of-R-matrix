
%% PCDM comparison
clear
clc
close
s_p=load("s4485p_s2G3_2G5_5pts_new_all");
s_params=s_p.s24485p_2G4;
z_params=s2z(s_params,50);
real_Z=generation_of_real_zmatrix_for_any_size_pixels2(39);
Z_difference=abs(real(z_params(:,:,1))-real_Z);
% s_p=load("s2465p_s2G3_2G5_5pts_new_all");
% s_params=s_p.s2465p_2G4;
% z_params=s2z(s_params,50);


% S and Z parameters at the desired working frequency band 
z_obj = z_params(:,:,1);

% Force symmertry
for i=1:length(z_obj(:,1,1))
    for j=1:length(z_obj(1,:,1))
        if abs(real(z_obj(i,j,:)))<=0
            z_obj(j,i,:)=0;
        end
    end
end
z_tem=z_obj(:,:,1);
[V,D] = eig(real(z_tem(:,:)));
D=diag(real(D));
[D,index]=sort(D,"descend");
D=D.^(-1);
for i=1:360
    epsino(i)=sum(D(1:i))/i;
end
semilogy(1:length(epsino),epsino,'-.','LineWidth',3.5);
xlabel('Basis Number N_{eff}','FontSize',40,'FontName','times new roman');
ylabel('\epsilon','FontSize',40,'FontName','times new roman');
set(gca,'ycolor','black','LineWidth',3.5)  %设置左边Y轴的刻度
scrsz = get(0,'ScreenSize');			% 获取显示屏的像素尺寸
set(gcf,'Position',[100 100 500 500]); 
set(gca,'Position',[.16 .16 .81 .73]);
set(gca,'XTick',[0:60:360])
% set(gca,'YTick',[-100:5:0])
%   set(gca,'YLim',[-35 -0])
%     ylim([-25 0]);
grid on
set(gca,'GridLineStyle','--','GridColor',[0,0,0])
set(gca,'LineWidth',1,'FontName','times new roman','FontSize',18);
hold on

z_params=real_Z;

% S and Z parameters at the desired working frequency band 
z_obj = z_params(:,:,1);

% Force symmertry
for i=1:length(z_obj(:,1,1))
    for j=1:length(z_obj(1,:,1))
        if abs(real(z_obj(i,j,:)))<=0
            z_obj(j,i,:)=0;
        end
    end
end
z_tem=z_obj(:,:,1);
[V,D] = eig(real(z_tem(:,:)));
D=diag(real(D));
[D,index]=sort(D,"descend");
D=D.^(-1);
for i=1:360
    epsino(i)=sum(D(1:i))/i;
end
semilogy(1:length(epsino),epsino,'-.','LineWidth',3.5);
xlabel('Basis Number N_{eff}','FontSize',40,'FontName','times new roman');
ylabel('\epsilon','FontSize',40,'FontName','times new roman');
legend('CST data','MATLAB Generation','FontSize',19,'Position',[0.52 0.78 0.1 0.1], ...
    'Box','oFF','FontName','times new roman','NumColumns',3,'Orientation','horizontal');
set(gca,'ycolor','black','LineWidth',3.5)  %设置左边Y轴的刻度
scrsz = get(0,'ScreenSize');			% 获取显示屏的像素尺寸
set(gcf,'Position',[100 100 500 500]); 
set(gca,'Position',[.16 .16 .81 .73]);
set(gca,'XTick',[0:60:360])
% set(gca,'YTick',[-100:5:0])
%   set(gca,'YLim',[-35 -0])
%     ylim([-25 0]);
grid on
set(gca,'GridLineStyle','--','GridColor',[0,0,0])
set(gca,'LineWidth',1,'FontName','times new roman','FontSize',18);
hold on
print('4by4 lamda PCDM num of mode','-dpng','-r300')

%% PCDM comparison
clear
clc
close
load('matlab_generated_Z_3_5to7');
% real_Z35=generation_of_real_zmatrix_for_any_size_pixels2(35);
z_params=real_Z35;

% S and Z parameters at the desired working frequency band 
z_obj = z_params(:,:,1);

% Force symmertry
for i=1:length(z_obj(:,1,1))
    for j=1:length(z_obj(1,:,1))
        if abs(real(z_obj(i,j,:)))<=0
            z_obj(j,i,:)=0;
        end
    end
end
z_tem=z_obj(:,:,1);
[V,D] = eig(real(z_tem(:,:)));
D=diag(real(D));
[D,index]=sort(D,"descend");
D=D.^(-1);
for i=1:600
    epsino(i)=sum(D(1:i))/i;
end
[~,index]=min(abs(epsino-0.02));
index
semilogy(1:length(epsino),epsino,'-.','LineWidth',3.5);
xlabel('Basis Number N_{eff}','FontSize',40,'FontName','times new roman');
ylabel('\epsilon','FontSize',40,'FontName','times new roman');
set(gca,'ycolor','black','LineWidth',3.5)  %设置左边Y轴的刻度
scrsz = get(0,'ScreenSize');			% 获取显示屏的像素尺寸
set(gcf,'Position',[100 100 500 500]); 
set(gca,'Position',[.16 .16 .81 .73]);
set(gca,'XTick',[0:60:600])
% set(gca,'YTick',[-100:5:0])
%   set(gca,'YLim',[-35 -0])
%     ylim([-25 0]);
grid on
set(gca,'GridLineStyle','--','GridColor',[0,0,0])
set(gca,'LineWidth',1,'FontName','times new roman','FontSize',18);
hold on

% real_Z39=generation_of_real_zmatrix_for_any_size_pixels2(39);
z_params=real_Z39;

% S and Z parameters at the desired working frequency band 
z_obj = z_params(:,:,1);

% Force symmertry
for i=1:length(z_obj(:,1,1))
    for j=1:length(z_obj(1,:,1))
        if abs(real(z_obj(i,j,:)))<=0
            z_obj(j,i,:)=0;
        end
    end
end
z_tem=z_obj(:,:,1);
[V,D] = eig(real(z_tem(:,:)));
D=diag(real(D));
[D,index]=sort(D,"descend");
D=D.^(-1);
for i=1:600
    epsino(i)=sum(D(1:i))/i;
end
semilogy(1:length(epsino),epsino,'-.','LineWidth',3.5);
[~,index]=min(abs(epsino-0.02));
index
xlabel('Basis Number N_{eff}','FontSize',40,'FontName','times new roman');
ylabel('\epsilon','FontSize',40,'FontName','times new roman');
set(gca,'ycolor','black','LineWidth',3.5)  %设置左边Y轴的刻度
scrsz = get(0,'ScreenSize');			% 获取显示屏的像素尺寸
set(gcf,'Position',[100 100 500 500]); 
set(gca,'Position',[.16 .16 .81 .73]);
set(gca,'XTick',[0:60:600])
% set(gca,'YTick',[-100:5:0])
%   set(gca,'YLim',[-35 -0])
%     ylim([-25 0]);
grid on
set(gca,'GridLineStyle','--','GridColor',[0,0,0])
set(gca,'LineWidth',1,'FontName','times new roman','FontSize',18);
hold on


% real_Z45=generation_of_real_zmatrix_for_any_size_pixels2(45);
z_params=real_Z45;

% S and Z parameters at the desired working frequency band 
z_obj = z_params(:,:,1);

% Force symmertry
for i=1:length(z_obj(:,1,1))
    for j=1:length(z_obj(1,:,1))
        if abs(real(z_obj(i,j,:)))<=0
            z_obj(j,i,:)=0;
        end
    end
end
z_tem=z_obj(:,:,1);
[V,D] = eig(real(z_tem(:,:)));
D=diag(real(D));
[D,index]=sort(D,"descend");
D=D.^(-1);
for i=1:600
    epsino(i)=sum(D(1:i))/i;
end
semilogy(1:length(epsino),epsino,'-.','LineWidth',3.5);
[~,index]=min(abs(epsino-0.02));
index
xlabel('Basis Number N_{eff}','FontSize',40,'FontName','times new roman');
ylabel('\epsilon','FontSize',40,'FontName','times new roman');
set(gca,'ycolor','black','LineWidth',3.5)  %设置左边Y轴的刻度
scrsz = get(0,'ScreenSize');			% 获取显示屏的像素尺寸
set(gcf,'Position',[100 100 500 500]); 
set(gca,'Position',[.16 .16 .81 .73]);
set(gca,'XTick',[0:60:600])
% set(gca,'YTick',[-100:5:0])
%   set(gca,'YLim',[-35 -0])
%     ylim([-25 0]);
grid on
set(gca,'GridLineStyle','--','GridColor',[0,0,0])
set(gca,'LineWidth',1,'FontName','times new roman','FontSize',18);
hold on

% real_Z49=generation_of_real_zmatrix_for_any_size_pixels2(49);
z_params=real_Z49;

% S and Z parameters at the desired working frequency band 
z_obj = z_params(:,:,1);

% Force symmertry
for i=1:length(z_obj(:,1,1))
    for j=1:length(z_obj(1,:,1))
        if abs(real(z_obj(i,j,:)))<=0
            z_obj(j,i,:)=0;
        end
    end
end
z_tem=z_obj(:,:,1);
[V,D] = eig(real(z_tem(:,:)));
D=diag(real(D));
[D,index]=sort(D,"descend");
D=D.^(-1);
for i=1:600
    epsino(i)=sum(D(1:i))/i;
end
semilogy(1:length(epsino),epsino,'-.','LineWidth',3.5);
[~,index]=min(abs(epsino-0.02));
index
xlabel('Basis Number N_{eff}','FontSize',40,'FontName','times new roman');
ylabel('\epsilon','FontSize',40,'FontName','times new roman');
set(gca,'ycolor','black','LineWidth',3.5)  %设置左边Y轴的刻度
scrsz = get(0,'ScreenSize');			% 获取显示屏的像素尺寸
set(gcf,'Position',[100 100 500 500]); 
set(gca,'Position',[.16 .16 .81 .73]);
set(gca,'XTick',[0:60:600])


% real_Z55=generation_of_real_zmatrix_for_any_size_pixels2(55);
z_params=real_Z55;

% S and Z parameters at the desired working frequency band 
z_obj = z_params(:,:,1);

% Force symmertry
for i=1:length(z_obj(:,1,1))
    for j=1:length(z_obj(1,:,1))
        if abs(real(z_obj(i,j,:)))<=0
            z_obj(j,i,:)=0;
        end
    end
end
z_tem=z_obj(:,:,1);
[V,D] = eig(real(z_tem(:,:)));
D=diag(real(D));
[D,index]=sort(D,"descend");
D=D.^(-1);
for i=1:600
    epsino(i)=sum(D(1:i))/i;
end
semilogy(1:length(epsino),epsino,'-.','LineWidth',3.5);
[~,index]=min(abs(epsino-0.02));
index
xlabel('Basis Number N_{eff}','FontSize',40,'FontName','times new roman');
ylabel('\epsilon','FontSize',40,'FontName','times new roman');
set(gca,'ycolor','black','LineWidth',3.5)  %设置左边Y轴的刻度
scrsz = get(0,'ScreenSize');			% 获取显示屏的像素尺寸
set(gcf,'Position',[100 100 500 500]); 
set(gca,'Position',[.16 .16 .81 .73]);
set(gca,'XTick',[0:60:600])

% real_Z59=generation_of_real_zmatrix_for_any_size_pixels2(59);
z_params=real_Z59;

% S and Z parameters at the desired working frequency band 
z_obj = z_params(:,:,1);

% Force symmertry
for i=1:length(z_obj(:,1,1))
    for j=1:length(z_obj(1,:,1))
        if abs(real(z_obj(i,j,:)))<=0
            z_obj(j,i,:)=0;
        end
    end
end
z_tem=z_obj(:,:,1);
[V,D] = eig(real(z_tem(:,:)));
D=diag(real(D));
[D,index]=sort(D,"descend");
D=D.^(-1);
for i=1:600
    epsino(i)=sum(D(1:i))/i;
end
semilogy(1:length(epsino),epsino,'-.','LineWidth',3.5);
[~,index]=min(abs(epsino-0.02));
index
xlabel('Basis Number N_{eff}','FontSize',40,'FontName','times new roman');
ylabel('\epsilon','FontSize',40,'FontName','times new roman');
set(gca,'ycolor','black','LineWidth',3.5)  %设置左边Y轴的刻度
scrsz = get(0,'ScreenSize');			% 获取显示屏的像素尺寸
set(gcf,'Position',[100 100 500 500]); 
set(gca,'Position',[.16 .16 .81 .73]);
set(gca,'XTick',[0:60:600])

% real_Z65=generation_of_real_zmatrix_for_any_size_pixels2(65);
z_params=real_Z65;

% S and Z parameters at the desired working frequency band 
z_obj = z_params(:,:,1);

% Force symmertry
for i=1:length(z_obj(:,1,1))
    for j=1:length(z_obj(1,:,1))
        if abs(real(z_obj(i,j,:)))<=0
            z_obj(j,i,:)=0;
        end
    end
end
z_tem=z_obj(:,:,1);
[V,D] = eig(real(z_tem(:,:)));
D=diag(real(D));
[D,index]=sort(D,"descend");
D=D.^(-1);
for i=1:600
    epsino(i)=sum(D(1:i))/i;
end
semilogy(1:length(epsino),epsino,'-.','LineWidth',3.5);
[~,index]=min(abs(epsino-0.02));
index
xlabel('Basis Number N_{eff}','FontSize',40,'FontName','times new roman');
ylabel('\epsilon','FontSize',40,'FontName','times new roman');
set(gca,'ycolor','black','LineWidth',3.5)  %设置左边Y轴的刻度
scrsz = get(0,'ScreenSize');			% 获取显示屏的像素尺寸
set(gcf,'Position',[100 100 500 500]); 
set(gca,'Position',[.16 .16 .81 .73]);
set(gca,'XTick',[0:60:600])

% real_Z69=generation_of_real_zmatrix_for_any_size_pixels2(69);
z_params=real_Z69;

% S and Z parameters at the desired working frequency band 
z_obj = z_params(:,:,1);

% Force symmertry
for i=1:length(z_obj(:,1,1))
    for j=1:length(z_obj(1,:,1))
        if abs(real(z_obj(i,j,:)))<=0
            z_obj(j,i,:)=0;
        end
    end
end
z_tem=z_obj(:,:,1);
[V,D] = eig(real(z_tem(:,:)));
D=diag(real(D));
[D,index]=sort(D,"descend");
D=D.^(-1);
for i=1:600
    epsino(i)=sum(D(1:i))/i;
end
semilogy(1:length(epsino),epsino,'-.','LineWidth',3.5);
[~,index]=min(abs(epsino-0.02));
index
xlabel('Basis Number N_{eff}','FontSize',40,'FontName','times new roman');
ylabel('\epsilon','FontSize',40,'FontName','times new roman');
legend('3.48 lamda','3.87 lamda','4.45 lamda','4.83 lamda','5.42 lamda','5.80 lamda','6.38 lamda','6.77 lamda','FontSize',17,'Position',[0.52 0.78 0.1 0.1], ...
    'Box','oFF','FontName','times new roman','NumColumns',4,'Orientation','horizontal');
set(gca,'ycolor','black','LineWidth',3.5)  %设置左边Y轴的刻度
scrsz = get(0,'ScreenSize');			% 获取显示屏的像素尺寸
set(gcf,'Position',[100 100 700 500]); 
set(gca,'Position',[.16 .16 .81 .73]);
set(gca,'XTick',[0:60:600])
% set(gca,'YTick',[-100:5:0])
%   set(gca,'YLim',[-35 -0])
%     ylim([-25 0]);
grid on
set(gca,'GridLineStyle','--','GridColor',[0,0,0])
set(gca,'LineWidth',1,'FontName','times new roman','FontSize',18);
hold on
print('3_5 to 7 lamda PCDM num of mode','-dpng','-r300')