library(StructuralVariantAnnotation)
library(rtracklayer)
args <- commandArgs(trailingOnly = TRUE)
vcf = readVcf(args[1])

# Export breakpoints to BEDPE
bpgr = breakpointRanges(vcf)
# TODO: add your event filtering here. The default GRIDSS output is very verbose/sensitive.
write.table(breakpointgr2bedpe(bpgr), file=paste(args[1],".bedpe",sep=""), sep="\t", quote=FALSE, col.names=FALSE)
	
# Export single breakends to BED
begr = breakendRanges(vcf)
# TODO: add your event filtering here. The default GRIDSS output is very verbose/sensitive.
begr$score = begr$QUAL
export(begr, con=paste(args[1],".bed",sep=""))
