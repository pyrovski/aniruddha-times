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

a = read.table('table', header=T)

a$times = a$stop - a$start

comb = unique(a[,c('request', 'instance')])

cat(paste('request', 'instance', 'min', 'median', '1st_oct', '7th_oct', sep='\t'), '\n')

for(i in 1:length(comb[,1])){
      times = a$times[a$instance == comb[i,2] & a$request == comb[i,1]]
      oct = octiles(times)
      cat(paste(comb[i,1], comb[i,2], min(times), oct[4], oct[1], oct[7], sep='\t'), '\n')
}