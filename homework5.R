# Problem 3

# a)

# create j
N <- 1000


# sequnce of alpha
alpha <- seq(1,2,length.out=100)
fa <- matrix(nrow=N, ncol=length(alpha))

# function of a
for(a in 1:length(alpha)){
  for(j in 1:N){
  
    fa[j, a] <- ((j+1)^(-alpha[a]))

}
}

y <- colSums(fa)-1

plot(x=alpha, y=y)
abline(h=0, col = "red")
text(x=1.8, y=5, "alpha = 1.727273")

df <- data.frame(alpha, y)
df[df$y==-0.006532776,]

y=-0.006532776



setwd("~/Documents/GitHub/BurnhamPoCS/assignment3")

# Read in Data:
words <- read.table("vocab_cs_mod.txt", 
                    header=TRUE, 
                    sep = " ", 
                    stringsAsFactors = FALSE)


# Read in Data:
wordsFreq <- read.table("google_vocab_rawwordfreqs.txt", 
                        header=TRUE, 
                        sep = " ", 
                        stringsAsFactors = FALSE)



# Problem 4

# a)
k <- c(1:199)
N_k <- 3.46 * (10^8)*k^(-0.661)
plot(y=log10(N_k), log10(k), ylab="N_k", xlab = "k")

# b)

fullset <- c(N_k, wordsFreq$X95119665584)

mean(fullset, na.rm=T) # mean
(sd(fullset))^2 # varaince

# c)
# i sum(nk * k)
Denom <- sum(c(1:length(fullset))*fullset)

N_k[1]/Denom

# ii




