clear;clc
%定义 button
plotbutton=uicontrol('style','pushbutton',...
    'string','Run',...
    'fontsize',12,...
    'position',[100,400,50,20],...
    'callback','run=1;');
erasebutton=uicontrol('style','pushbutton',...
    'string','Stop',...
    'fontsize',12,...
    'position',[300,400,50,20],...
    'callback','freeze=1;');
number=uicontrol('style','text',...
    'string','1',...
    'fontsize',12,...
    'position',[20,400,50,20]);
z=zeros(70,70);
xx = [1,1,1,80,80,80,80,80,80,80,80,80];
yy = [65,66,67,35,36,37,85,86,87,125,126,127];
cells=z;%元胞矩阵
weith=70;length=70;
x0=1;y0=35;%最佳出逃位置
peoplemidu=0.05;%人员密度

pd = zeros(length,weith);
pd = profit(pd,xx,yy,cells);

%%%%初始化选择矩阵
for i=1:weith;
    for j=1:length;
        choice{i,j}=[0 0];
    end
end
%%%%初始化人群
for  i=1:weith;
    for j=1:length;
        if(rand<=peoplemidu)
            cells(i,j)=1;
            pv(i,j)=1;
            choice{i,j}=[i j];
        end
    end
end
imh = imshow(cat(3,cells,cells,cells));
axis equal
axis tight
stop= 0;
run = 0;
freeze = 0;
for  i=1:weith;
    for j=1:length;
        if(j>34 && j<36 && i>1) 
            pd(i,j)=j-1;
        end
        if(j>34 && j<36 && i==1)  
            pd(i,j)=0;
        else pd(i,j)=sqrt((i-x0)^2+(j-y0)^2);
        end
    end
end
step=0;
%%%%开始逃生
while (stop==0)
    if(run==1)
%         pd = profit(pd,xx,yy,cells);
        for i=1:weith;
            for j=1:length;
                if(cells(i,j)~=0)
                    if (j>=10&&j<13&&i==1)
                        choice{i,j}=[0 0];
                        cells(i,j)=0;
                    else
                        [newi,newj]=findnew(i,j,pd);  %找到选择位置
                        if(pd(i,j)>pd(newi,newj))
                            if(same(newi,newj,choice)~=0)
                                choice{i,j}=[newi newj];
                            else
                                choice{i,j}=[i j];
                            end
                        end
                        if (pd(i,j)==pd(newi,newj))
                            if(same(newi,newj,choice)~=0)
                                if(rand>=0.5)
                                    choice{i,j}=[newi newj];
                                else  choice{i,j}=[i j];
                                end
                            else
                                choice{i,j}=[i j];
                            end
                        end
                        if (pd(i,j)<pd(newi,newj))
                            if(same(newi,newj,choice)~=0)
                                if(rand>0.2)
                                    choice{i,j}=[i j];
                                else
                                    choice{i,j}=[newi newj];
                                end
                            else
                                choice{i,j}=[i j];
                            end
                        end
                    end
                end
            end
        end
        for i=1:weith;
            for j=1:length;
                if(choice{i,j} ~= [0 0])
                    m=choice{i,j};
                    ii=m(1);jj=m(2);
                    cells(ii,jj)=1;
                    cells(i,j)=0;
                end
            end
        end
        for i=1:weith
            for j=1:length
                if(cells(i,j)~=0)
                    choice{i,j}=[1 1];
                else choice{i,j}=[0 0];
                end
            end
        end
        step = step + 1;
        ans = 0;
        for i = 1:weith
            for j = 1:length
                if(cells(i,j)~=0)
                    ans = ans + 1;
                end
            end
        end
        fprintf('%d : %d\n',step,ans)
        if(ans==0)
            run=0;
        end
        pause(0.05);
        set(imh, 'cdata', cat(3,cells,cells,cells) )
        stepnumber = 1 + str2num(get(number,'string'));
        set(number,'string',num2str(stepnumber))
    end
    
    if (freeze==1)
        run = 0;
        freeze = 0;
    end
    drawnow
end