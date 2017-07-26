
module Crystalg::NumberTheory
  def divisor(n)
    result = Array(Int32).new
    (1..Math.sqrt(n).to_i).each do |i|
      if(n % i == 0)
        result << i
        result << n / i if i != n / i
      end
    end
    result
  end

  def prime_factorize(n)
    result = Hash(Int32, Int32).new

    (2..Math.sqrt(n).to_i).each do |i|
      count = 0
      while n % i == 0
        count += 1
        n /= i
      end
      result[i] = count if count > 0
    end
    result[n] = 1 if n != 1
    result
  end

  def sieve_of_eratosthenes(n)
    result = Array(Bool).new(n + 1, true)
    result[0] = result[1] = false
    (2..Math.sqrt(n).to_i).each do |i|
      if(result[i] == true)
        (i*i..n).step(i).each { |i| result[j] = false }
      end
    end
    result
  end
end
