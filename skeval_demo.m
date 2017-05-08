% Demo of skeleton detection evaluation


% method, the generated txt files named after method.
opts.method = 'sk1491_reg'; 

% number of threshhold to generate precision-recall curve
opts.nthresh = 100;

% specify where to save the results txt files
opts.score_path = 'scores';

if ~exist(opts.score_path, 'dir'), mkdir(opts.score_path);end

% ground-truth directory
gtDir = fullfile('/home/server002/zk/data/sk1491/groundTruth/test/');
% detection result directory
rstDir = fullfile('/media/DATA1/zk/results_deepSK/sk1491_iter_120k/');

if ~exist(fullfile(opts.score_path, [opts.method, '_pr.txt']), 'file') || ...
   ~exist(fullfile(opts.score_path, [opts.method, '_score.txt']), 'file') || ...
   ~exist(fullfile(opts.score_path, [opts.method, '_scores.txt']), 'file')

    items = dir([gtDir, '*.mat']);
    items = {items.name};
    gts = cell(1,length(items));
    dets = cell(1,length(items));
    for i=1:length(items)
       fn = items{i};
       gt = load([gtDir, fn]);
       gt = logical(gt.symmetry);

       det = load([rstDir, fn]); det = det.sk;
       if size(det, 3) ~= 1
           det = squeeze(sum(det(2:end, :, :), 1));
       end
       gts{i} = gt;
       dets{i} = det;
    end

    best_f = skeval(dets, gts, opts);
end
pr = dlmread(fullfile(opts.score_path, [opts.method, '_pr.txt']));
figure(1);
F = pr(:, end);
[~, maxF_id] = max(F);
pr = pr(:, 2:3);
plot(pr(:,1), pr(:,2), 'r-', 'Linewidth', 3); hold on;
plot(pr(maxF_id, 1), pr(maxF_id, 2), 'g*', 'Linewidth', 6);
grid on;
xlabel('Recall');
ylabel('Precision');
title(['Precision-Recall of ', opts.method]);