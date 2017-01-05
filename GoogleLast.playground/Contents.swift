//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Stack with LL

class Node {
    
    var data: Int
    var next: Node?
    
    init(data: Int) {
        
        self.data = data
    }
}

class Stack {
    
    var top: Node?
    
    func push(data: Int) {
        
        var newItem: Node = Node(data: data)
        
        if top == nil {
            
            top = newItem
            
        } else {
            
            newItem.next = top
            top = newItem
        }
    }
    
    
    func pop() -> Node? {
        
        if top == nil {
            
            return nil
        } else {
            
            var popedItem = top
            top = top?.next
            popedItem?.next = nil
            return popedItem
        }
    }
    
}

extension Stack: CustomStringConvertible {
    
    var description: String {
        
        var desc = "["
        
        var current = self.top
        while current != nil {
            
            desc += "\(current?.data)"
            current = current?.next
            
        }
        desc += "]"
        
        return desc
    }
}

var testStack = Stack()

testStack.push(data: 1)
testStack.push(data: 2)
testStack.push(data: 3)

print(testStack)

testStack.pop()!.data
testStack.pop()
testStack.pop()
testStack.pop()

//Stack with array
class stackArray {
    
    var stk: [Int] = []
    
    func push(data: Int) {
        
        stk.append(data)
    }
    func pop() -> Int? {
        
        if stk.count == 0 {
            
            return nil
        } else {
            
            var popeditem: Int = stk.remove(at: stk.count - 1)
            
            return popeditem
        }
        
    }
}

extension stackArray: CustomStringConvertible {
    
    var description: String {
        
        return "\(self.stk)"
    }
}

var testStackArray = stackArray()

testStackArray.push(data: 1)
testStackArray.push(data: 2)
testStackArray.push(data: 3)

print(testStackArray)

testStackArray.pop()
testStackArray.pop()
testStackArray.pop()
testStackArray.pop()

class NodeLL {
    
    var data: Int
    var next: NodeLL?
    
    init(data: Int) {
        self.data = data
    }
}


class LinkedList {
    
    var head: NodeLL?
    var tail: NodeLL?
    
    var count: Int {
         var countLL = 0
        
        if head == nil {
            return countLL
            
        } else {
            
            var current = head
            
            while current != nil {
                
                countLL += 1
                current = current?.next
            }
            
            return countLL
        }
        
        
    }
    func addNode(data: Int) {
        
        var newNode: NodeLL = NodeLL(data: data)
        
        if head == nil {
            
            head = newNode
            tail = newNode
        } else {
            
            var current = head
            
            while current?.next != nil {
                
                current = current?.next
                
            }
            
            current?.next = newNode
            tail = newNode
        }
        
    }
    
    func remove(element: NodeLL) -> Bool {
        
        if head == nil {
            
            return false
        } else {
            
            var current = head
            
            while current != nil {
                
                if current?.next?.data == element.data {
                    
                    //print(current?.next?.next?.data)
                    current?.next = current?.next?.next
                    current?.next?.next = nil
                }
                
                if current?.next == nil {
                    tail = current
                }
                
                current = current?.next
            }
            
            return true
        }
    }
    
    func insertAfter(element: Int, data: Int) -> Bool {
        
        var newNode: NodeLL = NodeLL(data: data)
        var current = head
        
        while current != nil {
            
            if current?.next?.data == element {
                
                print("\(current?.next?.data == element)")
                var tmp = current?.next?.next
                
                current?.next?.next = newNode
                newNode.next = tmp
            }
            
            if current?.next == nil {
                tail = current
            }
            
            current = current?.next
        }
        
        return true
    }
    
    func mToLast(index: Int) -> [NodeLL?] {
        
        if head == nil {
            return []
        } else {
            
            var current = head
            var nodesReturn: [NodeLL] = []
            var counter = 1
            
            while counter != index {
                current = current?.next
                counter += 1
            }
            
            while counter <= self.count {
                
                nodesReturn.append(current!)
                counter += 1
                current = current?.next
            }
            
            return nodesReturn
        }
    }
    
    func isCyclic() -> Bool {
        
        var fast = head
        var slow = head?.next
        
        while true {
            
            print("slow ptr: \(slow?.data) fast ptr: \(fast?.data)")
            
            if fast == nil || fast?.next == nil {
                
                return false
            } else if fast === slow || fast?.next === slow {
                
                return true
            } else {
                
                slow = slow?.next
                fast = fast?.next?.next
            }
        }
    }
    
    func makeCycle() {
        
        var current = head
        var cycle: NodeLL? = head
        
        while current?.next != nil {
            
            current = current?.next
        }
        
        current?.next = cycle?.next?.next
    }
}

extension LinkedList: CustomStringConvertible {
    
