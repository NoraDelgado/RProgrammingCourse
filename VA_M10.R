# Load libraries
library(ggplot2)
library(dplyr)

# Load data
data(economics)

# Filter to one observation per year
economics_yearly <- economics %>%
  filter(month(date) == 1)

# Create time series plot
ggplot(economics_yearly, aes(x = date, y = psavert)) +
  geom_line(color = "darkblue", size = 1) +
  geom_point(color = "orange", size = 2) +
  labs(
    title = "U.S. Personal Savings Rate By Year",
    subtitle = "From 1985 to 2015",
    x = "Year",
    y = "Personal Savings Rate (%)"
  ) +
  scale_y_continuous(breaks = seq(0, 12, by = 2), limits = c(0, 12)) +
  scale_x_date(
    breaks = seq(as.Date("1985-01-01"), as.Date("2015-01-01"), by = "5 years"),
    date_labels = "%Y",
    limits = c(as.Date("1985-01-01"), as.Date("2015-01-01"))
  ) +
  theme_gray(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5),
    plot.subtitle = element_text(face = "italic", size = 12, hjust = 0.5),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14)
  )