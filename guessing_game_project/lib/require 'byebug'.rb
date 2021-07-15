require 'byebug'
def factorial(n)
    debugger
    return 1 if n == 1

    n * factorial(n - 1)
end

factorial(4)