%Code to train and generate out model

%%
addpath(genpath('ieeg_matlabToolBox'));
%IEEGSession works with my login if you add 'ieeg_matlabToolBox'to path
s1_ecog_train = IEEGSession('I521_Sub1_Training_ecog', 'arevell', 'are_ieeglogin.bin');
s2_ecog_train = IEEGSession('I521_Sub2_Training_ecog', 'arevell', 'are_ieeglogin.bin');
s3_ecog_train = IEEGSession('I521_Sub3_Training_ecog', 'arevell', 'are_ieeglogin.bin');

s1_dg_train = IEEGSession('I521_Sub1_Training_dg', 'arevell', 'are_ieeglogin.bin');
s2_dg_train = IEEGSession('I521_Sub2_Training_dg', 'arevell', 'are_ieeglogin.bin');
s3_dg_train = IEEGSession('I521_Sub3_Training_dg', 'arevell', 'are_ieeglogin.bin');
%%
%COnfigure data to cell array
