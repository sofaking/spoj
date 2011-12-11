# calculate prime numbers up to sqare root of 1_000_000_000
@primes = [2]# assign 2 to primes array

3.step(32_000,2) do |odd|# iterate through all odd numbers from 3 to square root of billion
  is_prime = true # flag
  cap = Math.sqrt(odd) # cap = sqrt(sqrt(billion)
      
  @primes.each do |prime|# iterate through primes array
    break if prime > cap# switch to next odd if prime greater or equal cap; cur_off is prime

    if odd % prime == 0 # if cur_odd % cur_prime == 0
      is_prime = false# cur_odd isn't prime
      break # switch to next odd
    end
  end
    
  @primes << odd if is_prime # cur_odd should be added to primes array if it is prime
end

#get count of test cases
test_cases = gets.to_i 
#get ranges until they reach the count
ranges = []
1.upto(test_cases).each { ranges.push(gets.split(' ')) }

#print prime numbers for each test case
numprimes = @primes.length
ranges.each do |range| 
#{ |range| print_primes(range) } #print range
#}
#def print_primes(range)
  range = [range[0].to_i, range[1].to_i] # convert range to integer
  range[0] = 2 if range[0] < 2
  not_primes = {}
  
  cap = Math.sqrt(range[1]) #cap

#  to = 32_000
#  if range.first < 32_000
#    from = @primes.index(range.first)
#    @primes[from,32_000].each do |prime|
#      break if prime > range.last
#      print prime, "\n"
#    end
#  end

#  if to > 32_000
    start_prime = nil
#    j=0
#    while j < numprimes
#      prime = @primes[j]
#      j+=1
@primes.each do |prime| #iterate through primes
      # calculate start number
      if prime >= range[0] # if prime greater or equal range.left
	start_prime = prime * 2 # start_prime = cur_prime * 2
      else # if cur_prime lesset than range.left
	start_prime = range[0] + ( prime - range[0] % prime ) % prime# start_prime = range.left + ( cur_prime - range.left % cur_prime
      end
      # mark each multiple of cur_prime in range between start_prime and range.right as not_prime
#start_prime.step(range[1],prime).each { |not_prime| not_primes[not_prime] = true }
      i = start_prime
      while i <= range[1]
	not_primes[i] = true
	i+=prime
      end
    end 

  range[0].upto(range[1]) { |candidate| print candidate, "\n" unless not_primes[candidate] == true }  #iterate through range
#  end

  print "\n"
end
