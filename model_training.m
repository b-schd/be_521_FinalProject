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
%Get data and then configure data to cell array
train_ecog = cell(3, 1);
train_dg = cell(3, 1);

%Put all sessions together for the For Loop
train_ecog_session = [s1_train_ecog, s2_train_ecog, s3_train_ecog];
train_dg_session = [s1_train_dg, s2_train_dg, s3_train_dg];

counter = 0;
for chan = [s1_channel_num, s2_channel_num, s3_channel_num] 
    counter = counter + 1
    session_ecog = train_ecog_session(counter);
    session_dg = train_dg_session(counter);
    
    %Get data for ecog (for each subject)
    data_ecog = zeros(chan,data_length);
    for i = 1:chan
        data_ecog(i,:) = session_ecog.data.getvalues(1:(data_length),i)';
    end
    
    data_dg = zeros(5,data_length);
    %Get data for finger angle (for each subject)
    for i = 1:5 %Only five channels in dg (one for each finger)
        data_dg(i,:) = session_dg.data.getvalues(1:(data_length),i)';
    end    
    
    
    train_ecog{counter} = data_ecog;
    train_dg{counter} = data_dg;
    
end
    







