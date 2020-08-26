/***
 155. Min Stack
 Easy

 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 
 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
 
 
 Example 1:
 
 Input
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]
 
 Output
 [null,null,null,null,-3,null,0,-2]
 
 Explanation
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin(); // return -3
 minStack.pop();
 minStack.top();    // return 0
 minStack.getMin(); // return -2
 
 
 Constraints:
 
 Methods pop, top and getMin operations will always be called on non-empty stacks.
 ***/



class MinStack {
    
    var stack: [Int]
    var minStack: [Int]
    
    /** initialize your data structure here. */
    init() {
        stack = []
        minStack = []
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if minStack.count == 0 {
            minStack.append(x)
        } else {
            minStack.append(min(x, minStack[minStack.count - 1]))
        }
    }
    
    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }
    
    func top() -> Int {
        return stack[stack.count - 1]
    }
    
    func getMin() -> Int {
        return minStack[minStack.count - 1]
    }
}


class MinStack2 {
    
    /** initialize your data structure here. */
    var stackArray: [Int]
    var minIndex: Int = 0
    init() {
        stackArray = [Int]()
    }
    
    func push(_ x: Int) {
        stackArray.append(x)
        let currMin = stackArray[minIndex]
        if x < currMin {
            minIndex = stackArray.count - 1
        }
    }
    
    func pop() {
        stackArray.removeLast()
        adjustMinIndex()
    }
    
    func top() -> Int {
        return stackArray.last ?? 0
    }
    
    func getMin() -> Int {
        return stackArray[minIndex]
    }
    
    func adjustMinIndex() {
        minIndex = 0
        guard stackArray.count > 1 else {return}
        var temp = stackArray[minIndex]
        for i in 1..<stackArray.count {
            if stackArray[i] < temp {
                temp = stackArray[i]
                minIndex = i
            }
        }
    }
}


class MinStack3 {
    //需要使用双栈实现
    //保存数据
    var stack: [Int]
    //保存最小值
    var sm: [Int]
    /** initialize your data structure here. */
    init() {
        stack = [Int]()
        sm = [Int]()
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if sm.isEmpty || (!sm.isEmpty && sm.last! >= x)
        {
            sm.append(x)
        }
    }
    
    func pop() {
        if stack.last! == sm.last!
        {
            sm.removeLast()
        }
        stack.removeLast()
    }
    
    func top() -> Int {
        //获取堆栈第一个元素
        return stack.last!
    }
    
    func getMin() -> Int {
        //获取堆栈第一个元素
        return sm.last!
    }
}


