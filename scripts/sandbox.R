# doc: https://r-pkgs.org/whole-game.html
library(devtools)

# use_r("sum_stat") # convert function into new .R file
load_all()

# use_mit_license() # adding licence
document()
# check 1.12 for man page for new functions

use_package("")
# 1.16 - packages that are imported

# use_git()
check()
install()


