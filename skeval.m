function [best_f] = skeval( dets, gts, opts)
% evaluate skeleton detection precision and recall
% Input:
%    dets: detections in cell
%    gts: groundtruths in cell
%    opts: options

if nargin < 3
   opts.nthresh = 50;
   opts.method = 'deepSK';
   opts.score_path = 'scores';
end

assert(iscell(gts));
assert(iscell(dets));
assert(length(gts) == length(dets));

cntR_color = zeros(opts.nthresh,1);
sumR_color = zeros(opts.nthresh,1);
cntP_color = zeros(opts.nthresh,1);
sumP_color = zeros(opts.nthresh,1);
scores_color = zeros(length(gts),5);

for i=1:length(gts)
   gt = gts{i};  det = dets{i};
   assert(islogical(gt));
   assert(sum(abs(size(gt) - size(det))) == 0); % check if size(gt)==size(det)
   det = nms(det);
   [cntR_color,sumR_color,cntP_color,sumP_color,scores_color, best_f] = ...
    prScores(det,i ,gt,opts.nthresh,opts.method,...
    cntR_color,sumR_color,cntP_color,sumP_color,scores_color,i,opts.score_path);
end

end

function [f] = fmeasure(r,p)
f = 2*p.*r./(p+r+((p+r)==0));
end

%% interpolate to find best F and coordinates thereof
function [bestT,bestR,bestP,bestF] = maxF(thresh,R,P)
bestT = thresh(1);
bestR = R(1);
bestP = P(1);
bestF = fmeasure(R(1),P(1));
for i = 2:numel(thresh),
  for d = linspace(0,1),
    t = thresh(i)*d + thresh(i-1)*(1-d);
    r = R(i)*d + R(i-1)*(1-d);
    p = P(i)*d + P(i-1)*(1-d);
    f = fmeasure(r,p);
    if f > bestF,
      bestT = t;
      bestR = r;
      bestP = p;
      bestF = f;
    end
  end
end
end

