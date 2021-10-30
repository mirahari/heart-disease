
# ------------------------------------------------------------------------ #
#                                                                          #
#                          HEART DISEASE DATASET                           #
#                                                                          #
# ------------------------------------------------------------------------ #



# ------------------------------ SET  UP --------------------------------- #

library(tidyverse)
library(gridExtra) 
library(cowplot)
library(tree)

url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/statlog/heart/heart.dat"

heart <- read.table(url, header = FALSE, 
                    col.names = c("age", "sex", "cp", "restbp", "chol", 
                                  "fbs", "ecg", "hrate", "exang", "stdep", 
                                  "slope", "fluor", "thal", "target"))

# --- FACTORISE 

heart$sex <- as.factor(heart$sex)
heart$cp <- as.factor(heart$cp)
heart$fbs <- as.factor(heart$fbs)
heart$ecg <- as.factor(heart$ecg)
heart$exang <- as.factor(heart$exang)
heart$slope <- as.factor(heart$slope)
heart$fluor <- as.factor(heart$fluor) 
heart$thal <- as.factor(heart$thal)
heart$target <- as.factor(heart$target)

# --- LABEL 

levels(heart$sex) <- c("Female","Male")
levels(heart$cp) <- c("Typical","Atypical","Non-anginal","Asymptomatic")
levels(heart$fbs) <- c("False","True")
levels(heart$ecg) <- c("Normal","ST-T wave abnormality","Left Ventricular Hypertrophy")
levels(heart$exang) <- c("No","Yes")
levels(heart$slope) <- c("Upsloping","Flat","Downsloping")
levels(heart$thal) <- c("Normal","Fixed defect","Reversible defect")
levels(heart$target) <- c("Absent","Present")

attach(heart)

# ---------------------------------- Q1 ---------------------------------- #

# --- BAR : GENDER x TARGET

ggplot(heart, aes(x=sex, y=1, fill=target)) + 
  geom_bar(stat="identity", position="fill", width=.5) +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_brewer(palette = "Pastel2") +
  labs(x="Gender", y = "Percentage of Occurrence", 
       fill = "Heart Disease", title="Gender Gap in Heart Disease") +
  theme_minimal() +
  theme(text = element_text(size=10), 
        plot.title = element_text(hjust = 0.5, size=11, face = "bold")) 

# --- BOX : GENDER x AGE x TARGET

ggplot(heart, aes(x=target, y=age)) +
  geom_boxplot(aes(fill = factor(sex))) +
  scale_fill_brewer(palette = "Pastel1")+
  labs(x="Heart Disease", y="Age", fill = "Gender",
       title="Age Difference in Heart Disease Occurrence") +
  theme_minimal() +
  theme(text = element_text(size=10), 
        plot.title = element_text(hjust = 0.5, size=11, face = "bold"))  

# ---------------------------------- Q2 ---------------------------------- #

# --- SCATTER : HEART RATE x AGE

ggplot(heart, aes(x=age, y=hrate)) +
  geom_point() +
  geom_smooth(colour="gold", se=FALSE) +
  labs(x="Age", y = "Max Heart Rate Achieved",
       title="Relationship Between Age and Max Heart Rate") +
  theme_minimal() +
  theme(text = element_text(size=9), 
        plot.title = element_text(hjust = 0.5, size=10, face = "bold")) 

# --- SCATTER : HEART RATE x AGE x TARGET

ggplot(heart, aes(x=age, y=hrate)) +
  geom_point(aes(colour=target), alpha = 0.8) +
  geom_smooth(colour="grey50", se=FALSE) +
  labs(x="Age", y = "Max Heart Rate Achieved",
       title="Relationship Between Age and Max Heart Rate") +
  scale_colour_brewer(name="Heart Disease", palette="Set2") +
  facet_wrap(~target) +
  theme_minimal() +
  theme(strip.background=element_blank(),
        strip.text=element_blank(),
        text = element_text(size=10),
        plot.title = element_text(hjust = 0.5, size=11, face = "bold"))

# ---------------------------------- Q3 ---------------------------------- #

# --- POINT : CHEST PAIN x TARGET

heart %>%
  group_by(target, cp) %>%
  summarize(count=n()) %>%
  ggplot(aes(cp, count)) +
  geom_line(aes(group = cp), alpha=0.2) +
  geom_point(aes(color = target), size=4, shape=18) +
  scale_colour_manual(values=c("#00BFC4","#F8766D")) +
  labs(x=NULL, y="Count", colour="Heart Disease",
       title="Types of Chest Pain") +
  theme_minimal() +
  theme(text = element_text(size=11), 
        plot.title = element_text(hjust = 0.5, size=12, face = "bold")) +
  coord_flip()

# --- BAR : CHEST PAIN x ANGINA x TARGET

