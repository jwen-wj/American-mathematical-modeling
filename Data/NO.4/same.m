%%%%  判断是否已经选择重复
function rt=same(newi,newj,choice)
weith = 70;
height = 70;
rt=1;
for i=1:weith
    for j=1:height
        if([newi newj]==choice{i,j})   rt=0;break;
        end
    end
end