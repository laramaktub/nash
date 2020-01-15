import matplotlib.pyplot as plt
import matplotlib
import ntpath 
import shutil

from statistics import mean
matplotlib.use('Agg')

valores=[]

with open ('average.txt', 'r') as f1:
    for line in f1:
        media=0
        line.replace('\n', '')
        imagen=line.split(",")[0]
        x=float(line.split(",")[1])
        y=float(line.split(",")[2])
        z=float(line.split(",")[3])
        media=mean([x,y,z])

        baseimage=ntpath.basename(imagen)
        imagendir=ntpath.dirname(imagen)

        if (media >=240):
            shutil.move(imagen, imagendir+"/trash/"+baseimage)
