function pd=profit(pd,xx,yy,cells)
%定义矩阵长、宽
% xx = ones(12);
% yy = ones(12);
%
% xx = [1,1,1,80,80,80,80,80,80,80,80,80];
% yy = [65,66,67,35,36,37,85,86,87,125,126,127];
weith=70;length=70;%定义矩阵长、宽
pd = zeros(weith,length);
kt = 0.9;
kd = 0.1;
ans = 0;
dis = zeros(12);
for i=1:length;
    for j=1:weith;
        if(i>=6&&i<=weith-5&&j>=6&&j<=length-5)
            s1 = unidrnd(9,1,8);
            ans = max(s1(:));
            for k = 1:12;
                dis(k) = sqrt((i-xx(k))*(i-xx(k))+(j-yy(k))*(j-yy(k)));
            end
            distance = min(dis(:));
            pd(i,j) = kt*distance + kd*ans;
        else
            ans = unidrnd(9);
            for k = 1:12;
                dis(k) = sqrt((i-xx(k))*(i-xx(k))+(j-yy(k))*(j-yy(k)));
            end
            distance = min(dis(:));
            pd(i,j) = kt*distance + kd*ans;
        end
    end
end
