setwd("~/Documents/Lab/oldvsbabylarch/data")

#read in full list of participants from old server (named larch)
old<-read.table("oldlarch.txt")

#read in full list of participants from new server
baby<-read.table("babylarch.txt")

#files must be strings not factors in order to bind
old$V1<-as.character(old$V1)
baby$V1<-as.character(baby$V1)

#add a line that says "baby" so we know where the new server files begin
baby<-rbind("baby",baby)

#find files that are only on one server or the other
larch<-unique(rbind(old, baby))

#list of all files is very long, so we will also make a list of unique directories

#directories have colons in their names
baby_dir<-baby[grep(":",baby$V1),]
old_dir<-old[grep(":", old$V1),]

#baby_dir<-c("baby",baby_dir)


larch_dir<-c(old_dir, baby_dir)
larch_dir_count <- table(larch_dir)

#baby_dir<-c(baby_dir, rep(NA, 3031))
#larch_dir_2<-data.frame(old_dir, baby_dir)
#larch_dir_2$old_dir<-as.character(larch_dir_2$old_dir)
#larch_dir_2$baby_dir<-as.character(larch_dir_2$baby_dir)

larch_dir_count<-data.frame(larch_dir_count)

larch_dir_count_unique<-larch_dir_count[which(larch_dir_count$Freq == 1),]

ldcu<-larch_dir_count_unique

ldcu$larch_dir<-as.character(ldcu$larch_dir)
write.csv(ldcu, "unique_larch_files.csv", row.names=F)

###step 2, complete after intern work###
setwd("~/Documents/Lab/oldvsbabylarch/data")
d<-read.csv("unique_larch_files.csv")
colnames(d)<-c("larch_dir","Freq","larch.type","full.path","full.path.2","full.path.3","full.path.4","full.path.5","full.path.6","full.path.7","full.path.8","full.path.9","full.path.10","full.path.11")

library(reshape)
dl<-melt(d, id=c("larch_dir","Freq","larch.type"))

old<-dl[which(dl$larch.type == "oldlarch"),]

dirs<-levels(factor(as.character(old$value)))

write.csv(dirs, "needed.csv",row.names=F)