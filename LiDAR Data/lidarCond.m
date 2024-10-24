lidarData = {};

for i = 1:14
    curFileName = ['Set' num2str(i)];
    curSet = readlines(curFileName);
    lidarData = [lidarData; {curSet}];
end

for i = 1:14
    curData = lidarData{i};
    curPosSet = [];
    curAngSet = [];
    for j = 4:length(curData)-1
        curString = strsplit(curData(j));
        curPos = str2num(curString{1});
        curAng = str2num(curString{2});
        curPosSet = [curPosSet; curPos];
        curAngSet = [curAngSet; curAng];
    end
    lidarData{i} = [deg2rad(curPosSet) curAngSet];
end

for i = 1:14
    [x, y] = pol2cart(lidarData{i}(:, 1), lidarData{i}(:, 2));
    lidarData{i} = [x y];
end

%%
allPlot = figure(1);
hold on
grid on

allPoints = [];

plot(lidarData{1}(:, 1), lidarData{1}(:, 2), '.');


%%
allPoints = [allPoints; lidarData{1}(:, 1), lidarData{1}(:, 2)];

plot(lidarData{2}(:, 1) + 80, lidarData{2}(:, 2) - 15, '.');

%%
allPoints = [allPoints; lidarData{2}(:, 1) + 80, lidarData{2}(:, 2) - 15];

curX = lidarData{3}(:, 1) .* cos(deg2rad(15)) - lidarData{3}(:, 2) .* sin(deg2rad(15));
curY = lidarData{3}(:, 2) .* cos(deg2rad(15)) + lidarData{3}(:, 1) .* sin(deg2rad(15));
plot(curX + 145, curY, '.');

allPoints = [allPoints; curX + 145, curY];

curX = lidarData{4}(:, 1) .* cos(deg2rad(53)) - lidarData{4}(:, 2) .* sin(deg2rad(53));
curY = lidarData{4}(:, 2) .* cos(deg2rad(53)) + lidarData{4}(:, 1) .* sin(deg2rad(53));
plot(curX + 240, curY + 40 , '.');

allPoints = [allPoints; curX + 240, curY + 40];

curX = lidarData{5}(:, 1) .* cos(deg2rad(65)) - lidarData{5}(:, 2) .* sin(deg2rad(65));
curY = lidarData{5}(:, 2) .* cos(deg2rad(65)) + lidarData{5}(:, 1) .* sin(deg2rad(65));
plot(curX + 270, curY + 100 , '.');

allPoints = [allPoints; curX + 270, curY + 100];

curX = lidarData{6}(:, 1) .* cos(deg2rad(77)) - lidarData{6}(:, 2) .* sin(deg2rad(77));
curY = lidarData{6}(:, 2) .* cos(deg2rad(77)) + lidarData{6}(:, 1) .* sin(deg2rad(77));
plot(curX + 300, curY + 140 , '.');

allPoints = [allPoints; curX + 300, curY + 140];

curX = lidarData{7}(:, 1) .* cos(deg2rad(87)) - lidarData{7}(:, 2) .* sin(deg2rad(87));
curY = lidarData{7}(:, 2) .* cos(deg2rad(87)) + lidarData{7}(:, 1) .* sin(deg2rad(87));
plot(curX + 300, curY + 180 , '.');

allPoints = [allPoints; curX + 300, curY + 180];

curX = lidarData{8}(:, 1) .* cos(deg2rad(85)) - lidarData{8}(:, 2) .* sin(deg2rad(85));
curY = lidarData{8}(:, 2) .* cos(deg2rad(85)) + lidarData{8}(:, 1) .* sin(deg2rad(85));
plot(curX + 305, curY + 240 , '.');

allPoints = [allPoints; curX + 305, curY + 240];

curX = lidarData{9}(:, 1) .* cos(deg2rad(63)) - lidarData{9}(:, 2) .* sin(deg2rad(63));
curY = lidarData{9}(:, 2) .* cos(deg2rad(63)) + lidarData{9}(:, 1) .* sin(deg2rad(63));
plot(curX + 320, curY + 290 , '.');

allPoints = [allPoints; curX + 320, curY + 290];

curX = lidarData{10}(:, 1) .* cos(deg2rad(34)) - lidarData{10}(:, 2) .* sin(deg2rad(34));
curY = lidarData{10}(:, 2) .* cos(deg2rad(34)) + lidarData{10}(:, 1) .* sin(deg2rad(34));
plot(curX + 370, curY + 350, '.');

allPoints = [allPoints; curX + 370, curY + 350];

curX = lidarData{11}(:, 1) .* cos(deg2rad(7)) - lidarData{11}(:, 2) .* sin(deg2rad(7));
curY = lidarData{11}(:, 2) .* cos(deg2rad(7)) + lidarData{11}(:, 1) .* sin(deg2rad(7));
plot(curX + 440, curY + 360, '.');

allPoints = [allPoints; curX + 440, curY + 360];

curX = lidarData{12}(:, 1) .* cos(deg2rad(7)) - lidarData{12}(:, 2) .* sin(deg2rad(7));
curY = lidarData{12}(:, 2) .* cos(deg2rad(7)) + lidarData{12}(:, 1) .* sin(deg2rad(7));
plot(curX + 500, curY + 370, '.');

allPoints = [allPoints; curX + 500, curY + 370];

curX = lidarData{13}(:, 1) .* cos(deg2rad(0)) - lidarData{13}(:, 2) .* sin(deg2rad(0));
curY = lidarData{13}(:, 2) .* cos(deg2rad(0)) + lidarData{13}(:, 1) .* sin(deg2rad(0));
plot(curX + 570, curY + 370, '.');

allPoints = [allPoints; curX + 570, curY + 370];

curX = lidarData{14}(:, 1) .* cos(deg2rad(0)) - lidarData{14}(:, 2) .* sin(deg2rad(0));
curY = lidarData{14}(:, 2) .* cos(deg2rad(0)) + lidarData{14}(:, 1) .* sin(deg2rad(0));
plot(curX + 650, curY + 365, '.');

allPoints = [allPoints; curX + 650, curY + 365];

%%

poseTemp = [
    0 0 0;
    80 -15 0;
    145 0 15;
    240 40 53;
    270 100 65;
    300 140 77;
    300 180 87;
    305 240 85;
    320 390 63;
    370 350 34;
    440 360 7;
    500 370 7;
    570 370 0;
    650 356 0; ];


%%
finalFig = figure(2);
grid on
plot(allPoints(:, 1), allPoints(:, 2), '.');