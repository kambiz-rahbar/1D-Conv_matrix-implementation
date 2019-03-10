function z2 = mmconv2(x,h,convType)
% (c) 2019, kambiz.rahbar@gmail.com
% convType = 'same': returns the central part of the convolution
% convType = 'full': calculate the complete version of the convolution

h_fliped = zeros(size(h));
k = 1;
for i = size(h,1):-1:1
    h_fliped(k,:) = h(i,:);
    k = k+1;
end

size_x1 = size(x,1);
size_h1 = size(h,1);
size_z1 = size_x1+size_h1-1;

size_x2 = size(x,2);
size_h2 = size(h,2);

if strcmpi(convType,'same') % else calc full type of conv.
    size_z2 = size_x2;
else
    size_z2 = size_x2+size_h2-1;
end

z_exp = zeros(size_x1,size_z2,size_h1);
for k = 1:size_h1
    for i = 1:size_x1
        z_exp(i,:,size_h1-k+1) = mmconv(x(i,:),h_fliped(k,:),convType);
    end
end

z2 = zeros(size_x1+size_h1,size_z2,size_h1);
for k = 1:size_h1
    z2(1:size_x1+k-1,:,k) = [zeros(k-1,size_z2,1); z_exp(:,:,k)];
end

z2 = sum(z2,3);
z2 = z2(1:size_z1,:);


if strcmpi(convType,'same') % else calc full type of conv.
    if mod(size_x1,2)==mod(size_h1,2)
        p1 = ceil((size_z1-size_x1)/2)+1;
    else
        p1 = ceil((size_z1-size_x1)/2)+1;
    end
    p2 = floor((size_z1-size_x1)/2);
    
    z2 = z2(p1:end-p2,:);
end


%disp(z2);
%disp(conv2(x,h));


