x=0
y=0
w=1280
l=1280
series=3
seriesplus=$((series + 1))

full_w=`showinf -nopix -series $series HEPAMET-12-HE.bif  | grep Width | sed -n ${seriesplus}p | cut -d" " -f3`
full_l=`showinf -nopix -series $series HEPAMET-12-HE.bif  | grep Height | sed -n ${seriesplus}p | cut -d" " -f3`


echo $full_w
echo $full_l


for ((i=0; i<full_w; i+=w)); do
    for ((j=0; j<full_l; j+=l)); do
        echo $i
        echo $j
        bfconvert  -series $series -crop "$i,$j,$w,$l" HEPAMET-12-HE.bif cropimages/HEPAMET-12-HE-series${series}-${i}-${j}.tif
#        bfconvert  -series $series -tilex 256 -tiley 128 HEPAMET-12-HE.bif cropimages/HEPAMET-12-HE-series${series}-${i}-${j}.tif
        echo ======================================================
    done
done
