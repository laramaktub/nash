import matplotlib.pyplot as plt
import matplotlib
from statistics import mean
matplotlib.use('Agg')

valores=[]

with open ('average.txt', 'r') as f1:
    for line in f1:
        line.replace('\n', '')
        x=float(line.split(",")[1])
        y=float(line.split(",")[2])
        z=float(line.split(",")[3])

        media=mean([x,y,z])
        valores.append(media)

plt.hist(valores, 175)
plt.savefig('histomean.png')
