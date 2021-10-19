ImageID = readtable('ImageID.csv');
DownloadHeader = 'https://data.sdss.org/sas/dr16/eboss/photoObj/frames/301/';
% https://data.sdss.org/sas/dr16/eboss/photoObj/frames/301/2505/3/frame-r-002505-3-0038.fits.bz2
% RERUN 301, RUN 2505, CAMCOL 3, FIELD 38, the r-band image
for i= 1: height(ImageID)
    Fieldname = FIRST.Field(i);Fieldname=Fieldname{1};
    URL{i} = [DownloadHeader,num2str(ImageID.run(i)),'/',num2str(ImageID.camCol(i)),'/','frame-u-',num2str(ImageID.run(i),'%0.6d'),'-',num2str(ImageID.camCol(i)),'-',num2str(ImageID.field(i),'%0.4d') ,'.fits.bz2'];
end
writecell(URL','test')
