# Load required library
library(ggplot2)

data <- data.frame(
  PostID   = c("P001", "P002", "P003", "P004", "P005"),
  Platform = c("Twitter", "Facebook", "Twitter", "Instagram", "Facebook"),
  Likes    = c(120, 95, 130, 160, 100),
  Shares   = c(45, 40, 50, 70, 30),
  Type     = c("Video", "Image", "Text", "Image", "Video"),
  Date     = as.Date(c("2025-06-01", "2025-06-02", "2025-06-03", "2025-06-04", "2025-06-05"))
)

# Plot: Bar chart 
my_plot <- ggplot(data, aes(x = Platform, y = Likes, fill = Platform)) +
  geom_bar(stat = "identity", width = 0.6) +
  geom_text(aes(label = Likes), vjust = -0.5, size = 5, fontface = "bold") +
  scale_fill_manual(values = c(
    "Twitter"   = "#1DA1F2",
    "Facebook"  = "#4267B2",
    "Instagram" = "#E1306C"
  )) +
  labs(
    title    = "Comparison of Likes Across Social Media Platforms",
    subtitle = "Data collected from June 1–5, 2025",
    x        = "Platform",
    y        = "Number of Likes"
  ) +
  theme_minimal() +
  theme(
    plot.title      = element_text(face = "bold", size = 14, hjust = 0.5),
    plot.subtitle   = element_text(size = 10, hjust = 0.5, color = "gray50"),
    legend.position = "none",
    axis.text       = element_text(size = 11),
    axis.title      = element_text(size = 12)
  )

# Displays the plot
print(my_plot)


# Save the plot as a PNG 
ggsave("likes_by_platform.png", width = 7, height = 5, dpi = 150)
cat("Plot saved as likes_by_platform.png\n")
#Opens image 
# shell.exec("likes_by_platform.png")   