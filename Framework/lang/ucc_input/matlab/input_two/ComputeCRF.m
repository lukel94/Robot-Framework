function [lin_fun, max_lin_fun] = ComputeCRF(stack, stack_exposure, nSamples, sampling_strategy, bNormalize, smoothing_term)
%
%       [lin_fun, max_lin_fun] = ComputeCRF(stack, stack_exposure, nSamples, sampling_strategy, bNormalize, smoothing_term)
%
%       This function computes camera response function using Debevec and
%       Malik method.
%
%        Input:
%           -stack: a stack of LDR images
%           -stack_exposure: an array containg the exposure time of each
%           image. Time is expressed in second (s)
%           -nSamples: number of samples for computing the CRF
%           -sampling_strategy: how to select samples:
%               -'Grossberg': picking samples according to Grossberg and
%               Nayar algorithm (CDF based)
%               -'RandomSpatial': picking random samples in the image
%               -'RegularSpatial': picking regular samples in the image
%           -bNormalize: if 1 it enables function normalization
%           -smoothing_term: a smoothing term for solving the linear
%           system
%
%        Output:
%           -lin_fun: the inverse CRF
%           -max_lin_fun: maximum value of the inverse CRF
%
%     Copyright (C) 2014-15  Francesco Banterle
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
%
%
%

if(~exist('nSamples', 'var'))
    nSamples = 256;
end

if(nSamples < 1)
    nSamples = 256;
end

if(~exist('sampling_strategy', 'var'))
    sampling_strategy = 'Grossberg';
end

if(isempty(sampling_strategy))
    sampling_strategy = 'Grossberg';
end

if(~exist('bNormalize', 'var'))
    bNormalize = 1;
end

if(isempty(stack))
    error('ComputeCRF: a stack cannot be empty!');
end

if(isempty(stack_exposure))
    error('ComputeCRF: a stack_exposure cannot be empty!');
end

if(~exist('smoothing_term', 'var'))
    smoothing_term = 20;
end

if(size(stack, 4) ~= length(stack_exposure))
    error('stack and stack_exposure have different number of exposures');
end

stack = normalizeFromAnything(stack);

col = size(stack, 3);

%Weight function
W = WeightFunction(0:(1 / 255):1, 'Deb97');

%stack sub-sampling
switch sampling_strategy
    case 'Grossberg'
        stack_hist = ComputeLDRStackHistogram(stack);
        stack_samples = GrossbergSampling(stack_hist, nSamples);
        
    case 'RandomSpatial'
        stack_samples = RandomSpatialSampling(stack, nSamples);

    case 'RegularSpatial'
        stack_samples = RegularSpatialSampling(stack, nSamples);
        
    otherwise
        stack_hist = ComputeLDRStackHistogram(stack);
        stack_samples = GrossbergSampling(stack_hist, nSamples);
end

%recovering the CRF
lin_fun = zeros(256, col);
log_stack_exposure = log(stack_exposure);

max_lin_fun = zeros(col, 1);

for i=1:col
    g = gsolve(stack_samples(:,:,i), log_stack_exposure, smoothing_term, W);
    g = exp(g);
    
    lin_fun(:,i) = g;
    max_lin_fun(i) = max(g);
    
    if(bNormalize && (max_lin_fun(i) > 0.0))
        lin_fun(:,i) = lin_fun(:,i) / max_lin_fun(i);
    end
end

end