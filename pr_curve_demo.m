score_path = 'scores/horse';
linewidth = 3;

fname = fullfile(score_path, 'Distance_Regression0.103.txt');
distance_regression = dlmread(fname); % thresh, r, p, f

fname = fullfile(score_path, 'FSDS0.769.txt');
fsds = dlmread(fname);

fname = fullfile(score_path, 'HED0.732.txt');
hed = dlmread(fname); % thresh, r, p, f

fname = fullfile(score_path, 'Lee0.223.txt');
lee = dlmread(fname); % thresh, r, p, f

fname = fullfile(score_path, 'Levinshtein0.174.txt');
Levinshtein = dlmread(fname); % thresh, r, p, f

fname = fullfile(score_path, 'Lindeberg0.277.txt');
Lindeberg = dlmread(fname); % thresh, r, p, f

fname = fullfile(score_path, 'MIL0.365.txt');
MIL = dlmread(fname); % thresh, r, p, f

fname = fullfile(score_path, 'MISL0.402.txt');
MISL = dlmread(fname); % thresh, r, p, f

fname = fullfile(score_path, 'Partical_Filter0.334.txt');
ParticalFilter = dlmread(fname); % thresh, r, p, f

figure(1); clf; hold on; box on, grid on;
title('WH-SYMMETRY')
set(gca, 'Fontsize', 12);
set(gca, 'XTick', [0.25 0.5 0.75 1]);
set(gca, 'YTick', [0.25 0.5 0.75 1]);
set(gca, 'Xgrid', 'on');
set(gca, 'Ygrid', 'on');
xlabel('Recall'); ylabel('Precision');
axis square;

fsds = plot(fsds(:,2), fsds(:,3), 'y', 'LineWidth', linewidth);
hold on;

distance_regression = plot(distance_regression(:,2), distance_regression(:,3), 'm*', 'LineWidth',10);
hold on;

hed = plot(hed(:,2), hed(:,3), 'c', 'LineWidth',linewidth);
hold on;

lee = plot(lee(:,2), lee(:,3), 'r', 'LineWidth',linewidth);
hold on;

Levinshtein = plot(Levinshtein(:,2), Levinshtein(:,3), 'g*', 'LineWidth',10);
hold on;

Lindeberg = plot(Lindeberg(:,2), Lindeberg(:,3), 'b', 'LineWidth',linewidth);
hold on;

MIL = plot(MIL(:,2), MIL(:,3), 'k', 'LineWidth',linewidth);
hold on;

MISL = plot(MISL(:,2), MISL(:,3), 'g--', 'LineWidth',linewidth);
hold on;

ParticalFilter = plot(ParticalFilter(:,2), ParticalFilter(:,3), 'm--', 'LineWidth',linewidth);
hold on;

[r_gt,p_gt] = meshgrid(0:0.01:1,0:0.01:1);
f_gt = fmeasure(r_gt,p_gt);
[C,cl] = contour(0:0.01:1,0:0.01:1,f_gt,[0.3,0.4,0.5,0.6,0.73,0.8]);
clabel(C,cl)

legend([distance_regression, Levinshtein, lee, Lindeberg, ParticalFilter,MIL, MISL, hed, fsds], ... 
'Location', 'NorthEast', ...
'DistanceRegression: F=0.103', ...
'Levinshtein: F=0.174', ...
'Lee: F=0.223', ...
'Lindeberg: F=0.277', ...
'ParticalFilter: F=0.334', ...
'MIL: F=0.365', ...
'MISL: F=0.402', ...
'HED: F=0.732', ...
'FSDS: F=0.769');

%%%%%%%%%%%%%
% score_path = 'scores/sk506';
% linewidth = 3;
% fname = fullfile(score_path, 'Levinshtein0.217.txt');
% Levinshtein = dlmread(fname);
% 
% fname = fullfile(score_path, 'Partical_Filter0.226_pr.txt');
% ParticalFilter = dlmread(fname); % thresh, r, p, f
% 
% fname = fullfile(score_path, 'Lee0.252.txt');
% Lee = dlmread(fname); % thresh, r, p, f
% 
% 
% fname = fullfile(score_path, 'Lindeberg0.277.txt');
% Lindeberg = dlmread(fname);
% 
% fname = fullfile(score_path, 'MIL0.392.txt');
% MIL = dlmread(fname); % thresh, r, p, f
% 
% fname = fullfile(score_path, 'HED0.542.txt');
% HED = dlmread(fname); % thresh, r, p, f
% 
% fname = fullfile(score_path, 'FSDS0.63.txt');
% FSDS = dlmread(fname); % thresh, r, p, f
% 
% figure(2); clf; hold on; box on, grid on;
% title('SK506')
% set(gca, 'Fontsize', 12);
% set(gca, 'XTick', [0.25 0.5 0.75 1]);
% set(gca, 'YTick', [0.25 0.5 0.75 1]);
% set(gca, 'Xgrid', 'on');
% set(gca, 'Ygrid', 'on');
% xlabel('Recall'); ylabel('Precision');
% axis square;
% Levinshtein = plot(Levinshtein(:,2), Levinshtein(:,3), 'g*', 'LineWidth',10);
% hold on;
% 
% ParticalFilter = plot(ParticalFilter(:,2), ParticalFilter(:,3), 'm--', 'LineWidth',linewidth);
% hold on;
% 
% Lee = plot(Lee(:,2), Lee(:,3), 'r', 'LineWidth',linewidth);
% hold on;
% 
% Lindeberg = plot(Lindeberg(:,2), Lindeberg(:,3), 'b', 'LineWidth',linewidth);
% hold on;
% 
% MIL = plot(MIL(:,2), MIL(:,3), 'k', 'LineWidth',linewidth);
% hold on;
% 
% HED = plot(HED(:,2), HED(:,3), 'c', 'LineWidth',linewidth);
% hold on;
% 
% FSDS = plot(FSDS(:,2), FSDS(:,3), 'y', 'LineWidth', linewidth);
% hold on;
% 
% [r_gt,p_gt] = meshgrid(0:0.01:1,0:0.01:1);
% f_gt = fmeasure(r_gt,p_gt);
% [C,cl] = contour(0:0.01:1,0:0.01:1,f_gt,[0.3,0.4,0.5,0.6,0.73,0.8]);
% clabel(C,cl)
% 
% legend([Levinshtein, ParticalFilter, Lee, Lindeberg, MIL,HED, FSDS], ... 
% 'Location', 'NorthEast', ...
% 'Levinshtein: F=0.217', ...
% 'Partical Filter: F=0.226', ...
% 'Lee: F=0.252', ...
% 'Lindeberg: F=0.277', ...
% 'MIL: F=0.392', ...
% 'HED: F=0.542', ...
% 'FSDS: F=0.623');
