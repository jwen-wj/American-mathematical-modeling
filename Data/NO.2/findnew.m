
function [newi,newj]=findnew(i,j,pd)
weith = 70;
length = 70;
newi = i;
newj = j;

if(j>=1 && j<=35 && (i==1 || i==weith)) 
    newi=i;newj=j+1;
end
if(j>35 && (i==1 || i==weith) )   
    newi=i;newj=j-1;
end
if(i>=2 && i<=weith-1 && j==1) 
   newi=i;newj=j+1;
end
if(i>=2 && i<=weith-1 && j==length)     
    newi=i;newj=j-1;
end
if(i==34&&j>=34&&j<36)
    newi=i-1;newj=j;
end
if(i==35&&j>=34&&j<36)
    newi=i+1;newj=j;
end

if(i>=2&&i<=weith-1&&j>=2&&j<=length-1)
    a=[pd(i-1,j-1) pd(i-1,j) pd(i-1,j+1) pd(i,j-1) pd(i,j+1) pd(i+1,j-1) pd(i+1,j) pd(i+1,j+1)];
    [m,n]=min(a);
    switch n
        case 1
            newi=i-1;newj=j-1;
        case 2
             newi=i-1;newj=j;
        case 3
             newi=i-1;newj=j+1;
        case 4
             newi=i;newj=j-1;
        case 5 
            newi=i;newj=j+1;
        case 6
             newi=i+1;newj=j-1;     
        case 7
             newi=i+1;newj=j;
        otherwise
             newi=i+1;newj=j+1;
    end
end
end