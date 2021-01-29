def is_prime?(n)
  return false if n < 2

  (2...n).each { |fact| return false if n % fact == 0}

  true
end

def nth_prime(n)
  primes = []
  num = 2
  
  while primes.length < n
    primes << num if is_prime?(num)
    num += 1
  end

  primes[-1]
end

def prime_range(min, max)
  primes = []
  
  (min..max).each { |n| primes << n if is_prime?(n) }

  primes
end