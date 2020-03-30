
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mhscales

Provides color palletes that align with the colors for the Missouri
Historical Society. The palletes were created for use with `ggplot2`
charts but some objects may also be useful for setting file template
colors, etc. The primary functions are `scale_color_mhs()` and
`scale_fill_mhs()`. I used this
[tutorial](https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2)
as guidance in creating these functions.

The objects in this package were initially created while volunteering
with the Missouri Historical Society.

## Installation

You can install these functions from github:

``` r
devtools::install_github("brshallo/mhscales")
```

## Data

There are palletes defined for each of:

  - Missouri Historical Society (mhs)
  - Missouri History Museum (mhm)
  - Library & Research Center (lrc)
  - Soldiers Memorial Military Museum (smm)

As well as combinations of these.

``` r
mhscales::mhs_palettes
#> $mhs
#>      blue dark blue 
#> "#1680C3" "#0E547F" 
#> 
#> $mhm
#>      purple dark purple 
#>   "#7E55C2"   "#523875" 
#> 
#> $lrc
#>      teal dark teal 
#> "#0098A7" "#00747F" 
#> 
#> $smm
#>      gold dark gold 
#> "#F6A600" "#7F5600" 
#> 
#> $grey
#>      grey dark grey 
#> "#BEBEBE" "#A5A5A5" 
#> 
#> $mhs_mhm
#>      blue dark grey    purple 
#> "#1680C3" "#A5A5A5" "#7E55C2" 
#> 
#> $mhs_mhm_all
#>        blue   dark grey      purple   dark blue        grey dark purple 
#>   "#1680C3"   "#A5A5A5"   "#7E55C2"   "#0E547F"   "#BEBEBE"   "#523875"
```

## Example

You can set as continuous scales:

``` r
library(ggplot2)
library(mhscales)

ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Sepal.Length)) +
 geom_point(size = 2) +
 scale_color_mhs(palette = "smm", discrete = FALSE)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

As discrete scales:

``` r
ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
 geom_point(size = 2) +
 scale_color_mhs(palette = "mhs_mhm", discrete = TRUE)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

Equivalent functions exist for the fill aesthetic:

``` r
library(dplyr)

iris %>% 
  filter(Sepal.Length < 6) %>% 
  ggplot(aes(x = Species, fill = Species)) +
  geom_bar()+
  scale_fill_mhs(palette = "mhs_mhm", discrete = TRUE)
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />
