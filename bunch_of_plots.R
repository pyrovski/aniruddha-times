#######################
# Median turnaround times
########################

w = read.table('mtable', sep=';', header=T)
w = w[order(w$App, w$System),]

appname = w[w$App == 'BT',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

btMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
btMatrix = log10(btMatrix)
pdf("bt_median.pdf")
barplot(btMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'CG',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

cgMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
cgMatrix = log10(cgMatrix)
pdf("cg_median.pdf")
barplot(cgMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'EP',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

epMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
epMatrix = log10(epMatrix)
pdf("ep_median.pdf")
barplot(epMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'LU',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

luMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
luMatrix = log10(luMatrix)
pdf("lu_median.pdf")
barplot(luMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'SP',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

spMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
spMatrix = log10(spMatrix)
pdf("sp_median.pdf")
barplot(spMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'SparseMatrix',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

sparseMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
sparseMatrix = log10(sparseMatrix)
pdf("sparse_median.pdf")
barplot(sparseMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'SMG2000',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

smg2000Matrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
smg2000Matrix = log10(smg2000Matrix)
pdf("smg2000_median.pdf")
barplot(smg2000Matrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.5*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'Sweep3D',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

sweep3dMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
sweep3dMatrix = log10(sweep3dMatrix)
pdf("sweep3d_median.pdf")
barplot(sweep3dMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'LAMMPS',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

lammpsMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
lammpsMatrix = log10(lammpsMatrix)
pdf("lammps_median.pdf")
barplot(lammpsMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'UMT2k',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

umt2kMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
umt2kMatrix = log10(umt2kMatrix)
pdf("umt2k_median.pdf")
barplot(umt2kMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

#######################
# Best turnaround times
########################

w = read.table('btable', sep=';', header=T)
w = w[order(w$App, w$System),]

appname = w[w$App == 'BT',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

btMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
btMatrix = log10(btMatrix)
pdf("bt_best.pdf")
barplot(btMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'CG',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

cgMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
cgMatrix = log10(cgMatrix)
pdf("cg_best.pdf")
barplot(cgMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'EP',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

epMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
epMatrix = log10(epMatrix)
pdf("ep_best.pdf")
barplot(epMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'LU',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

luMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
luMatrix = log10(luMatrix)
pdf("lu_best.pdf")
barplot(luMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'SP',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

spMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
spMatrix = log10(spMatrix)
pdf("sp_best.pdf")
barplot(spMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'SparseMatrix',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

sparseMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
sparseMatrix = log10(sparseMatrix)
pdf("sparse_best.pdf")
barplot(sparseMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'SMG2000',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

smg2000Matrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
smg2000Matrix = log10(smg2000Matrix)
pdf("smg2000_best.pdf")
barplot(smg2000Matrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.5*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'Sweep3D',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

sweep3dMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
sweep3dMatrix = log10(sweep3dMatrix)
pdf("sweep3d_best.pdf")
barplot(sweep3dMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'LAMMPS',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

lammpsMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
lammpsMatrix = log10(lammpsMatrix)
pdf("lammps_best.pdf")
barplot(lammpsMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'UMT2k',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

umt2kMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
umt2kMatrix = log10(umt2kMatrix)
pdf("umt2k_best.pdf")
barplot(umt2kMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

#######################
# Worst turnaround times
########################

w = read.table('wtable', sep=';', header=T)
w = w[order(w$App, w$System),]

appname = w[w$App == 'BT',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

btMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
btMatrix = log10(btMatrix)
pdf("bt_worst.pdf")
barplot(btMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'CG',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

cgMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
cgMatrix = log10(cgMatrix)
pdf("cg_worst.pdf")
barplot(cgMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'EP',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

epMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
epMatrix = log10(epMatrix)
pdf("ep_worst.pdf")
barplot(epMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'LU',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

luMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
luMatrix = log10(luMatrix)
pdf("lu_worst.pdf")
barplot(luMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'SP',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

spMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
spMatrix = log10(spMatrix)
pdf("sp_worst.pdf")
barplot(spMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'SparseMatrix',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

sparseMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
sparseMatrix = log10(sparseMatrix)
pdf("sparse_worst.pdf")
barplot(sparseMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'SMG2000',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

smg2000Matrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
smg2000Matrix = log10(smg2000Matrix)
pdf("smg2000_worst.pdf")
barplot(smg2000Matrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.5*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'Sweep3D',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

sweep3dMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
sweep3dMatrix = log10(sweep3dMatrix)
pdf("sweep3d_worst.pdf")
barplot(sweep3dMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'LAMMPS',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

lammpsMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
lammpsMatrix = log10(lammpsMatrix)
pdf("lammps_worst.pdf")
barplot(lammpsMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))

appname = w[w$App == 'UMT2k',]
mat1 = t(as.matrix(appname[,c('Queuing_Delay')]))
mat2 = t(as.matrix(appname[,c('Execution')]))

umt2kMatrix = t(as.matrix(appname[,c('Queuing_Delay','Execution')]))
umt2kMatrix = log10(umt2kMatrix)
pdf("umt2k_worst.pdf")
barplot(umt2kMatrix, names.arg = appname$System,
        main=paste('Execution + queueing delay for ', appname$App[1]),
        legend.text = c('Queueing delay', 'Execution'),
        ylab='log seconds',
        xlab='System',
	ylim = c(0, 1.2*(max(log10(mat1))+ max(log10(mat2)))))
