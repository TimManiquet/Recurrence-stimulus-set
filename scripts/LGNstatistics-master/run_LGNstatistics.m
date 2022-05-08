% This is an amended version of the original 'run_LGNstatistics.m' file

% in this copy, I'll try to make the script work on another pathway

function [CE, SC, Beta, Gamma, filenames] = run_LGNstatistics()

% give the location of images

curr_dir = pwd; % locate the current directory
img_dir = fullfile('../../bckgrndImages/inputImages'); % locating the image directory

% wrapper function that executes LGNstatistics on each image in the 
% image directory as given above

names = dir(fullfile(img_dir, '*.jpg'));
names2 = dir(fullfile(img_dir, '*.jpeg'));
names3 = dir(fullfile(img_dir,'*.bmp'));
names4 = dir(fullfile(img_dir,'*.png'));
names5 = dir(fullfile(img_dir,'*.tif'));
    
names = [names; names2; names3; names4; names5];

CE = nan(length(names),3); 
SC = nan(length(names),3);
Beta = nan(length(names),3);
Gamma = nan(length(names),3);
filenames = cell(size(names)); 

for cNames = 1:length(names)
    if names(cNames).bytes > 0
        im = imread(names(cNames).name);
        [CE(cNames,:),SC(cNames,:), Beta(cNames,:), Gamma(cNames,:)] = LGNstatistics(im);
    end
    filenames{cNames} = names(cNames).name;
    disp(cNames);
end

matname = 'LGNstatistics';

try 
	save(matname,'CE','SC', 'Beta', 'Gamma', 'filenames');
catch
    delete(matname);
	save(matname,'CE','SC', 'Beta', 'Gamma', 'filenames');
end