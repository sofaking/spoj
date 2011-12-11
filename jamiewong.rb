#require 'benchmark'
primes = [2]

3.step(32000,2) do |i|
    isprime = true
    cap = Math.sqrt(i) + 1

    primes.each do |p|
        if (p >= cap)
            break
        end

        if (i % p == 0)
            isprime = false
            break
        end
    end

    if isprime
        primes << i
    end
end
numprimes = primes.length

T = gets.to_i


#Benchmark.bm do |x|
#x.report do 
output = ""
t = 0
while t < T
#print "\n" if t > 0
    line = gets.split(" ")
    m = line[0].to_i
    n = line[1].to_i

    m = 2 if m < 2

    cap = Math.sqrt(n) + 1

    notprime = {}

    i = 0
    while i < numprimes
        p = primes[i]
        i+=1
        if (p >= cap)
            break
        end

        if (p >= m)
            start = p*2
        else
            start = m + ((p - m % p)%p)
        end

        j = start
        while j <= n
            notprime[j] = true
            j += p
        end
    end

    i = m
    while (i <= n)
        if (notprime[i] == nil)
#print i,"\n"
        end
        i+=1
    end
    t += 1
end
#end
#end
