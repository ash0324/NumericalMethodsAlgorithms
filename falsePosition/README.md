# falsePosition
## Description
* Uses falsePosition method to estimate a function's root locations
* Requires user to provide upper and lower brackets (x-values) that surround a root
* User can specify error and iteration count
## Inputs
* **func** - function that you want to find zeros of
* **x_l** - lower bracket
* **x_u** - upper bracket
* **es** - desired relative error (defaults to 0.000001 or 0.0001%)
* **maxiter** - maximum iterations desired (defaults to 200)
## Outputs
* **root** - roots estimate
* **fx** - function evaluated at root
* **ea** - approximate relative error of root
* **iter** - number of iterations performed by algorithm to find root estimate
## Errors & Warnings
* **Error: "Bounds must bracket a root!"** inputed function evaluated at **x_l** and **x_u** have the same sign (+/-)
* **Error: "not enough input arguments"** less than 3 inputs are provided (only **es** and **maxiter** will default)
## Notes
* If multiple roots exist within inputed bracket, either 1 or none of the roots will be found
