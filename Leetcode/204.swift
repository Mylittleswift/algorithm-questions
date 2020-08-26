/***
 204. Count Primes
 Easy

 Count the number of prime numbers less than a non-negative number, n.
 
 Example:
 
 Input: 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 ***/



class Solution204x1 {
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else { return 0 }
        var sieve = [Bool](repeating: true, count: n)
        var count = n / 2
        var i = 3
        
        while i * i < n {
            if sieve[i] {
                var j = i * i
                
                while j < n {
                    if sieve[j] {
                        count -= 1
                        sieve[j] = false
                    }
                    j += 2 * i
                }
            }
            i += 2
        }
        
        return count
    }
}


class Solution204x2 {
    func countPrimes(_ n: Int) -> Int {
        if n < 3 { return 0 }
        var isPrime = Array.init(repeating: true, count: n)
        var i = 2;
        while i*i < n {
            if(!isPrime[i]) {
                i += 1;
                continue
            }
            var j = i*i
            while (j < n) {
                isPrime[j] = false
                j += i;
            }
            i += 1;
        }
        var counter = 0
        for k in 2..<n {
            if isPrime[k] {
                counter += 1
            }
        }
        return counter
    }
}
