#!/usr/bin/env Rscript

library(ggplot2)
library(reshape2)

# merge tables

w = read.table('wtable', sep=';', header=T)
m = read.table('mtable', sep=';', header=T)
b = read.table('btable', sep=';', header=T)

# want a data frame that has one column for exec and one for queueing,
# with an id column for 'w', 'm', or 'b' for 'worst', 'median', and 'best',
# respectively.

w$type = 'w'
b$type = 'b'
m$type = 'm'

#a = merge(merge(w,m), b)
a = rbind(w,m,b)
a = a[order(a$App, a$System),]
names(a)[names(a) == 'Queuing_Delay'] = 'Queueing_Delay'

nasApps = c("BT","CG","EP","LU","SP")
otherApps = c("Sparse","SMG2000","Sweep3D","LAMMPS","UMT2k")
appList = c(nasApps, otherApps)

# shorten system names
a$System = factor(toupper(substr(a$System, 1, 1)))

systems = unique(a$System)
numApps = length(appList)

ma = melt(a[,c('App','System','type','Execution','Queueing_Delay')], id.vars=c('App','System','type'))
ma$System = paste(as.character(ma$System), ma$type, sep='')
ma = ma[,!(names(ma) %in% 'type')]

ggplot(ma, aes(x=System, y=value, fill=variable), xlab="Applications", ylab="Log seconds") +
       facet_grid(. ~ App) +
       scale_fill_manual(values = c('grey40','white')) +
       opts(panel.background = theme_rect(fill = 'white', colour = NA)) +
       opts(title = expression('Applications')) +
       opts(legend.position = 'top') + 
       opts(fontsize = 5) + 
       geom_bar(colour = 'black', width = .6)

ggsave(filename="test.eps", width=17.5, height=6)

#######################
# Median turnaround times
########################


# Data arranged in the order: Siearra,\n Hera,\n CC8
system = rep(systems, each = numApps)

AppMatrix = rep(appList, 3)
QueueingBySystem = c(172, 5572.5, 19)

Queueing = rep(QueueingBySystem, each=numApps)

Exec = c(11.188980,4.874701,7.986189,36.028132,15.272026,36.599219,51.208608,
10.143983,1,15.066262,33.979341,19.386265,16.144838,75.814457, 33.931825, 
26.396798, 88.301221, 18.160790, 1, 24.521887,111.538779,48.621877,8.374356,
108.159532,69.380275,25.861258,77.310697,11.176977,27.802517,1)

Queueing = log10(Queueing)
Exec = log10(Exec)

x <- data.frame(
  	system,
	AppMatrix,
	Queueing,
	Exec
)

mx <- melt(x, id.vars=1:2)
ggplot(mx, aes(x=system, y=value, fill=variable), xlab="Applications", ylab="Log seconds") + 
  facet_grid(~AppMatrix) +
  
  scale_fill_manual(values=c("grey40","white")) +
  opts(panel.background = theme_rect(fill = "white", colour = NA) ) + 
  opts(title = expression("Applications")) +
  opts(legend.position="top") + 
  opts(fontsize = 5) +
  geom_bar(colour="black", width=0.6)

ggsave(filename="all_median.eps", width=17.5, height=6)

quit()

#######################
# Best times
#######################

  QueueingBySystem = c(	10, 24, 19)

  Queueing = rep(QueueingBySystem, each=numApps)

  Exec = c(	11.188980,4.874701,7.986189,36.028132,15.272026,36.599219,51.208608,10.143983,1,15.066262,
		33.979341,19.386265,16.144838,75.814457, 33.931825, 26.396798, 88.301221, 18.160790, 1, 24.521887,
		111.538779,48.621877,8.374356,108.159532,69.380275,25.861258,77.310697,11.176977,27.802517,1)

Queueing = log10(Queueing)
Exec = log10(Exec)

x <- data.frame(
	Period,
	AppMatrix,
	Queueing,
	Exec
)

mx <- melt(x, id.vars=1:2)
ggplot(mx, aes(x=Period, y=value, fill=variable), xlab="Applications", ylab="Log seconds") + 
  facet_grid(~AppMatrix) +
  
  scale_fill_manual(values=c("grey40","white")) +
  opts(panel.background = theme_rect(fill = "white", colour = NA) ) + 
  opts(title = expression("Applications")) +
  opts(legend.position="top") + 
  opts(fontsize = 5) +
  geom_bar(colour="black", width=0.6)

ggsave(filename="all_best.eps", width=17.5, height=6)


#######################
# Worst times
#######################


  QueueingBySystem = c(	2550, 43543, 19)
  Queueing = rep(QueueingBySystem, each=numApps)
  Exec = c(	11.188980,4.874701,7.986189,36.028132,15.272026,36.599219,51.208608,10.143983,1,15.066262,
		33.979341,19.386265,16.144838,75.814457, 33.931825, 26.396798, 88.301221, 18.160790, 1, 24.521887,
		111.538779,48.621877,8.374356,108.159532,69.380275,25.861258,77.310697,11.176977,27.802517,1)

Queueing = log10(Queueing)
Exec = log10(Exec)

x <- data.frame(
	Period,
	AppMatrix,
	Queueing,
	Exec
)

mx <- melt(x, id.vars=1:2)
ggplot(mx, aes(x=Period, y=value, fill=variable), xlab="Applications", ylab="Log seconds") + 
  facet_grid(~AppMatrix) +
  
  scale_fill_manual(values=c("grey40","white")) +
  opts(panel.background = theme_rect(fill = "white", colour = NA) ) + 
  opts(title = expression("Applications")) +
  opts(legend.position="top") + 
  opts(fontsize = 5) +
  geom_bar(colour="black", width=0.6)

ggsave(filename="all_worst.eps", width=17.5, height=6)


