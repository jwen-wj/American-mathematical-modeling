%%%%%%%  寻找新位置
function [newi,newj]=findnew(i,j,pd)
weith = 70;
length = 70;
newi = i;
newj = j;

if(j>=1 && j<=35 && (i==1 || i==25)) 
    newi=i;newj=j+1;%B区域往右靠
end
if(j>35 && (i==1 || i==25) )   
    newi=i;newj=j-1;%C区域往左靠
end
if(i>=2 && i<=25 && j==1) 
   newi=i;newj=j+1;%B区域最左端往右靠
end
if(i>=2 && i<=25 && j==length)     
    newi=i;newj=j-1;%C区域最右端往左靠
end
if(i==25&&j>=34&&j<36)
    newi=i-1;newj=j;%离出口最远的人群往出口方向靠拢
end
if(i>=26 && i<=weith-1 && j==1) 
   newi=i+1;newj=j;%B区域最左端往右靠
end
if(i>=26 && i<=weith-1 && j==70) 
   newi=i+1;newj=j;%B区域最左端往右靠
end
if(j>1 && j<=35 && (i==70)) 
    newi=i;newj=j-1;%B区域往右靠
end
if(j>35&&j<length && (i==70) )   
    newi=i;newj=j+1;%C区域往左靠
end
if(i>=2&&i<=weith-1&&j>=2&&j<=length-1)%区域中间人群流动方向判断
    a=[pd(i-1,j-1) pd(i-1,j) pd(i-1,j+1) pd(i,j-1) pd(i,j+1) pd(i+1,j-1) pd(i+1,j) pd(i+1,j+1)];%八个方向威胁值判断
    [m,n]=min(a);
    switch n
        case 1
            newi=i-1;newj=j-1;%NW
        case 2
             newi=i-1;newj=j;%N  
        case 3
             newi=i-1;newj=j+1;%NE
        case 4
             newi=i;newj=j-1;%W
        case 5 
            newi=i;newj=j+1;%E
        case 6
             newi=i+1;newj=j-1;%SW      
        case 7
             newi=i+1;newj=j;%S
        otherwise
             newi=i+1;newj=j+1;%SE
    end
end
end