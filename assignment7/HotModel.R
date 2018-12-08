library(igraph)
library(raster)
library(Matrix)
library(spdep)
library(qdapTools)
library(nnet)

# params
p <- 0
D <- 1
L <- 32
l <- L/10
Time <- 1000

# create spark matrix
spark <- matrix(nrow=L,ncol=L)
for(i in 1:L){
  for(j in 1:L){
    
    spark[i,j] <- exp(1)^(-i/l) * exp(1)^(-j/l)
}
}

# create empty matrix
dat <- sample(0:1, L*L, replace=T, prob = c((1-p), p))
mat <- matrix(nrow = L, ncol = L, data = dat)

Yvec <- c()
pvec <- c()

for(t in 1:Time){
    
    I <- floor(runif(D, 1,L+1))
    J <- floor(runif(D, 1,L+1))
    Y <- vector(length=D)
    #Y <- c()
    
    for(d in 1:D){
          
          
      if(mat[I[d], J[d]]==0){
          mat[I[d], J[d]] <- 1
      
          # convert to raster
          Rmat <- raster(mat)
          Clumps <- as.matrix(clump(Rmat, directions=4))
          
          # get componant size
          x <- lookup(as.vector(Clumps), as.numeric(names(table(Clumps))), 
                      key.reassign = as.vector(table(Clumps)), missing = NA)
          
          # create matrix
          comp <- matrix(x, nrow=L, ncol=L)
          p <- nnzero(mat, na.counted = NA)/L^2
          
          Y[d] <- p - (sum(spark*comp, na.rm=T)/L^2)
          
          mat[I[d], J[d]] <- 0
      }
    }
    
    IN <- which.max(Y)
    Yvec[t] <- max(Y)
    pvec[t] <- nnzero(mat, na.counted = NA)/L^2
    mat[I[IN], J[IN]] <- 1

}





mat1 <- apply(mat, 2, rev)


# create each image to visulaize as a matrix 
image(t(mat1), col=c("black", "white"), xaxt='n', yaxt='n')

df <- data.frame(pvec, Yvec)
df <- df[(df$Yvec!=0),]

#df$Yvec <- (df$Yvec-min(df$Yvec))/(max(df$Yvec)-min(df$Yvec))

plot(y=df$Yvec, x=df$pvec, ylab = "Yield", xlab = "Density", ylim=c(0,1), xlim=c(0,1), type = "l", lwd=3)

par(mfrow=c(3,1))

# D=1
hist(D1hist, main="distribution of forest fire size at peak Y (D=1)", xlab="Fire Size", col="green")


# D=2
hist(D2hist, breaks = c(0:500), main="distribution of forest fire size at peak Y (D=2)", xlab="Fire Size", col="blue")


# D=10
hist(D10hist, breaks = c(0:400), main="distribution of forest fire size at peak Y (D=10)", xlab="Fire Size", col="red")

par(mfrow=c(1,1))


df1
df2
df10

D_Value <- c(rep(1, length(df1$pvec)), rep(2, length(df2$pvec)), rep(10, length(df10$pvec)))

data <- rbind(df1, df2, df10)

data <- data.frame(data, D_Value)

data <- data[data$Yvec>=0,]

data$D_Value <- as.factor(data$D_Value)



library(ggplot2)

ggplot(data=data,
       aes(x=pvec, y=Yvec, colour=D_Value)) + geom_line(size=2) + coord_cartesian(ylim = c(0,1), xlim = c(0,1)) + theme_minimal() + scale_colour_manual(values = c("blue", "green", "red")) + theme(legend.position = c(0.2, 0.8), text = element_text(size=17)) + ggtitle("Plot of Yield by Density for 3 Ds") + xlab("Density") + ylab("Yield")






# BEGIN FUNCTION ########################################################
forest <- function(N=N, p=p, L=L, frac=frac){
  for(j in 1:N){
    for(i in 1:length(p)){
      
      # random data (1=tree or 0=sheep)
      dat <- sample(0:1, L*L, replace=T, prob = c((1-p[i]), p[i]))
      mat <- matrix(nrow = L, ncol = L, data = dat)
      
      # calculate fraction 
      #Rmat <- raster(mat)
      #Clumps <- as.matrix(clump(Rmat, directions=4))
      #frac[i,j] <- max(table(Clumps))/L^2
    }
  }
  return(mat)
}
# END FUNCTION ###########################################################


# Start Program Body #####################################################

#### L=20
# prealocate matrix space
frac <- matrix(ncol = N, nrow = length(p))
# run function
v20 <- forest(N=N, p=p, L=32, frac=frac)

# create each image to visulaize as a matrix 
image(as.matrix(v20), col=c("white", "black"))










