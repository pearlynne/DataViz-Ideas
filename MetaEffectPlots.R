#######################################################
## Objective: ggplots for meta analysis to demonstrate 
##            effect size in each study across two 
##            facets
## Last updated by Pearlynne on 9/9/2021
#######################################################

library(ggplot2)
library(wesanderson)

# Data needed in long format 
# List of study citations (y-axis) 
# For facets: corresponding broad categories, subtypes (x-axis), 
#             one factor of interest (e.g., change in levels of neurotransmitters), 
# For variables: corresponding effect sizes, 
#                another categorical factor of interest (e.g., age group)

# Create theme to remove background and change text size
mytheme <-theme_bw()+
  theme(panel.grid = element_line(colour="#d3d3d3", linetype = "longdash", size = 0.3),
        strip.background = element_blank(),
        strip.text= element_text(size=18, face="bold"), 
        axis.title=element_text(size=18),
        axis.title.x=element_text(size=18, margin= margin(t = 10, r = 0, b = 0, l = 0)),
        axis.text.y = element_text(size=13, color="black"),
        axis.text.x = element_text(size=15, color="black"),
        legend.text=element_text(size=15),
        legend.title=element_text(size=15, face="bold"))

# Second theme with changes in font size to accommodate longer terms
mytheme2 <-theme_bw()+ 
  theme(panel.grid = element_line(colour="#d3d3d3", linetype = "longdash", size = 0.3), 
        strip.background = element_blank(),
        strip.text.y = element_text(size=12, face="bold"), 
        strip.text.x = element_text(size=18, face="bold"), 
        axis.title=element_text(size=18),
        axis.title.x=element_text(size=18, margin= margin(t = 10, r = 0, b = 0, l = 0)),
        axis.text.y = element_text(size=13, color="black"),
        axis.text.x = element_text(size=14, color="black"),
        legend.text=element_text(size=15),
        legend.title=element_text(size=15, face="bold"))

# Reorder the factors if there is a preferred order
df$Direction<-factor(df$Direction, levels=c("Increase", "No differences", "Decrease"))
df$SubDisorders<-factor(df$SubDisorders, levels=c("Alzheimer's", "Others", "Parkinson's",
                                                "Anxiety","Bipolar", "Depression","Typical"))

# Plot to show Effect or Sample Size from each study in broader categories.
ggplot(df, aes(x=SubDisorders, y=Authors)) + 
  # jitter to make use of space; size of circles to represent Effect/Sample size 
  geom_jitter(aes(size=EffectSize, fill=Age), color="black", 
              pch=21, stroke=1, alpha = 0.7, height=0.25,
              show.legend = TRUE) + 
  # create facet grids based on Direction x Disorders; free scales to maximize space
  facet_grid(Direction ~ Disorders, scales = "free", space =  "free") + 
  # scale size of points (effect/sample size)
  scale_size_continuous(range = c(5, 18)) +
  # select palette for colors of age group
  scale_fill_manual(values = wes_palette("BottleRocket2", n = 5, type = "continuous")) +
  # X and Y labels
  labs(x ="Types of pathology", y="Studies", size = "Effect size") +
  # order of legends since there are two
  guides(fill=guide_legend(order= 1,
                           override.aes = list(size = 5)), #override to increase key size
         size=guide_legend(order= 2)) +
  mytheme

# Second plot to manipulate space (works for reviews with uneven distribution of articles) 
ggplot(df2, aes(x=SubDisorders, y=Authors)) + 
  # jitter to make use of space; size of circles to represent Effect/Sample size 
  geom_jitter(aes(size=Effectsize, fill=Age), color="black", pch=21, 
              stroke=1, alpha = 0.7, height=0.25, show.legend = TRUE) +
  # create facet grids based on Direction x Disorders; free scales to maximize space
  facet_grid(Direction ~ Disorders, scales = "free", space =  "free") +
  # scale size of points (effect/sample size)
  scale_size_continuous(range = c(3, 15))+
  # select palette for colors of age group
  scale_fill_manual(values = wes_palette("Rushmore1", n = 4, type = "continuous")) +
  # X and Y labels
  labs(x ="Types of pathology", y="Studies", size = "Effect size") +
  # order of legends since there are two
  guides(fill=guide_legend(order= 1,
                           override.aes = list(size = 5)), #override to increase key size
         size=guide_legend(order= 2)) +
  mytheme2 