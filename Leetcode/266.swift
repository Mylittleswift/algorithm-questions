/***
 266. Palindrome Permutation
 Easy
 
 Problem:
 Given a string, determine if a permutation of the string could form a palindrome.
 For example, "code" -> False, "aab" -> True, "carerac" -> True.
 Hint:
 Consider the palindromes of odd vs even length. What difference do you notice? Count the frequency of each character. If each character occurs even number of times, then it must be a palindrome. How about character which occurs odd number of times?
 ***/



class Solution266 {
    func canPermutePalindrome(_ s:String) -> Bool {
        var t:Set<Character> = Set<Character>()
        for a in s.characters
        {
            if !t.contains(a)
            {
                t.insert(a)
            }
            else
            {
                t.remove(a)
            }
        }
        return t.isEmpty || t.count == 1
    }
}
