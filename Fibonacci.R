fib <- function(n) {
   a = 0
   b = 1
  for (i  in 1:n) {
    tmp = b
    b = a
    a = a + tmp
  }
  return (a)
}
options(digits = 22)
sprintf("%f",fib(80))
fib(139)
sprintf("%.0f",fibonacci(80))
fibo(30:33)
signif(fib(139),digits=30)
fib.bigint <- function(lim) {
  a = c(0)
  b = c(1)
  n = 0           # Fibonacci number index
  integerSize <- 1000000000  ## How big is each integer
  while (1) {
    n = n + 1     # Compute next Fibonacci number
    tmp = c(rep(0,length(a)-length(b)), b)  # Pad beginning with zero
    b = a
    
    # Add a and tmp
    carry = 0
    for (i in length(a):1) {
      sum.i = tmp[i] + a[i] + carry
      a[i] = sum.i %% integerSize
      carry = floor (sum.i / integerSize)
    }
    if (carry > 0) {a <- c(carry, a)}
    numberDigits <- (length(a) - 1) * 9 + countDigits(a[1])
    if (numberDigits > (lim - 1)) { return (n) }
  }
}
countDigits <- function(n) {
  count <- 1
  for (i in 1:9){
    if ((n/10) > 1) {
      count <- count + 1
      n = n / 10
    } else {
      return (count)
    }
  }
}

install.packages("gmp")
require(gmp)
fib <- function(n) {
  a = 0
  b = 1
  for (i in 1:n) {
    tmp = b
    b = a
    a = add.bigz(a, tmp)  # gmp function
  }
  return(a)
}
fib(25000)
