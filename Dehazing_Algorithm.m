fprintf('Select the input image folder:\n')
folder_img = uigetdir;
listing = dir(folder_img);

for i = 1:size(listing,1)
    [pathstr,name,ext] = fileparts(listing(i).name);
    if strcmpi(ext,'.png') || strcmpi(ext,'.jpg')
        Img_name= [name ext];
        A=imread([folder_img '\' Img_name]);
        AInv = imcomplement(A);
        BInv = imreducehaze(AInv,'ContrastEnhancement','none');
        B = imcomplement(BInv);
        I=im2double(B);
        I=uint8(255*I);
        Img_namen=[folder_img '\' 'Brightened_' Img_name];
        imwrite(I,Img_namen);
    end
end