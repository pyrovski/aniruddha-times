#!/usr/bin/env Rscript


octiles = function(input){
  med = c();
  med[4] = median(input)
  med[6] = median(input[input > med[4]])
  med[5] = median(input[input > med[4] & input <= med[6]])
  med[7] = median(input[input > med[6]])
  med[2] = median(input[input <= med[4]])
  med[3] = median(input[input <= med[4] & input > med[2]])
  med[1] = median(input[input <= med[2]])
  return(med);
}

#######################
# execution and allocation times
########################
w = read.table('wtable', sep=';', header=T)
w = w[order(w$App, w$System),]

# example barplot
bt = w[w$App == 'BT',]
btMatrix = t(as.matrix(bt[,c('Queuing_Delay','Execution')]))
btMatrix = log10(btMatrix)
barplot(btMatrix, names.arg = bt$System,
        main=paste('Execution + queueing delay for ', bt$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System')

########################
# allocation times
########################
a = read.table('table', header=T)


a$times = a$stop - a$start

# assume start time is the same for all nodes in a multinode request
comb = unique(a[,c('request', 'instance', 'start')])

b = list()

request = c()
instance = c()
start = c()
maxes = c()
nodes = c()


for(i in 1:length(comb[,1])){
      times = a$times[a$instance == comb[i,2] & a$request == comb[i,1] & a$start == comb[i,3]]
      request[i] = as.character(comb[i,1])
      instance[i] = as.character(comb[i,2])
      start[i] = comb[i,3]
      maxes[i] = max(times)
      nodes[i] = length(times)
}

b = data.frame(request, instance, nodes, start, max_time = maxes)
o = order(b$instance, b$nodes, b$max_time)
b = b[o,]

cat(paste('request', 'instance', 'nodes', 'start_time', 'max_time', sep='\t'), '\n')
for(i in 1:length(b[,1])){
      cat(paste(b$request[i], b$instance[i], b$nodes[i], b$start[i], b$max_time[i], sep='\t'), '\n')
}

#cat(paste('request', 'instance', 'count', 'start_time', 'min', 'median', '1st_oct', '7th_oct', sep='\t'), '\n')
#oct = octiles(times)
#cat(paste(comb[i,1], comb[i,2], length(times), comb[i,3], min(times), oct[4], oct[1], oct[7], sep='\t'), '\n')
