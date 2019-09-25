function out=itwoDdft(x)
y=zeros(size(x));
y1=y;

Col=size(x,2);
for c=1:Col
y(:,c)=iDft(x(:,c));
end

Row=size(x,1);
for r=1:Row
y1(r,:)=iDft(y(r,:).');
end
I4=y1./(Row*Col);
out=I4;
