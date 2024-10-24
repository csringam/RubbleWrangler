load('allPoints')
load('lidarData')
allScans = {};
for i = 1:14
    curScan = lidarScan(lidarData{i} ./ 200);
    allScans = [allScans {curScan}];
end
allPoses = [poseTemp(:, 1:2) ./ 200, poseTemp(:, 3)];

map = buildMap(allScans, allPoses, 25, 4);
initFig = figure(1)
hold on
show(map)
title("Occupancy Map of LiDAR Data without SLAM");
% 
% load scansAndPoses.mat
% occMap = buildMap(scans,poses,10,19.2);
% figure
% show(occMap)
% title('Occupancy Map of Garage')

%%

maxRange = 4;
resolution = 25;
slamObj = lidarSLAM(resolution, maxRange);
slamObj.LoopClosureThreshold = 360;
slamObj.LoopClosureSearchRadius = 4;

for i = 1:numel(allScans)

    addScan(slamObj,allScans{i});
    
end
slamFig = figure(2)
hold on
show(slamObj)
title("SLAM iterative scan addition");

[scansSLAM,poses] = scansAndPoses(slamObj);
occMap = buildMap(scansSLAM,poses,resolution,maxRange);
occFig = figure(3)
show(occMap)
title("Occupancy Map of LiDAR Data with SLAM");