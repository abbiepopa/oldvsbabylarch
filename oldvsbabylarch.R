setwd("~/Documents/Lab/oldvsbabylarch/data")

old<-read.table("oldlarch.txt")
baby<-read.table("babylarch.txt")

old$V1<-as.character(old$V1)
baby$V1<-as.character(baby$V1)

baby<-rbind("baby",baby)

larch<-unique(rbind(old, baby))

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