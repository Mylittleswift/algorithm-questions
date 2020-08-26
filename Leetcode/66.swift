/***
 66. Plus One
 Easy

 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 
 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 
 You may assume the integer does not contain any leading zero, except the number 0 itself.
 
 Example 1:
 
 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Example 2:
 
 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 ***/



class Solution66x1 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var addOne = digits
        var current = digits.count - 1
        var carryOver = false
        var num = digits[current]
        
        if (current < 0)  {
            return addOne
        }
        
        num = addOne[current] + 1
        if (num<10) {
            addOne[current] = num
            return addOne
        } else {
            carryOver = true
            addOne[current] = 0
            current = current - 1
            while (current>=0) && (carryOver==true) {
                num = addOne[current] + 1
                if (num<10) {
                    addOne[current] = num
                    return addOne
                } else {
                    carryOver = true
                    addOne[current] = 0
                    current = current - 1
                }
            }
        }
        
        //[9] - >[0] ==>[1,0]
        print("addOne: \(addOne)")
        if (carryOver==true)  {
            addOne[0] = 0
            addOne.insert(1, at: 0)
            /*
             if (addOne[0]<9) {
             addOne[0] = addOne[0] + 1
             } else {
             addOne[0] = 0
             addOne.insert(1, at: 0)
             }*/
        }
        print("--**addOne: \(addOne)")
        return addOne
    }
}


class Solution66x2 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var copy = [Int](), carry = 0, add = 1
        for i in stride(from: digits.count-1, through: 0, by: -1){
            if(((digits[i] + add + carry)) == 10){
                carry = 1
                copy.append(0)
            }
            else{
                copy.append(digits[i] + carry + add)
                carry = 0
            }
            add = 0
        }
        if(carry != 0){copy.append(carry)}
        return copy.reversed()
    }
}


class Solution66x3 {
    func plusOne(_ digits: [Int]) -> [Int] {
        //获取数组长度
        var len:Int = digits.count
        //参数digits是let定义,转成可变参数
        var arr:[Int] = digits
        //倒序遍历数组
        for i in (0..<digits.count).reversed()
        {
            //如果数组最后一位不是整数9,加一返回数组
            if arr[i]<9
            {
                arr[i]+=1
                return arr
            }
            else
            {
                //如果数组最后一位是整数9，则变成整数0。
                arr[i] = 0
            }
        }
        //程序运行至此是全9的情况,需要在首位插入数字1
        arr.insert(1, at: 0)
        return arr
    }
}


class Solution66x4 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var resultArray = [Int]()
        var pointer = digits.count - 1
        var checkIfAdded = false
        
        
        if digits.count == 1 {
            if digits[0] + 1 > 9 {
                return [1,0]
            } else {
                return [digits[0] + 1]
            }
        }
        
        
        while pointer >= 0 {
            if checkIfAdded == false {
                if digits[pointer] + 1 > 9 {
                    resultArray.insert(0, at: 0)
                    pointer -= 1
                } else {
                    resultArray.insert(digits[pointer] + 1, at: 0)
                    checkIfAdded = true
                    pointer -= 1
                }
            } else {
                resultArray.insert(digits[pointer], at: 0)
                pointer -= 1
            }
        }
        
        if resultArray[0] == 0 {
            resultArray.insert(1, at: 0)
        }
        
        return resultArray
        
    }
}


class Solution66x5 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var carry : Int = 1
        var returnArray = digits
        
        for index in stride(from:digits.count - 1 , to: -1, by: -1){
            let value = (digits[index] + carry) % 10
            carry = (digits[index] + carry) / 10
            returnArray[index] = value
        }
        if carry == 1 {
            returnArray.insert(1 ,at:0)
        }
        return returnArray
    }
}
