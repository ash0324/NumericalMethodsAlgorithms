# Simpson
## Description
* Uses Simpson's 1/3 Rule to estimate the integral of a data set
* If number of intervals is odd, employs trapezoidal rule on last interval
## Inputs
* x - independent variable of data set
* y - dependent variable of data set
## Outputs
* I - Numerical Integral estimate
## Errors & Warnings
* **Error: "input vectors must be same length!"** - the x and y arrays are not equal in length (do not contain the same number of values)
* **Error: "Interval spacing is unequal!"** - spacing of values in x array are not equal
* **Warning: "Trapezoidal method will be used to evaluate final interval due to odd number of intervals"** - array length is even, spacing is odd, algorithm will find numerical integral, but perform trapezoidal rule on last interval
