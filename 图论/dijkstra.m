function [distance , path] = dijkstra(a,s,d);
%a是图邻接矩阵
%s是start，起点标号；d是destination,终点标号。

n = size(a,1);  %节点数
visited(1:n) = 0;  %记录更新完成的节点
distance(1:n) = inf;distance(s) = 0;  %保存起点到最重点的最短距离。
parent(1:n) = 0;

for i = 1 :n-1
    temp = distance;
    id1 = find(visited == 1);
    temp(id1)=inf;     %这样做是为了防止已更新过的距离再次被更新。
    [t , u] = min(temp);
    visited(u) = 1;
    id2 = find(visited == 0);
    for v = id2      %这种表达是正确的，在matlab中是遍历的意思
        if  a(u,v)+distance(u) <distance(v)
            distance(v) = a(u,v)+distance(u);
            parent(v) = u;
        end
    end
end

path = [];
if parent(d) ~= 0      %这里的~=就是不等于的意思
    t = d;path = [d];
    while t ~= s
        p = parent(t);
        path = [p path];
        t = p;
    end
end
distance = distance(d);
return 

        
        
