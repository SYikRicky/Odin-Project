def fib(n)
  
  if n < 2
    return n
  else
    puts 'This was printed recursively' 
    return fib(n-2) + fib(n-1)
  end
end

p fib (6)