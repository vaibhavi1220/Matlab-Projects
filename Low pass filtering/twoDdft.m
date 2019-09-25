function out=twoDdft(x)
y=zeros(size(x));
y1=y;

Col=size(x,2);
for c=1:Col
y(:,c)=oneDdft(x(:,c));
end

Row=size(x,1);
for r=1:Row
y1(r,:)=oneDdft(y(r,:).');
end
out=y1;