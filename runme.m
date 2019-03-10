clc
clear

x1 = [1 2 3 4];
h1 = [1 2 3];

x2 = [3 1 2 3 4;
    3 5 6 7 8;
    3 1 2 3 4;
    4 1 2 3 4;
    5 1 2 3 4
    10 11 12 12 14];
h2 = [1 2 3;
    1 2 3;
    7 8 12;
    4 5 6];



disp('------------------central part of the convolution-----------------------------------------');
disp(mmconv(x1,h1,'same'));
disp(conv(x1,h1,'same'));

disp('------------------complete version of the convolution-------------------------------------');
disp(mmconv(x1,h1,'full'));
disp(conv(x1,h1,'full'));

disp('------------------central part of the convolution-----------------------------------------');
disp(mmconv2(x2,h2,'same'));
disp(conv2(x2,h2,'same'));

disp('------------------complete version of the convolution-------------------------------------');
disp(mmconv2(x2,h2,'full'));
disp(conv2(x2,h2,'full'));


