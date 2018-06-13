function [lin_fun, max_lin_fun] = RobertsonCRF(stack, stack_exposure, max_iterations, err_threshold, bNormalize, bPolyFit)
%
%       [lin_fun, max_lin_fun] = RobertsonCRF(stack, stack_exposure, max_iterations, err_threshold, bNormalize, bPolyFit)
%
%       This function computes camera response function using Mitsunaga and
%       Nayar method.
%
%        Input:
%           -stack: a stack of LDR images
%           -stack_exposure: an array containg the exposure time of each
%           image. Time is expressed in second (s)
%           -max_iterations: max number of iterations
%           -err_threshold: threshold after which the function can stop
%           -bNormalize: if 1 it enables function normalization
%           -bPolyFit: if it is set to 1, a polynomial fit will be computed;
%           otherwise it will not (default)
%
%        Output:
%           -lin_fun: tabled function
%           -max_lin_fun: maximum value of the inverse CRF
%
%     Copyright (C) 2016  Francesco Banterle
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

if(isempty(stack))
    error('RobertsonCRF: a stack cannot be empty!');
end

if(isempty(stack_exposure))
    error('RobertsonCRF: a stack_exposure cannot be empty!');
end

if(~exist('err_threshold', 'var'))
    err_threshold = 1e-4;
end

if(~exist('bNormalize', 'var'))
    bNormalize = 1;
end

if(~exist('max_iterations', 'var'))
    max_iterations = 10;
end

if(~exist('bPolyFit', 'var'))
    bPolyFit = 0;
end

scale = 1.0;

if(isa(stack, 'uint8'))
    scale = 255.0;
end

if(isa(stack, 'uint16'))
    scale = 65535.0;
end

if(isa(stack, 'double') | isa(stack, 'single'))
    max_val = max(stack(:));
    if(max_val > 1.0) 
        scale = max_val;
    end
end

col =  size(stack, 3);
lin_fun = zeros(256, col);

for i=1:col
    lin_fun(:, i) = (0:(1.0 / 255.0):1);
end

for i=1:max_iterations
    for j=1:col
        lin_fun(:,j) = lin_fun(:,j) / lin_fun(128,j);
    end

    x_tilde = Update_X(stack, stack_exposure, lin_fun, scale);
    lin_fun = Update_lin_fun(x_tilde, stack, stack_exposure, lin_fun); 
            
    err = ComputeError(x_tilde, stack, stack_exposure, lin_fun, scale);
    if(err < err_threshold)
        break;
    end
    %disp([i, err]);
end

%poly-fit (rational)
if(bPolyFit)
    x = (0:255)/255;
    ft = fittype( 'rat33' );
    opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
    opts.Display = 'Off';
    opts.StartPoint = ones(7, 1);

    for i=1:col    
        [xData, yData] = prepareCurveData(x', lin_fun(:,i));
        [fit_ret, ~] = fit( xData, yData, ft, opts );    
        lin_fun(:,i) = feval(fit_ret, x');
    end
end

max_lin_fun = zeros(col, 1);
for i=1:col
    max_lin_fun(i) = max(lin_fun(:,i));
    
    if(bNormalize && (max_lin_fun(i) > 0.0))
        lin_fun(:,i) = lin_fun(:,i) / max_lin_fun(i);
    end
end

end

function imgOut = Update_X(stack, stack_exposure, lin_fun, scale)
    [r, c, col, n] = size(stack);

    %for each LDR image...
    imgOut    = zeros(r, c, col, 'single');
    totWeight = zeros(r, c, col, 'single');

    for i=1:col
        lin_fun(:,i) = lin_fun(:, i) / max(lin_fun(:, i));
    end

    for i=1:n
        tmpStack = ClampImg(single(stack(:,:,:,i)) / scale, 0.0, 1.0);

        %computing the weight function    
        weight  = WeightFunction(tmpStack, 'Gauss', 0);
        tmpStack = tabledFunction(round(tmpStack * 255), lin_fun); 

        %summing things up...
        t = stack_exposure(i);    
        if(t > 0.0)                
            imgOut = imgOut + (weight .* tmpStack) * t;
            totWeight = totWeight + weight * t * t;
        end
    end

    saturation = 1e-6;

    imgOut = imgOut ./ totWeight;
    imgOut(totWeight < saturation) = -1.0;
end

function f_out = Update_lin_fun(x_tilde, stack, stack_exposure, lin_fun)
    col = size(x_tilde, 3);

    n = length(stack_exposure);
    f_out = lin_fun;

    for i=1:col
        tmp_x_tilde = x_tilde(:,:,i);

        for j=0:255
            jp1 = j + 1;

            card_m = 0;
            for k=1:n
                tmp = stack(:,:,i,k);

                tmp_x_tilde_ind = tmp_x_tilde(tmp == j);

                ind = find(tmp_x_tilde_ind >= 0.0);            

                f_out(jp1, i) = f_out(jp1, i) + stack_exposure(k) * sum(tmp_x_tilde_ind(ind));

                card_m = card_m + length(ind);
            end

            if(card_m > 0.0)
                f_out(jp1, i) = f_out(jp1, i) / card_m;
            end    
        end
    end
end
    
function err = ComputeError(x_tilde, stack, stack_exposure, lin_fun, scale)
    [r, c, col, n] = size(stack);

    %for each LDR image...
    err = zeros(r, c, col, 'single');

    for i=1:col
        lin_fun(:,i) = lin_fun(:, i) / max(lin_fun(:, i));
    end
    
    for i=1:n
       tmpStack = ClampImg(single(stack(:,:,:,i)) / scale, 0.0, 1.0);
    
       %computing the weight function    
       weight  = WeightFunction(tmpStack, 'Gauss', 0);
       tmpStack = tabledFunction(round(tmpStack * 255), lin_fun); 
       
       x_slice = ClampImg(stack_exposure(i) * x_tilde, 0.0, 1.0);
       
       err = err + weight .* (tmpStack - x_slice).^2;       
    end
    
    err = mean(err(:)) / n;
end
