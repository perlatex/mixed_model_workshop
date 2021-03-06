## ------------------------------------------------------------------------
data("fhch2010", package = "afex")
str(fhch2010)
# 'data.frame':	13222 obs. of  10 variables:
# $ id       : Factor w/ 45 levels "N1","N12","N13",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ task     : Factor w/ 2 levels "naming","lexdec": 1 1 1 1 1 1 1 1 1 1 ...
# $ stimulus : Factor w/ 2 levels "word","nonword": 1 1 1 2 2 1 2 2 1 2 ...
# $ density  : Factor w/ 2 levels "low","high": 2 1 1 2 1 2 1 1 1 1 ...
# $ frequency: Factor w/ 2 levels "low","high": 1 2 2 2 2 2 1 2 1 2 ...
# $ length   : Factor w/ 3 levels "4","5","6": 3 3 2 2 1 1 3 2 1 3 ...
# $ item     : Factor w/ 600 levels "abide","acts",..: 363 121 202 525 580 135 42 368 227 141 ...
# $ rt       : num  1.091 0.876 0.71 1.21 0.843 ...
# $ log_rt   : num  0.0871 -0.1324 -0.3425 0.1906 -0.1708 ...
# $ correct  : logi  TRUE TRUE TRUE TRUE TRUE TRUE ...

## ---- eval=FALSE---------------------------------------------------------
## mixed(log_rt ~ ...)
## 

m_fhch <- mixed(log_rt ~ task*stimulus*density*frequency*length + 
                  (stimulus*density*frequency*length||id) +
                  (task||item), fhch2010, 
                method = "S", expand_re = TRUE)