    var description: String {
        
        var desc = "["
        
        var current = self.head
        var c = 1
        
        while current != nil {
            
            desc += "\(current!.data)-->"
            current = current?.next
            c += 1
            
            //print(c == self.count)
        }
        
        desc += "nil]"
        
        return desc
    }
}


var testLL = LinkedList()

testLL.addNode(data: 1)
testLL.addNode(data: 2)
testLL.addNode(data: 3)
print(testLL)

var nodeToRemove = NodeLL(data: 2)
testLL.remove(element: nodeToRemove)

print(testLL)

testLL.addNode(data: 5)
testLL.insertAfter(element: 3, data: 4)
print(testLL)
print(testLL.head?.data ?? 0)
testLL.count

testLL.mToLast(index: 2)


var testStr = "total"

func repeatedStr(word: String) -> (String, Int?) {
 
    var stop = false
    var letters: [Character : Int] = [:]
    var repeated: String = ""
    
    for char in word.characters {
        
        if letters[char] != nil && stop == false {
            
            repeated = String(char)
            letters[char]! += 1
            stop = true
            
        } else {
            
            
            letters[char] = 1
        }
    }
    
    return (repeated, letters[Character(repeated)]!)
}

func nonRepeatedChar(words: String) -> String {
    
    var stop = false
    var repeated: String = ""
    var letters: [Character : Int] = [:]
    
    for char in words.characters {
        
        if letters[char] != nil {
            
            letters[char]! += 1
            
        } else {
        
            letters[char] = 1
        }
        
    }
    
    print(letters)
    for char in words.characters {
        
        if letters[char]! == 1 {
            repeated = String(char)
            break
        }
    }
    
    return (repeated)
}

func removeChars(words: String, remove: [String]) -> String {
    
    var returnedStr = ""
    
    for char in words.characters {
        
        if remove[0] == String(char) || remove[1] == String(char) || remove[2] == String(char) || remove[3] == String(char) || remove[4] == String(char) {
            
        } else {
            
            returnedStr += String(char)
        }
    }
    return returnedStr
}

func reverseWords(sentence: String) -> String {
    
    var word = ""
    var toReverse: [String] = []
    var finalSentence = ""
    
    for char in sentence.characters {
        
        if char == " " || char == "." {
            
            word += (char == ".") ? ". " : " "
            toReverse.append(word)
            word = ""
        } else {
            
            word += String(char)
            
        }
    }
    
    while !toReverse.isEmpty {
    
        finalSentence += toReverse.removeLast()
    }
    
    return finalSentence
}

//testLL.makeCycle()
//
//print(testLL)

//testLL.isCyclic()

repeatedStr(word: testStr)

nonRepeatedChar(words: testStr)

var sentence = "Battle of the vowels: Hawwaii vs Grozny"
var remove = ["a", "e", "i", "o", "u"]

removeChars(words: sentence, remove: remove)

var strToReverse = "Do or do not, there is no try."

reverseWords(sentence: strToReverse)


Int("123")
Int("-123")
"\(123)"
"\(-123)"

var input = [1, 2, 3, 5, 6, 7, 9, 10, 11]

func binarySearch(inoput: [Int], lower: Int, upper: Int, key: Int) -> Int? {
    
    var midIndex = round(Double((upper + lower)/2))
    var midNumber = input[Int(midIndex)]
    
    print("midnmber: \(midNumber)")
    print("key \(key)")
    
    if midNumber == key {
        
        print("found \(midNumber)")
        return midNumber
        
    } else if key < midNumber {
        
        print("going left")
        binarySearch(inoput: input, lower: lower, upper: Int(midIndex), key: key)
    } else if key > midNumber {
        print("going right")
        
        binarySearch(inoput: input, lower: Int(midIndex), upper: upper, key: key)
    } else {
        return nil
        
    }
    return midNumber
}
binarySearch(inoput: input, lower: 0, upper: input.count-1, key: 2)
binarySearch(inoput: input, lower: 0, upper: input.count-1, key: 10)
//binarySearch(inoput: input, lower: 0, upper: input.count-1, key: 112)

func binarySearch2(input:[Int], lower: Int, upper: Int, target: Int) {
    
    var center = (upper+lower)/2
    print("upper: \(upper) lower: \(lower) center: \(center)")
    
    if center < 0 || center >= input.count || upper < lower {
        
        print("not in array")
        return
    } else if target == input[center] {
        
        print("found")
        
    } else if target < input[center] {
        
        binarySearch2(input: input, lower: lower, upper: center - 1, target: target)
        
    } else if target > input[center] {
        
        binarySearch2(input: input, lower: center + 1, upper: upper, target: target)
        
    }
}
binarySearch2(input: input, lower: 0, upper: input.count-1, target: 0)

