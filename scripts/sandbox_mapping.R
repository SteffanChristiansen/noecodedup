# ggplot2_map_denmark.R
# Create a map of Denmark with ggplot2 and mark Copenhagen.
# Requires: sf, ggplot2, rnaturalearth, rnaturalearthdata, ggspatial (optional), dplyr

# Install packages if needed (uncomment to install):
install.packages(c("sf","rnaturalearth","rnaturalearthdata","ggspatial"))

library(sf)
library(tidyverse)
library(rnaturalearth)
library(rnaturalearthdata)
library(ggspatial)

# 1) Get Denmark geometry (using rnaturalearth)
# NOTE: rnaturalearth returns country polygons. Depending on the scale and version,
# Greenland and Faroe Islands may be separate features. This code selects admin == "Denmark".
world <- ne_countries(scale = "large", returnclass = "sf")
dk <- world %>% filter(admin == "Denmark")
it <- world %>% filter(admin == "Italy")

# 2) Create an sf point for Copenhagen (lon, lat)
copenhagen <- st_sfc(st_point(c(12.5683, 55.6761)), crs = 4326) %>% st_sf(name = "Copenhagen")
aarhus <- st_sfc(st_point(c(10.2064, 56.1703)), crs = 4326) %>% st_sf(name = "Aarhus")
aalborg <- st_sfc(st_point(c(9.9970, 57.0115)), crs = 4326) %>% st_sf(name = "Aalborg")
milan <- st_sfc(st_point(c(9.1750, 45.5512)), crs = 4326) %>% st_sf(name = "Milan")


# 3) Optionally re-project to a metric CRS for nicer scale bar / distances (EPSG:3857 or EPSG:25832)
# We'll use EPSG:3857 (Web Mercator) here for easy plotting across packages.
dk_proj <- st_transform(dk, 3857)
it_proj <- st_transform(it, 3857)
cph_proj <- st_transform(copenhagen, 3857)
aarhus_proj <- st_transform(aarhus, 3857)
aalborg_proj <- st_transform(aalborg, 3857)
milan_proj <- st_transform(milan, 3857)

# 4) Compute a reasonable x/y limits (zoom) around Denmark (expand slightly)
bbox <- st_bbox(dk_proj)
xpad <- (bbox$xmax - bbox$xmin) * 0.05
ypad <- (bbox$ymax - bbox$ymin) * 0.05
xlim <- c(bbox$xmin - xpad, bbox$xmax + xpad)
ylim <- c(bbox$ymin - ypad, bbox$ymax + ypad)

# 5) Build the ggplot
p <- ggplot() +
  geom_sf(data = dk_proj, fill = "#f0f0f0", color = "#2b2b2b") +
  geom_sf(data = aalborg_proj, size = 3, shape = 21, fill = "red", color = "white") +
  geom_sf(data = cph_proj, size = 3, shape = 21, fill = "red", color = "white") +
  geom_sf(data = aarhus_proj, size = 3, shape = 21, fill = "red", color = "white") +
  # geom_text(data = as.data.frame(st_coordinates(aalborg_proj)),
  #           aes(X, Y, label = "Aalborg"),
  #           nudge_y = 2*10^4, fontface = "bold", size = 4) +
  # geom_text(data = as.data.frame(st_coordinates(aarhus_proj)),
  #           aes(X, Y, label = "Aarhus"),
  #           nudge_y = 2*10^4, fontface = "bold", size = 4) +
  # geom_text(data = as.data.frame(st_coordinates(cph_proj)),
  #           aes(X, Y, label = "Copenhagen"),
  #           nudge_y = 20000, fontface = "bold", size = 4) +
  geom_text(data = as.data.frame(st_coordinates(aalborg_proj)),
            aes(X, Y, label = "Aalborg University"),
            nudge_y = 2*10^4, nudge_x = 1*10^5, fontface = "bold", size = 4) +
  geom_text(data = as.data.frame(st_coordinates(aarhus_proj)),
            aes(X, Y, label = "Aarhus University"),
            nudge_y = 2*10^4, nudge_x = 1*10^5, fontface = "bold", size = 4) +
  geom_text(data = as.data.frame(st_coordinates(cph_proj)),
            aes(X, Y, label = "University of Copenhagen"),
            nudge_y = 3*10^4, nudge_x = 1.5*10^5, fontface = "bold", size = 4) +
  # geom_text(data = as.data.frame(st_coordinates(cph_proj)),
  #           aes(X, Y, label = "University of Copenhagen"),
  #           nudge_y = 3*10^4, nudge_x = 1.5*10^5, fontface = "bold", size = 4) +
  # geom_text(data = as.data.frame(st_coordinates(cph_proj)),
  #           aes(X, Y, label = "Rigshospitalet"),
  #           nudge_y = 0, nudge_x = 1*10^5, fontface = "bold", size = 4) +
  # geom_text(data = as.data.frame(st_coordinates(cph_proj)),
  #           aes(X, Y, label = "Statens Serum Institut"),
  #           nudge_y = -3*10^4, nudge_x = 1.5*10^5, fontface = "bold", size = 4) +
  coord_sf(xlim = xlim, ylim = ylim, expand = FALSE) +
  # labs(title = "Map of Denmark",
  #      subtitle = "Copenhagen marked",
  #      caption = "Data: Natural Earth") +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold", size = 16),
        plot.subtitle = element_text(size = 12))

# 6) Print the plot
print(p)


bbox <- st_bbox(dk_proj)
xpad <- (bbox$xmax - bbox$xmin) * 0.05
ypad <- (bbox$ymax - bbox$ymin) * 0.05
xlim <- c(bbox$xmin - xpad, bbox$xmax + xpad)
ylim <- c(bbox$ymin - ypad, bbox$ymax + ypad)
p1 <- ggplot() +
  geom_sf(data = dk_proj, fill = "#f0f0f0", color = "#2b2b2b") +
  geom_sf(data = aalborg_proj, size = 8, shape = 21, fill = "darkred", color = "white") +
  geom_sf(data = cph_proj, size = 8, shape = 21, fill = "darkred", color = "white") +
  geom_sf(data = aarhus_proj, size = 8, shape = 21, fill = "darkred", color = "white") +
  coord_sf(xlim = xlim, ylim = ylim, expand = FALSE) +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold", size = 16),
        plot.subtitle = element_text(size = 12))

p1

bbox <- st_bbox(it_proj)
xpad <- (bbox$xmax - bbox$xmin) * 0.05
ypad <- (bbox$ymax - bbox$ymin) * 0.05
xlim <- c(bbox$xmin - xpad, bbox$xmax + xpad)
ylim <- c(bbox$ymin - ypad, bbox$ymax + ypad)

p2 <- ggplot() +
  geom_sf(data = it_proj, fill = "#f0f0f0", color = "#2b2b2b") +
  geom_sf(data = milan_proj, size = 8, shape = 21, fill = "darkred", color = "white") +
  coord_sf(xlim = xlim, ylim = ylim, expand = FALSE) +
  theme_minimal() +
  theme(plot.title = element_text(face = "bold", size = 16),
        plot.subtitle = element_text(size = 12))


p1
p2 

# 6) Print the plot
print(p)

ggsave("C:/Users/QJ17ZB/Downloads/DK.png", p1, width = 6, height = 6, dpi = 600)
ggsave("C:/Users/QJ17ZB/Downloads/IT.png", p2, width = 6, height = 6, dpi = 600)

# If you want the 5-digit coordinates displayed or to save the plot:
# ggsave("denmark_copenhagen_map.png", p, width = 8, height = 6, dpi = 300)

