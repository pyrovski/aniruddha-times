#!/usr/bin/env Rscript

###########################
# Cost vs Turnaround times
###########################

tdata <- read.table("costtab", header=T, sep=";")

tSystem=as.vector(tdata$System)
tCost=as.matrix(tdata$Cost)
tTurnaround=as.matrix(tdata$Turnaround)
tCost=log10(tCost)
tTurnaround=log10(tTurnaround)

pdf("cost_turn.pdf")

# This works. Plot times on the graph. 
plot(tTurnaround, tCost, type="h", lend=2, col = as.vector(tdata$Color), lwd=20, xlab="Turnaround time (log seconds)", ylab="Total cost (log dollars)" )

# Label X axis
mtext(tSystem, side=1, line=2, at=tTurnaround)



#barplot(btCost, main="System", xlab="TurnaroundTime", ylab="Cost", names.org=btdata$System,
#		border="blue", beside=T, width = 0.4, xlim=max(btTurnaround)
#		, axis.lty=1)
#
#ggplot(x, aes(x = Turnaround, y = Cost, fill=Period)) + scale_x_continuous() + scale_y_continuous() + geom_bar(position=position_dodge())


#barplot(Cost, main = Period,
#	names.arg = Period, #main = Cost,
#        main=paste('Execution + queueing delay for ', appname$App[1]),
#        legend.text = c('Queueing delay', 'Execution'),
#        ylab='log seconds',
#        xlab='System')
#        ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

