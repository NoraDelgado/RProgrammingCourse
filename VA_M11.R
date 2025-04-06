# Load libraries
library(ggplot2)
library(MASS)
library(psych)
library(plyr)
library(prettyR)
library(plotrix)
library(proto)
library(RCurl)
library(reshape)
library(reshape2)
library(ggExtra)
library(ggthemes)

# Data
x <- 1967:1977
y <- c(0.5, 1.8, 4.6, 5.3, 5.3, 5.7, 5.4, 5, 5.5, 6, 5)

# Create the plot and export to PDF
pdf(width=10, height=6)
plot(y ~ x, 
     axes = FALSE,  # Remove default axes
     xlab = "",     # No x-label
     ylab = "",     # No y-label
     pch = 16,      # Solid dots
     type = "b")    # Both points and lines

# Custom x-axis (years)
axis(1, at = x, labels = x, tick = FALSE, family = "serif")

# Custom y-axis (simulated dollar values)
axis(2, at = seq(1, 6, 1), 
     labels = sprintf("$%s", seq(300, 400, 20)), 
     tick = FALSE, 
     las = 2,       # Horizontal labels
     family = "serif")

# Reference lines
abline(h = 6, lty = 2)  # Upper threshold
abline(h = 5, lty = 2)  # Lower threshold

# Annotations
text(max(x), min(y) * 2.5, 
     "Per capita\nbudget expenditures\nin constant dollars", 
     adj = 1, family = "serif")
text(max(x), max(y) / 1.08, 
     labels = "5%", 
     family = "serif")
dev.off()


# Create scatter plot with marginal boxplots

p <- ggplot(faithful, aes(waiting, eruptions)) + geom_point(color = "steelblue", size = 2) +
  geom_smooth(method = "lm", se = FALSE, color = "darkred", linetype = "dashed") + labs(
    title = "Old Faithful Geyser Eruptions",
    subtitle = "Waiting Time vs. Eruption Duration") + theme_tufte(ticks=F) +
  theme(axis.title=element_blank(), axis.text=element_blank())
ggMarginal(p, type = "boxplot", size=10, fill="lightblue")
