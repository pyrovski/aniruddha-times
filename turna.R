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

a = rbind(w,m,b)
a = a[order(a$App, a$System),]
names(a)[names(a) == 'Queuing_Delay'] = 'Queueing_Delay'

nasApps = c("BT","CG","EP","LU","SP")
otherApps = c("Sparse","SMG2000","Sweep3D","LAMMPS","UMT2k")
appList = c(nasApps, otherApps)

# shorten system names
a$System = factor(toupper(substr(a$System, 1, 1)))

# scale to CC8 times
sa = a
for(row in 1:length(a$App)){
	 num_sel = row
	 denom_sel = which(sa$App == sa$App[row] & sa$System == 'C' & sa$type == sa$type[row])
	 sa$Queueing_Delay[num_sel] = sa$Queueing_Delay[num_sel] / sa$Queueing_Delay[denom_sel]
	 sa$Execution[num_sel] = sa$Execution[num_sel] / sa$Execution[denom_sel]
}

# remove CC8 times
sa = sa[sa$System != 'C',]

systems = unique(sa$System)
numApps = length(appList)

ma = melt(sa[,c('App','System','type','Execution','Queueing_Delay')], id.vars=c('App','System','type'))

# log scale
ma$value = log10(ma$value)

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

quit()

