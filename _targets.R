options( geodata_default_path = "data/raw")

library(targets)
library(geotargets)

# Set target options:
tar_option_set(
  packages = c(
    "terra",
    "geodata",
    "dplyr",
    "ggplot2",
    "tidyterra",
    "geotargets"
  )
)

tar_source()

list(
  tar_target(
    target_country_iso3,
    "ISL",
  ),
  tar_terra_vect(
    country_admin_0,
    gadm(
      country = target_country_iso3,
      level = 0
    )
  ),
  tar_terra_vect(
    country_admin_1,
    gadm(
      country = target_country_iso3,
      level = 1
    )
  ),
  tar_terra_vect(
    country_admin_2,
    gadm(
      country = target_country_iso3,
      level = 2
    )
  ),
  tar_terra_rast(
    country_bioclim,
    worldclim_country(
      country = target_country_iso3,
      var = "bio"
    )
  ),
  tar_target(
    name = pointless_end_target,
    NULL
  )
)
