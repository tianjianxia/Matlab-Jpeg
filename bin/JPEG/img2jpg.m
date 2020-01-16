function [ y ] = img2jpg( x,flag )
[xm, xn] = size(x);

order = [1 9  2  3  10 17 25 18 11 4  5  12 19 26 33  ...
        41 34 27 20 13 6  7  14 21 28 35 42 49 57 50  ...
        43 36 29 22 15 8  16 23 30 37 44 51 58 59 52  ...
        45 38 31 24 32 39 46 53 60 61 54 47 40 48 55  ...
        62 63 56 64];
    
y = im2col(x, [8 8], 'distinct');  
xb = size(y, 2);                   
y = y(order, :);                   

eob = max(y(:)) + 1;               
r = zeros(numel(y) + size(y, 2), 1);
count = 0;
for j = 1:xb                       
   i = max(find(y(:, j)));         
   if isempty(i)                   
      i = 0;
   end
   p = count + 1;
   q = p + i;
   r(p:q) = [y(1:i, j); eob];      
   count = count + i + 1;          
end

r((count + 1):end) = [];           
[r1,r2]=size(r);
y           = struct;
y.realsize = r1;
y.size      = uint16([xm xn]);
y.numblocks = uint16(xb);
y.r   = r;
y.flag = flag;

end

