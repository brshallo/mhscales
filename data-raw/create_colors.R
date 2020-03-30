# Missouri History Society corporate colors
mhs_colors <- c(
  `blue`        = rgb(22, 129, 196, maxColorValue = 256),
  `dark blue`   = rgb(14, 84, 127, maxColorValue = 256),
  `purple`      = rgb(126, 85, 195, maxColorValue = 256),
  `dark purple` = rgb(82, 56, 117, maxColorValue = 256),
  `teal`        = rgb(0, 153, 168, maxColorValue = 256),
  `dark teal`   = rgb(0, 116, 127, maxColorValue = 256),
  `gold`        = rgb(247, 167, 0, maxColorValue = 256),
  `dark gold`   = rgb(127, 86, 0, maxColorValue = 256),
  `grey`        = rgb(191, 191, 191, maxColorValue = 256),
  `dark grey`   = rgb(166, 166, 166, maxColorValue = 256))

usethis::use_data(mhs_colors, overwrite = TRUE)

library(mhscales)

mhs_palettes <- list(
  `mhs`  = mhs_cols("blue", "dark blue"),

  `mhm`  = mhs_cols("purple", "dark purple"),

  `lrc`   = mhs_cols("teal", "dark teal"),

  `smm` = mhs_cols("gold", "dark gold"),

  `grey`  = mhs_cols("grey", "dark grey"),

  `mhs_mhm` = mhs_cols("blue", "dark grey", "purple"),

  `mhs_mhm_all` = mhs_cols("blue", "dark grey", "purple", "dark blue", "grey", "dark purple")
)

usethis::use_data(mhs_palettes, overwrite = TRUE)
