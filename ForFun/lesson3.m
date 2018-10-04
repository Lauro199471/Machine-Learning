clf;
clear;
for clc = 0:30
    disp(" ");
end

% ======== Transpose Function =========
function B = MyTranspose(A)
[r, c, d] = size(A);
B = zeros(c,r);
for row = 1:r
    for col = 1:c
        B(col,row) = A(row,col);
    end
end
endfunction

%========== Main ===========
oriImage = imread('ClownFish.png');
imshow(oriImage);

[row,col,depth] = size(oriImage);

% Get the Red Channel , Blue Channel, Green Channel
R = oriImage(:,:,1); 
G = oriImage(:,:,2); 
B = oriImage(:,:,3); 

figure,imshow(R);
figure,imshow(G);
figure,imshow(B);

% Combine RGB to recreate Original
RGB = cat(3,R,G,B);
figure,imshow(RGB);

% Transpose Image
% 1) Rotates the matrix by 90 degrees
% 2) Change Rows to Columns and Columns to Rows( basically mirrors )
     
transR = transpose(R);
transG = transpose(G);
transB = MyTranspose(B);

transRGB = cat(3,transR,transG,transB);
figure,imshow(transRGB);







