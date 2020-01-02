% -------------------------------------------------------------------------
% This function is adaptation from nctoolbox by https://github.com/nctoolbox/nctoolbox
% to call function which created by me.
% A.S. Munir - 2020
% -------------------------------------------------------------------------

home = fileparts(which(mfilename));
addpath(fullfile(home),'interpolation_spatial');
addpath(fullfile(home),'linier_equation');
%addpath(fullfile(home, 'cdm'));

warning on
disp('path already added')
