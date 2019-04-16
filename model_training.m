%Code to train and generate our model

%%
%IEEGSession works with my login if you add 'ieeg_matlabToolBox' to path
addpath(genpath('ieeg_matlabToolBox'));
%%
%Opening sessions
s1_train_ecog = IEEGSession('I521_Sub1_Training_ecog', 'arevell', 'IEEGSession');
s2_train_ecog = IEEGSession('I521_Sub2_Training_ecog', 'arevell', 'IEEGSession');
s3_train_ecog = IEEGSession('I521_Sub3_Training_ecog', 'arevell', 'IEEGSession');

s1_train_dg = IEEGSession('I521_Sub1_Training_dg', 'arevell', 'IEEGSession');
s2_train_dg = IEEGSession('I521_Sub2_Training_dg', 'arevell', 'IEEGSession');
s3_train_dg = IEEGSession('I521_Sub3_Training_dg', 'arevell', 'IEEGSession');
%%
%Get meta data
duration = s1_train_ecog.data.rawChannels(1).get_tsdetails.getDuration * 10^-6; %All durations the same in all channels and add subjects. 299.9990 seconds
fs = s1_train_ecog.data.sampleRate; %All sampling frequencies are the same across subjects
data_length = ceil(duration*fs + 1 ); %Checked to make sure there are exactly 300,000 data points

s1_channel_num = size(s1_train_ecog.data.channelLabels,1); %62 channels
s2_channel_num = size(s2_train_ecog.data.channelLabels,1); %48 channels
s3_channel_num = size(s3_train_ecog.data.channelLabels,1); %64 channels

%%
% Get data and then configure data to cell array
train_ecog = cell(3, 1);

%%


train_ecog_session = [s1_train_ecog, s2_train_ecog, s3_train_ecog];
counter = 1;
for chan = [s1_channel_num, s2_channel_num, s3_channel_num] 
    session = train_ecog_session(counter);
    data = zeros(chan,data_length);
    for i = 1:chan
        data(i,:) = session.data.getvalues(1:(data_length),i)';
    end
    train_ecog{counter} = data;
    counter = counter + 1
end
    







