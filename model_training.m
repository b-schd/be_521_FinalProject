%Code to train and generate out model

%%
addpath(genpath('ieeg_matlabToolBox'));
%IEEGSession works with my login if you add 'ieeg_matlabToolBox' to path
s1_train_ecog = IEEGSession('I521_Sub1_Training_ecog', 'arevell', 'IEEGSession');
s2_train_ecog = IEEGSession('I521_Sub2_Training_ecog', 'arevell', 'IEEGSession');
s3_train_ecog = IEEGSession('I521_Sub3_Training_ecog', 'arevell', 'IEEGSession');

s1_train_dg = IEEGSession('I521_Sub1_Training_dg', 'arevell', 'IEEGSession');
s2_train_dg = IEEGSession('I521_Sub2_Training_dg', 'arevell', 'IEEGSession');
s3_train_dg = IEEGSession('I521_Sub3_Training_dg', 'arevell', 'IEEGSession');
%%
%Configure data to cell array

train_ecog = cell(3, 1)