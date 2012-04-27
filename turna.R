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

w$type = 'Worst'
b$type = 'Best'
m$type = 'Median'

a = rbind(w,m,b)
a = a[order(a$App, a$System),]
names(a)[names(a) == 'Queuing_Delay'] = 'Queueing_Delay'

a = a[which(!is.na(a$Execution)),]

a$App = factor(toupper(substr(a$App, 1, 3)))

# shorten system names
#a$System = factor(toupper(substr(a$System, 1, 1)))
a$Total = a$Execution + a$Queueing_Delay

# scale to CC8 times
sa = a
for(row in 1:length(a$App)){
	 denom_sel = which(sa$App == sa$App[row] & sa$System == 'cc2.8xlarge' & sa$type == sa$type[row])
	 sa$Queueing_Delay[row] = sa$Queueing_Delay[row] / sa$Total[denom_sel]
	 sa$Execution[row] = sa$Execution[row] / sa$Total[denom_sel]
	 sa$Ratio[row] = sa$Total[row] / sa$Total[denom_sel]
}

# remove CC8 times
sa = sa[sa$System != 'cc2.8xlarge',]

systems = unique(sa$System)

for(system in systems){
    msa = melt(sa[sa$System == system,c('App','type','Queueing_Delay','Execution')], id.vars=c('App','type'))

    names(msa)[names(msa) == 'variable'] = 'Component'

    # log scale
    #msa$value = log10(msa$value)

    #msa$System = paste(as.character(msa$System), msa$type, sep='-')
    #msa = msa[,!(names(msa) %in% 'type')]

    ggplot(msa, aes(x=App, y=value, fill=Component)) +
       ylab("Seconds") + 
       xlab("App") + 
       facet_grid(type ~ ., scales="free") +
       scale_fill_manual(values = c('grey40','white')) +
#       opts(panel.background = theme_rect(fill = 'white', colour = NA)) +
       opts(title = paste('Applications on', system)) +
       opts(legend.position = 'top') + 
       opts(fontsize = 5) + 
       geom_bar(colour = 'black', width = .6)

    ggsave(filename=paste(system, "eps", sep='.'), width=4, height=6)
}

