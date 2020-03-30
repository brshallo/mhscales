#' Extract MHS Colors as Hex Codes
#'
#' @param ... Character names of colors
#' @return Named character vector.
#' @export
#' @examples
#' mhs_cols("purple")
#' mhs_cols("blue", "purple")
mhs_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (mhs_colors)

  mhs_colors[cols]
}

#' Return function to interpolate an MHS color palette
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @return A function that can be used to create n number of colors (given a
#'   pallette).
#' @export
#' @examples
#'
#' mhs_pal("mhm")
#' mhs_pal("mhm")(10)
mhs_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- mhs_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Color scale constructor for MHS colors
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @return A scale_color_*() to be used with ggplot.
#' @export
#' @examples
#' library(ggplot2)
#' library(mhscales)
#' # Color by discrete variable using default palette
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#'   geom_point(size = 4) +
#'   scale_color_mhs(palette = "mhs_mhm")
#'
#' # Color by numeric variable with cool palette
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Sepal.Length)) +
#'   geom_point(size = 4, alpha = .6) +
#'   scale_color_mhs(palette = "mhm", discrete = FALSE)
scale_color_mhs <- function(palette = "mhs", discrete = TRUE, reverse = FALSE, ...) {
  pal <- mhs_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("mhs_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for MHS colors
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#' @return A scale_fill_*() to be used with ggplot.
#' @export
#' @examples
#' library(ggplot2)
#' library(mhscales)
#' # Fill by discrete variable with different palette + remove legend (guide)
#' ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
#'   geom_bar() +
#'   theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
#'   scale_fill_mhs(palette = "mhm", guide = "none")
#'
#' # fill by continuous variable
#' library(forcats)
#' library(dplyr)
#'
#' mpg %>%
#'   count(manufacturer) %>%
#'   mutate(manufacturer = forcats::fct_reorder(manufacturer, n)) %>%
#'   ggplot(aes(x = manufacturer, y = n, fill = n)) +
#'   geom_col() +
#'   scale_fill_mhs(palette = "mhs_mhm", discrete = FALSE)+
#'   coord_flip()
scale_fill_mhs <- function(palette = "mhs", discrete = TRUE, reverse = FALSE, ...) {
  pal <- mhs_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("mhs_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

