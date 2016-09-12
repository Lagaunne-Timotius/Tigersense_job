function [normalized_feature]=normalization(feature)
normalized_feature=(feature-min(feature(:)))/(max(feature(:)-min(feature(:)) ));
end