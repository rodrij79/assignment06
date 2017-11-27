clear;
clc;
close all;

%% Training

Igray = imread('training.jpg');

BW = ~im2bw(Igray); 

SE = strel('disk',2);
BW2 = imdilate(BW, SE); 

labels = bwlabel(BW2);
Iprops = regionprops(labels);

Iprops( [Iprops.Area] < 1000 ) = [];
num = length( Iprops );

Ibox = floor( [Iprops.BoundingBox] );
Ibox = reshape(Ibox,[4 num]);

for k = 1:num
    col1 = Ibox(1,k);
    col2 = Ibox(1,k) + Ibox(3,k);
    row1 = Ibox(2,k);
    row2 = Ibox(2,k) + Ibox(4,k);
    subImage = BW2(row1:row2, col1:col2);
    
    subImageScaled = imresize(subImage, [24 12]);
    
    TPattern(k,:) = subImageScaled(:)';
end

TTarget = zeros(100,10);

for row = 1:10
    for col = 1:10
        TTarget( 10*(row-1) + col, row ) = 1;
    end
end

TPattern = TPattern';
TTarget = TTarget';

mynet = newff([zeros(288,1) ones(288,1)], [24 10], {'logsig' 'logsig'}, 'traingdx');
mynet.trainParam.epochs = 500;
mynet = train(mynet,TPattern,TTarget);

%% 196128

Igray = imread('196128.jpg');

BW = ~im2bw(Igray);

SE = strel('disk',2);
BW2 = imdilate(BW, SE); 

labels = bwlabel(BW2);
Iprops = regionprops(labels);

Iprops( [Iprops.Area] < 1000 ) = [];
num = length( Iprops );

Ibox = floor( [Iprops.BoundingBox] );
Ibox = reshape(Ibox,[4 num]);

for k = 1:num
    col1 = Ibox(1,k);
    col2 = Ibox(1,k) + Ibox(3,k);
    row1 = Ibox(2,k);
    row2 = Ibox(2,k) + Ibox(4,k);
    
    subImage = BW2(row1:row2, col1:col2);
    subImageScaled = imresize(subImage, [24 12]);
    UPattern(k,:) = subImageScaled(:)';
end

UPattern = UPattern';

RR = 0;
WW = 0;
for l = 1:20
    
Y = sim(mynet,UPattern);

[value,index] = max(Y);

ans = index - 1;

CA = [1 9 6 1 2 8];

wrong = 0;
right = 0;
for k = 1:6
    if CA(k) == ans(k)
        right = right + 1;
    else wrong = wrong + 1;  
    end 
end
RR = RR + right;
WW = WW + wrong;
end
%% 480000

Igray = imread('480000.jpg');

BW = ~im2bw(Igray);

SE = strel('disk',2);
BW2 = imdilate(BW, SE); 

labels = bwlabel(BW2);
Iprops = regionprops(labels);

Iprops( [Iprops.Area] < 1000 ) = [];
num = length( Iprops );

Ibox = floor( [Iprops.BoundingBox] );
Ibox = reshape(Ibox,[4 num]);

for k = 1:num
    col1 = Ibox(1,k);
    col2 = Ibox(1,k) + Ibox(3,k);
    row1 = Ibox(2,k);
    row2 = Ibox(2,k) + Ibox(4,k);
    
    subImage = BW2(row1:row2, col1:col2);
    subImageScaled = imresize(subImage, [24 12]);
    UPattern1(k,:) = subImageScaled(:)';
end

UPattern1 = UPattern1';

RR1 = 0;
WW1 = 0;
for l = 1:20
    
Y1 = sim(mynet,UPattern1);

[value1,index1] = max(Y1);

ans1 = index1 - 1;

CA1 = [4 8 0 0 0 0];

wrong1 = 0;
right1 = 0;
for k = 1:6
    if CA1(k) == ans1(k)
        right1 = right1 + 1;
    else wrong1 = wrong1 + 1;  
    end 
end
RR1 = RR1 + right1;
WW1 = WW1 + wrong1;
end

%% 480096

Igray = imread('480096.jpg');

BW = ~im2bw(Igray);

SE = strel('disk',2);
BW2 = imdilate(BW, SE); 

labels = bwlabel(BW2);
Iprops = regionprops(labels);

Iprops( [Iprops.Area] < 1000 ) = [];
num = length( Iprops );

Ibox = floor( [Iprops.BoundingBox] );
Ibox = reshape(Ibox,[4 num]);

for k = 1:num
    col1 = Ibox(1,k);
    col2 = Ibox(1,k) + Ibox(3,k);
    row1 = Ibox(2,k);
    row2 = Ibox(2,k) + Ibox(4,k);
    
    subImage = BW2(row1:row2, col1:col2);
    subImageScaled = imresize(subImage, [24 12]);
    UPattern2(k,:) = subImageScaled(:)';
end

UPattern2 = UPattern2';

RR2 = 0;
WW2 = 0;
for l = 1:20
    
Y2 = sim(mynet,UPattern2);

[value2,index2] = max(Y2);

ans2 = index2 - 1;
    
CA2 = [4 8 0 0 9 6];

wrong2 = 0;
right2 = 0;
for k = 1:6
    if CA2(k) == ans2(k)
        right2 = right2 + 1;
    else wrong2 = wrong2 + 1;  
    end 
end
RR2 = RR2 + right2;
WW2 = WW2 + wrong2;
end

%% 603032

Igray = imread('603032.jpg');

BW = ~im2bw(Igray);

SE = strel('disk',2);
BW2 = imdilate(BW, SE); 

labels = bwlabel(BW2);
Iprops = regionprops(labels);

Iprops( [Iprops.Area] < 1000 ) = [];
num = length( Iprops );

Ibox = floor( [Iprops.BoundingBox] );
Ibox = reshape(Ibox,[4 num]);

for k = 1:num
    col1 = Ibox(1,k);
    col2 = Ibox(1,k) + Ibox(3,k);
    row1 = Ibox(2,k);
    row2 = Ibox(2,k) + Ibox(4,k);
    
    subImage = BW2(row1:row2, col1:col2);
    subImageScaled = imresize(subImage, [24 12]);
    UPattern3(k,:) = subImageScaled(:)';
end

UPattern3 = UPattern3';

RR3 = 0;
WW3 = 0
for l = 1:20

Y3 = sim(mynet,UPattern3);

[value3,index3] = max(Y3);

ans3 = index3 - 1;

CA3 = [6 0 3 0 3 2];
    
wrong3 = 0;
right3 = 0;
for k = 1:6
    if CA3(k) == ans3(k)
        right3 = right3 + 1;
    else wrong3 = wrong3 + 1;  
    end 
end 
RR3 = RR3 + right3;
WW3 = WW3 + wrong3;
end

%% Percent Error

CP = RR/(6*20) * 100;
CP1 = RR1/(6*20) * 100;
CP2 = RR2/(6*20) * 100;
CP3 = RR3/(6*20) * 100;

Unknown_Images = ['196128';'480000';'480096';'603023'];
Total_Runs = ['20';'20';'20';'20'];
Correct_Digits = [RR;RR1;RR2;RR3];
Incorrect_Digits = [WW;WW1;WW2;WW3];
Correct_Percent = [CP;CP1;CP2;CP3];
T = table(Unknown_Images,Total_Runs,Correct_Digits,Incorrect_Digits,Correct_Percent)
   