ggplot(heart, aes(x=exang, fill=target)) + 
  geom_bar(stat="count", position="dodge", width=.5) +
  scale_fill_manual(values=c("#72c2f6","#F67280")) +
  labs(x="Exercise-induced angina", y = "Count", fill = "Heart Disease", 
       title="Exercise-induced Angina by Different Type of Patients") +
  theme_minimal() +
  facet_grid(cp~.) +
  theme(text = element_text(size=10), 
        strip.background=element_rect(colour = "grey92", fill = "grey92"),
        plot.title = element_text(hjust = 0.5, size=11, face = "bold")) 

# ---------------------------------- Q4 ---------------------------------- #

# --- PIE : THAL x TARGET

thal1 <- heart %>% group_by(thal) %>% 
  filter(target %in% "Absent") %>%
  count() %>% ungroup() %>% 
  mutate(pct=`n`/sum(`n`)) %>%
  ggplot(aes(x="", y=n, fill=factor(thal))) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(x=NULL, y = "Absent", fill = "Thallium Stress Test Results :") +
  scale_fill_brewer(palette = "Pastel2") +
  theme_classic() +
  theme(axis.line = element_blank(), axis.text = element_blank(),
        axis.ticks = element_blank(), legend.direction = "horizontal", 
        legend.position = "top", legend.box = "horizontal",
        legend.title = element_text(size=12, face="bold")) +
  geom_text(aes(label =paste(round(pct*100,1),"%")), position =position_stack(vjust=0.5))

thal2 <- heart %>% group_by(thal) %>% 
  filter(target %in% "Present") %>%
  count() %>% ungroup() %>% 
  mutate(pct=`n`/sum(`n`)) %>% 
  ggplot(aes(x="", y=n, fill=factor(thal))) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  labs(x=NULL, y = "Present") +
  scale_fill_brewer(palette = "Pastel2") +
  theme_classic() +
  theme(axis.line = element_blank(), axis.text = element_blank(),
        axis.ticks = element_blank(), legend.position = "none") +
  geom_text(aes(label=paste(round(pct*100,1),"%")), position=position_stack(vjust=0.5))

legend <- get_legend(thal1)
thal1 <- thal1 + theme(legend.position="none")

grid.arrange(legend, thal1, thal2, ncol=2, heights=c(1/4,3/4),
             layout_matrix=rbind(c(1,1), c(2,3)),
             bottom = grid::textGrob("Diagnosis of Heart Disease", 
                                     vjust = 0.6, hjust = 0.5))

# ---------------------------------- Q5 ---------------------------------- #

# --- DENSITY : ST DEPRESSION x TARGET

heart %>%
  group_by(target) %>%
  mutate(mid = median(stdep))  %>%
  ggplot(aes(x=stdep, color=target)) +
  geom_density()+
  geom_vline(aes(xintercept=mid, color=target),
             linetype="dashed") +
  labs(x="ST Depression Induced by Exercise", y = "Density",
       colour = "Heart Disease", 
       title="Density of ST Depression Induced by Exercise") +
  theme_minimal() +
  theme(text = element_text(size=11), 
        plot.title = element_text(hjust = 0.5, size=12, face = "bold")) 

# --- LINE : SLOPE x TARGET

heart %>%
  group_by(target, slope) %>%
  summarize(n=n()) %>%
  ggplot(aes(ymin=0, ymax=n, x=factor(slope), colour=target)) +
  geom_linerange(position=position_dodge(width=.5), size=1) + 
  geom_point(aes(y=n),
             position=position_dodge(width=.5), size=2, shape=19) +
  labs(x="Peak exercise ST segment", y="Count", colour="Heart Disease", 
       title="Differences in Peak Exercise ST Segment Among Patients") +
  theme_minimal() +
  scale_colour_brewer(palette="Paired") +
  theme(text = element_text(size=10), 
        plot.title = element_text(hjust = 0.5, size=11, face = "bold"))

# --------------------------------- TREE --------------------------------- #

# --- SPLIT

set.seed(2)
training <-  sample(1:nrow(heart), nrow(heart)/2) 
testing <- heart[-training, ]
target.test <- target[-training]

# --- UNPRUNE TREE

tree.heart  <- tree(target~., heart, subset=training)

plot(tree.heart)
text(tree.heart, pretty=0,cex=0.7)
title(main = "Unpruned Classification Tree")

summary(tree.heart) 

# --- UNPRUNE ACCURACY

tree.pred <- predict(tree.heart, testing, type = "class") 
table(tree.pred, target.test) 
mean(tree.pred==target.test)

# --- CV

set.seed(3)
cv.heart <- cv.tree(tree.heart, FUN=prune.misclass) 
cv.heart

plot(cv.heart$size, cv.heart$dev, type="b", 
     xlab="Terminal Nodes", ylab="Error Rate")

# --- PRUNE TREE

prune.heart <- prune.misclass(tree.heart, best=7)
plot(prune.heart)
text(prune.heart, pretty=0,cex=0.7)
title(main = "Pruned Classification Tree")

summary(prune.heart) 

prune.heart

# --- PRUNE ACCURACY

prune.pred=predict(prune.heart, testing, type="class") 
table(prune.pred, target.test)
mean(prune.pred==target.test)

