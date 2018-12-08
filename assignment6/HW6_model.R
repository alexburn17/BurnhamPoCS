






library(igraph)
library(raster)



# params
p <- .2
N <- 100
L <- 20



# random data (1=tree or 0=sheep)
dat <- sample(0:1, L*L, replace=T, prob = c((1-p), p))
mat <- matrix(nrow = L, ncol = L, data = dat)


Rmat <- raster(mat)
Clumps <- as.matrix(clump(Rmat, directions=4))

length(Clumps[!is.na(Clumps)])
max(table(Clumps))


#turn the clumps into a list
tot <- max(Clumps, na.rm=TRUE)
res <- vector("list",tot)
for (i in 1:max(Clumps, na.rm=TRUE)){
  res[i] <- list(which(Clumps == i, arr.ind = TRUE))
}



image(mat, asp=1, xaxt='n', yaxt='n', col = c("black", "grey"), ann=FALSE, bty='n')
legend(x=-.35, y=1, legend=c("Tree", "Sheep"), col = c("black", "grey"), pch=15, cex=1)




# BEGIN FUNCTION ########################################################
forest <- function(N=N, p=p, L=L, frac=frac){
  for(j in 1:N){
    for(i in 1:length(p)){


    }
  }
  return(frac)
}
# END FUNCTION ###########################################################


# Start Program Body #####################################################

#### L=20
# prealocate matrix space
#frac <- matrix(ncol = N, nrow = length(p))
# run function
#v20 <- forest(N=N, p=p, L=20, frac=frac)
# creat vecotr of means
#v20vec <- rowMeans(v20, na.rm=T)


#### L=50
# prealocate matrix space
#frac1 <- matrix(ncol = N, nrow = length(p))
# run function
#v50 <- forest(N=N, p=p, L=50, frac=frac1)
# creat vecotr of means
#v50vec <- rowMeans(v50, na.rm=T)


#### L=100
# prealocate matrix space
#frac2 <- matrix(ncol = N, nrow = length(p))
# run function
#v100 <- forest(N=N, p=p, L=100, frac=frac2)
# creat vecotr of means
#v100vec <- rowMeans(v100, na.rm=T)


#### L=200
# prealocate matrix space
#frac3 <- matrix(ncol = N, nrow = length(p))
# run function
#v200 <- forest(N=N, p=p, L=200, frac=frac3)
# creat vecotr of means
#v200vec <- rowMeans(v200, na.rm=T)


#problem3DF <- data.frame(p, v20vec, v50vec, v100vec, v200vec)
#write.csv(problem3DF, "problem3DF.csv")


setwd("~/Documents/GitHub/BurnhamPoCS/")
problem3DF <- read.csv("problem3DF.csv", header=TRUE, stringsAsFactors=FALSE)



colors <- c("green", "red", "blue", "black")

matplot(y=problem3DF[,2:5], x=p, type = "l", xlab = "p",
        ylab = "S_avg", lwd=3, 
        col=colors, ylim = c(0, .2), 
        lty=1, cex.lab = 1.3, 
        main="S_avg as a function of p for varying L")

grid()

legend(0.01, 0.2, 
       legend=c("L=20", "L=50", "L=100" ,"L=200"), 
       col=colors, lty=1, cex=.8)
abline(h=0.130231)
abline(v=0.717172)
text("p_c = 0.717172", x=0.87, y=.19)


