###################################################################
# Analysis of Plant Trans II
# P. Alexander Burnham
# December 1, 2018
###################################################################

#Preliminaries:
# Clear memoxry of characters
ls()
rm(list=ls())


# set working Directory:
setwd("~/Documents/GitHub/Dissertation/PlantTransTwo")

# Read in Data:
dat <- read.csv("dat.csv", 
                header=TRUE, 
                sep = ",", 
                stringsAsFactors = FALSE)

# use binary data to set poor melt curves to 0
dat$DWVLoad <- ifelse(dat$PresentAbs==0, 0, dat$NormGenomeCopy)

# log transmform laod 
dat$logLoad <- log10(dat$DWVLoad+1)

# split DF into experiemnts
x <- split(dat, dat$Exp)
Transmission <- x$Trans
Reverse <- x$Reverse
DoseCurve <- x$Dose
Pickup <- x$Pickup


######################################################################
##################### - GRAPHICS - ###################################
######################################################################
library(ggplot2)
library(plyr)



# DoseCurve
DoseCurve$logLoad

# summary stats for plotting purposes:
dose <- ddply(DoseCurve, c("Treatment"), summarise, 
              n = length(PresentAbs),
              a = sum(PresentAbs)+1,
              b = n - a + 1,
              lower = qbeta(.025, shape1 = a, shape2 = b)*8,
              upper = qbeta(.975, shape1 = a, shape2 = b)*8,
              mean = mean(PresentAbs, na.rm = TRUE)*8)
dose$se <- NA


DoseCurve1 <- DoseCurve[!DoseCurve$logLoad==0, ]

dose1 <- ddply(DoseCurve1, c("Treatment"), summarise, 
              n = length(logLoad),
              mean = mean(logLoad, na.rm = TRUE),
              se = sd(logLoad, na.rm = TRUE) / sqrt(n))
dose1$a <- NA
dose1$b <- NA
dose1$upper <- NA
dose1$lower <- NA

dose <- rbind(dose, dose1)
dose$group <- c(rep("Prevalence", 4), rep("Load", 4))

dose$Treatment <- as.factor(dose$Treatment)
dose$Treatment <- factor(dose$Treatment, levels = c(1,3,5,10))


ggplot(dose, aes(x=Treatment, y=mean, color=group, group=group)) + 
  geom_point(stat="identity", position=position_dodge(width = 0.9), size=7, shape = 18) + geom_line(position=position_dodge(.9), linetype=5) + geom_errorbar(aes(ymin=mean-se, ymax=mean+se), 
                width=.2, position=position_dodge(.9)) + labs(x="Initial Dose log(genome copies)", y = "Measured Viral Load log(genome copies)") + geom_errorbar(aes(ymin=lower, ymax=upper), width=.2, position=position_dodge(.9)) + theme_classic(base_size = 15) + coord_cartesian(ylim = c(0, 8)) + scale_color_manual(values=c("black", "blue"), name="Metric:") + scale_y_continuous(sec.axis = sec_axis(~./8, name = "Virus Prevalence")) + theme(axis.line.y.right = element_line(color = "blue"), axis.ticks.y.right = element_line(color = "blue"), axis.text.y.right = element_text(color = "blue")) + theme(legend.position = c(0.18, 0.85), legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid')) 



# Transmission


# summary stats for plotting purposes:
dose <- ddply(Transmission, c("Treatment"), summarise, 
              n = length(PresentAbs),
              a = sum(PresentAbs)+1,
              b = n - a + 1,
              lower = qbeta(.025, shape1 = a, shape2 = b)*2.5,
              upper = qbeta(.975, shape1 = a, shape2 = b)*2.5,
              mean = mean(PresentAbs, na.rm = TRUE)*2.5)
dose$se <- NA


Transmission1 <- Transmission[!Transmission$logLoad==0, ]

dose1 <- ddply(Transmission, c("Treatment"), summarise, 
               n = length(logLoad),
               mean = mean(logLoad, na.rm = TRUE),
               se = sd(logLoad, na.rm = TRUE) / sqrt(n))
dose1$a <- NA
dose1$b <- NA
dose1$upper <- NA
dose1$lower <- NA

dose <- rbind(dose, dose1)
dose$group <- c(rep("Prevalence", 4), rep("Load", 4))

dose$mean <- ifelse(dose$mean>0, dose$mean, NA)
dose$Treatment <- c(rep(c("Control", "Random", "Hand Innoc.", "HB Innoc."), 2))

dose$Treatment <- as.factor(dose$Treatment)
dose$Treatment <- factor(dose$Treatment, levels = c("Control", "Random", "Hand Innoc.", "HB Innoc."))

dose$lower[1:2] <- NA
dose$upper[1:2] <- NA




ggplot(dose, aes(x=Treatment, y=mean, fill=group)) + 
  geom_bar(stat="identity", position=position_dodge(width = 0.9)) +
  geom_errorbar(aes(ymin=mean-se, ymax=mean+se), 
                width=.2, position=position_dodge(.9)) + labs(x="Experiment", y = "Viral Load log(genome copies)") + geom_errorbar(aes(ymin=lower, ymax=upper), width=.2, position=position_dodge(.9)) + theme_classic(base_size = 15) + coord_cartesian(ylim = c(0, 2.5)) + scale_fill_manual(values=c("grey", "blue"), name="Metric:") + scale_y_continuous(sec.axis = sec_axis(~./2.5, name = "Virus Virus Prevalence")) + theme(axis.line.y.right = element_line(color = "blue"), axis.ticks.y.right = element_line(color = "blue"), axis.text.y.right = element_text(color = "blue")) + theme(legend.position = c(0.18, 0.85), legend.background = element_rect(colour = 'black', fill = 'white', linetype='solid')) 







# Pickup

Pickup$Treatment <- ifelse(Pickup$Treatment=="C", "Control", "Treatment")

ggplot(Pickup, aes(x=Time, y=logLoad, color=Treatment)) + 
  geom_point(size=3) + theme_classic(base_size = 15) + labs(x="Foraging Time (seconds)", y = "DWV Load log(genome copies)") + coord_cartesian(xlim = c(0, 120)) + scale_color_manual(values = c("blue", "black")) + stat_smooth(method="lm", se=TRUE) + theme(legend.position = c(0.13, 0.9)) + guides(color=guide_legend(title="Group:"))





PickupT <- Pickup[!Pickup$Treatment=="C",]

mod <- lm(PickupT$logLoad~PickupT$Time)

