#######################################################
## Objective: ggplots for individual trajectories and 
##            multilevel model with categorical level 2
## Last updated by Pearlynne on 9/8/2021
#######################################################

library(ggplot2)
library(wesanderson)

##Build theme for abstract
theme_AbsMin <- function(){
  font <- "Arial"  
  #Use theme_minimal as base
    theme_minimal()  %+replace% 
    theme(axis.line = element_line(colour = "black"),
          panel.grid = element_blank(),
          legend.text = element_text(family = font,
                                     size = 14), 
          legend.title = element_text(family = font,
                                      size = 14),
          axis.text = element_text(family = font,
                                   size = 14),
          axis.title = element_text(family = font,
                                    size = 20))
  }

#######################################
## Multilevel plot  
## Level 2 is a categorical variable
#######################################

ggplot(df,
  # define variables and create numeric variable to allow continuous data
       aes(x = jitter(Age, 1), y = jitter(as.numeric(Volume), 1), 
           col = as.factor(Group))) +
  # individual data points
  geom_point(size = 2, alpha = .7, position = "jitter")+
  # lm plot 
  geom_smooth(method = lm, se = T, size = 1.5, linetype = 1, alpha = .3)+
  #add minimalist theme
  theme_AbsMin() +
  # change legend/axis titles and colors
  labs(x="Age in months", y="Volumes in cm3") +
  scale_color_manual(name   ="Groups",
                     labels = c("Regulated", "Dysregulated"),
                     values=wes_palette(name="Moonrise2"))

#######################################
## Individual Trajectories over time. 
## Each color represents a single ID
#######################################

ggplot(df, 
  # define variables and create factor variable for each person
       aes(x = (Age), y = (Volume), col = as.factor(SubjectID))) + 
  # individual data
  geom_point(size = 2.5) + 
  # individual trajectories for each subjects
  geom_line() + 
  # insert minimalist theme
  theme_AbsMin() + 
  # change legend/axis titles and colors
  theme(legend.position = "none") +         #Necessary to eliminate a large legend
  labs(x="Age in months", y="Volumes in cm3") +
  # using wes anderson palette; change value to number of subjects
  scale_color_manual(values=wes_palette(name="Darjeeling1", 231, type = "continuous"))

