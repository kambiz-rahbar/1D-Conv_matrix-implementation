function y = mmconv(x,h,convType)
% (c) 2019, kambiz.rahbar@gmail.com
% convType = 'same': returns the central part of the convolution
% convType = 'full': calculate the complete version of the convolution

if length(x) < length(h)
    temp_x = x;
    x = h;
    h = temp_x;
end

len_x = length(x);
len_h = length(h);
len_y = len_x + len_h - 1;
number_of_zeros_to_add = len_y-len_x;

x = reshape(x,[1,len_x]);
h = reshape(h,[len_h,1]);

x2 = zeros(1,len_y);
x2(number_of_zeros_to_add+1:number_of_zeros_to_add+len_x) = x;

xf = flip(x2);
xx = [];
for i = 0 : len_y-1
    cf = circshift(xf,i);
    xx(i+1,:) = cf(len_y-len_h+1:end);
end

y = xx*h;
y = reshape(y,[1,len_y]);

if strcmpi(convType,'same') % else calc full type of conv.
    if mod(len_x,2)==mod(len_h,2)
        p1 = ceil((len_y-len_x)/2)+1;
    else
        p1 = ceil((len_y-len_x)/2)+1;
    end
    p2 = floor((len_y-len_x)/2);
    
    y = y(p1:end-p2);
end

%disp(y)
%disp(conv(x,h))
