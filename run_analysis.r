
library('dplyr')

setwd("C://Users//Jacky//Desktop//UCI HAR Dataset")




#--------------------------- Test below


body_acc_x_test=read.table("./test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test=read.table("./test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test=read.table("./test/Inertial Signals/body_acc_z_test.txt")
body_gyro_x_test=read.table("./test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test=read.table("./test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test=read.table("./test/Inertial Signals/body_gyro_z_test.txt")
total_acc_x_test=read.table("./test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test=read.table("./test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test=read.table("./test/Inertial Signals/total_acc_z_test.txt")

test=data.frame(rowMeans(body_acc_x_test[,1:128]))
test[,2]=apply(body_acc_x_test,1, sd)
test[,3]=rowMeans(body_acc_y_test[,1:128])
test[,4]=apply(body_acc_y_test,1, sd)
test[,5]=rowMeans(body_acc_z_test[,1:128])
test[,6]=apply(body_acc_z_test,1, sd)
test[,7]=rowMeans(body_gyro_x_test[,1:128])
test[,8]=apply(body_gyro_x_test,1, sd)
test[,9]=rowMeans(body_gyro_y_test[,1:128])
test[,10]=apply(body_gyro_y_test,1, sd)
test[,11]=rowMeans(body_gyro_z_test[,1:128])
test[,12]=apply(body_gyro_z_test,1, sd)
test[,13]=rowMeans(total_acc_x_test[,1:128])
test[,14]=apply(total_acc_x_test,1, sd)
test[,15]=rowMeans(total_acc_y_test[,1:128])
test[,16]=apply(total_acc_y_test,1, sd)
test[,17]=rowMeans(total_acc_z_test[,1:128])
test[,18]=apply(total_acc_z_test,1, sd)
names(test)=c("body_acc_x_mean","body_acc_x_sd",
              "body_acc_y_mean","body_acc_y_sd",
              "body_acc_z_mean","body_acc_z_sd",
              "body_gyro_x_mean","body_gyro_x_sd",
              "body_gyro_y_mean","body_gyro_y_sd",
              "body_gyro_z_mean","body_gyro_z_sd",
              "total_acc_x_mean","total_acc_x_sd",
              "total_acc_y_mean","total_acc_y_sd",
              "total_acc_z_mean","total_acc_z_sd"
              )
write.table(test,"./test/Signal_test.txt")
read.table("./test/Signal_test.txt")



x.test=read.table("./test/x_test.txt")
y.test=read.table("./test/y_test.txt")
sub.test=read.table("./test/subject_test.txt")

Test_Mix=data.frame(y.test)
Test_Mix[,2]=rowMeans(x.test[,1:561])
Test_Mix[,3]=apply(x.test,1,sd)
Test_Mix[,4:21]=read.table("./test/Signal_test.txt")
Test_Mix=rename(Test_Mix,labels=V1,Mean=V2,S.D=V3)
Test_Mix=cbind(Test_Train=1,Test_Mix)
Test_Mix[,23]=sub.test
Test_Mix=rename(Test_Mix, Subject=V1)
Test_Mix=Test_Mix[,c(1,23,2:22)]       
write.table(Test_Mix,"Test_Mix.txt")


                
#--------------------------- Train below

x.train=read.table("./train/x_train.txt")
y.train=read.table("./train/y_train.txt")
sub.train=read.table("./train/subject_train.txt")


body_acc_x_train=read.table("./train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train=read.table("./train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train=read.table("./train/Inertial Signals/body_acc_z_train.txt")
body_gyro_x_train=read.table("./train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train=read.table("./train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train=read.table("./train/Inertial Signals/body_gyro_z_train.txt")
total_acc_x_train=read.table("./train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train=read.table("./train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train=read.table("./train/Inertial Signals/total_acc_z_train.txt")

train=data.frame(rowMeans(body_acc_x_train[,1:128]))
train[,2]=apply(body_acc_x_train,1, sd)
train[,3]=rowMeans(body_acc_y_train[,1:128])
train[,4]=apply(body_acc_y_train,1, sd)
train[,5]=rowMeans(body_acc_z_train[,1:128])
train[,6]=apply(body_acc_z_train,1, sd)
train[,7]=rowMeans(body_gyro_x_train[,1:128])
train[,8]=apply(body_gyro_x_train,1, sd)
train[,9]=rowMeans(body_gyro_y_train[,1:128])
train[,10]=apply(body_gyro_y_train,1, sd)
train[,11]=rowMeans(body_gyro_z_train[,1:128])
train[,12]=apply(body_gyro_z_train,1, sd)
train[,13]=rowMeans(total_acc_x_train[,1:128])
train[,14]=apply(total_acc_x_train,1, sd)
train[,15]=rowMeans(total_acc_y_train[,1:128])
train[,16]=apply(total_acc_y_train,1, sd)
train[,17]=rowMeans(total_acc_z_train[,1:128])
train[,18]=apply(total_acc_z_train,1, sd)
names(train)=c("body_acc_x_mean","body_acc_x_sd",
               "body_acc_y_mean","body_acc_y_sd",
               "body_acc_z_mean","body_acc_z_sd",
               "body_gyro_x_mean","body_gyro_x_sd",
               "body_gyro_y_mean","body_gyro_y_sd",
               "body_gyro_z_mean","body_gyro_z_sd",
               "total_acc_x_mean","total_acc_x_sd",
               "total_acc_y_mean","total_acc_y_sd",
               "total_acc_z_mean","total_acc_z_sd"
)
write.table(train,"./train/Signal_train.txt")



Train_Mix=data.frame(y.train)
Train_Mix[,2]=rowMeans(x.train[,1:561])
Train_Mix[,3]=apply(x.train,1,sd)
Train_Mix[,4:21]=read.table("./train/Signal_train.txt")
Train_Mix=rename(Train_Mix,labels=V1,Mean=V2,S.D=V3)
Train_Mix=cbind(Test_Train=2,Train_Mix)
sub.train=read.table("./train/subject_train.txt")
Train_Mix[,23]=sub.train
Train_Mix=rename(Train_Mix, Subject=V1)
Train_Mix=Train_Mix[,c(1,23,2:22)]       
write.table(Train_Mix,"Train_Mix.txt")



Final=rbind(Train_Mix,Test_Mix)
write.table(Final,"Final.txt",row.names = F)







