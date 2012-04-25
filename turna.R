#!/usr/bin/env Rscript

library(ggplot2)

#######################
# Median turnaround times
########################


library(reshape2)

# Data arranged in the order: Siearra,\n Hera,\n CC8
appList = c("BT","CG","EP","LU","SP","Sparse","SMG2000","Sweep3D","LAMMPS","UMT2k")
systems = c("S","H", "C")
numApps = length(appList)
Period = rep(systems, each = numApps)

AppMatrix = c(rep(appList, 3))
QueueingBySystem = c(172, 5572.5, 19)

  Queueing = rep(QueueingBySystem, each=numApps)

  Exec = c(	11.188980,4.874701,7.986189,36.028132,15.272026,36.599219,51.208608,10.143983,1,15.066262,33.979341,19.386265,16.144838,75.814457, 33.931825, 26.396798, 88.301221, 18.160790, 1, 24.521887,111.538779,48.621877,8.374356,108.159532,69.380275,25.861258,77.310697,11.176977,27.802517,1)

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

ggsave(filename="all_median.eps", width=17.5, height=6)


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


