setwd("C:\\Users\\admin\\Documents\\ZJUC\\DNA-SV-Calling\\P_PLOT\\exec")
library(stringr)
library(circlize)
library(ComplexHeatmap)
library(grid)
sample_name <- 'svtest'
ref_name <- 'hg38'
sv_trans <- 'n1.dloc'

sv_tbl<-read.table(sv_trans, header = FALSE, stringsAsFactors = FALSE, comment.char = '#')
reg1<-sv_tbl[c(1, 2, 3)]
reg2<-sv_tbl[c(4, 5, 6)]

svg("example1.svg", width = 8.0, height = 6.0)
circos.initializeWithIdeogram(species = "hg38")
circos.genomicLink(reg1,reg2 , lwd = 0.5)
dev.off()
