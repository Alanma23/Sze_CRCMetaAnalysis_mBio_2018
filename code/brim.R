#Output shared file that has the same rows as the metadata file. 
#Requirements:
	#  *Rows must be in the same order
	#  *Metadata must contain sample id, white, and disease

shared <- read.table("data/process/brim/combined.trim.unique.good.filter.unique.precluster.pick.pick.opti_mcc.unique_list.shared", 
	stringsAsFactors=F, header=T)

metadata <- read.csv("data/process/brim/brim.metadata.csv", 
	stringsAsFactors=F, header=T)

stopifnot(shared$Group == metadata$sample)

sample <- metadata$sample
white <- metadata$white
disease <- metadata$disease

metadata <- cbind(sample=sample, white=white, disease=disease)

write.table(shared, file="data/process/brim/brim.shared", quote=F, sep='\t', row.names=F)

write.table(metadata, file="data/process/brim/brim.metadata", quote=F, sep='\t', row.names=F)
 
