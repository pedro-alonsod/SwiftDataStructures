//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var input = "Hello"
var input2 = "leetcode"

func reverseVowels(input: String) -> String {
    
    var indices: [Int] = []
    var vowels: [Character] = ["a", "e", "i", "o", "u"]
    var charReversed: [Character] = []
    var inputAsArray: [Character] = Array(input.characters)
    
    for (index, element) in inputAsArray.enumerated() {
        
        if element == vowels[0] || element == vowels[1] || element == vowels[2] || element == vowels[3] || element == vowels[4] {
          
            indices.append(index)
            charReversed.insert(element, at: 0)
          
            print(index)
            print(charReversed)
            print(element)
        }
    }
    
    
    print(indices)
    print(charReversed)
    var output: String = ""
    
    for (i, c) in input.characters.enumerated() {
        
        
        output += String((i == indices[0]) ? charReversed[0] : c)
        
        if i == indices[0] {
            
            print(true)
            indices.remove(at: 0)
            print(indices)
            charReversed.remove(at: 0)
            
        }
    }
    
   
    
    return output
    
}

reverseVowels(input: input2)

//Given two binary strings, return their sum (also a binary string).
//For example, a = "11"
//b = "1" Return "100".

var first = UInt8("11")!
var second = UInt8("1")!

var result = UInt8(first) + UInt8(second)

var binary: String = String(result, radix: 2)

//154. Find Minimum in Rotated Sorted Array II
//Suppose a sorted array is rotated at some pivot unknown to you beforehand. (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
//Find the minimum element.
//The array may contain duplicates.

var inputArray: [Int] = [4, 5, 6, 7, 0, 1, 2]

inputArray.sort { $0 < $1 }

print(inputArray[0])

//
//167. Two Sum II - Input array is sorted
//Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
//The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
//Please note that your returned answers (both index1 and index2) are not zero- based.
//You may assume that each input would have exactly one solution. Input: numbers={2, 7, 11, 15}, target=9
//Output: index1=1, index2=2


func twoSum(inputArray: [Int], target: Int) -> (first:Int?, second:Int?) {
    
    var index1: Int?
    var index2: Int?
    
    for (idx1, element) in inputArray.enumerated() {
        
        for (idx2, second) in inputArray.enumerated() {
            
            if element + second == target {
                
                index1 = idx1
                index2 = idx2
                
            }
        }
    }
    
    return (first: index1!+1, second: index2!+1)
}

var numbers = [2, 7, 11, 15]
var target = 9

twoSum(inputArray: numbers, target: target)

//
//402. Remove K Digits
//Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.
//Note:
//• The length of num is less than 10002 and will be ≥ k.
//• The given num does not contain any leading zero.
//Example 1:
//Input: num = "1432219", k = 3
//Output: "1219"
//Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
//Example 2:
//Input: num = "10200", k = 1
//Output: "200"
//Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
//Example 3:
//Input: num = "10", k = 2
//Output: "0"
//Explanation: Remove all the digits from the number and it is left with nothing which is 0.

func removeKdigits(num: String, k: Int) -> String {

    var numeAsInt: String = ""
    
    
    guard num.characters.count >= k else { return "" }
    
    for (idx, char) in num.characters.enumerated() {
    
    
        if idx > k {
            
            numeAsInt.append(char)
        }
        
    }
    
    return String(numeAsInt)
    
}

var num = "1432219"
var k = 3

removeKdigits(num: num, k: k)


//142. Linked List Cycle II
//Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
//Note: Do not modify the linked list.
//Follow up:
//Can you solve it without using extra space?


class Node {
    
    var data: Int
    var next: Node?
    
    init(data: Int) {
        
        self.data = data
    }
    
}

class LinkedList {
    
    var head: Node?
    var count: Int = 0
    
    func addNode(data: Int) {
        
        var newNode: Node = Node(data: data)
        
        if head == nil {
            
            head = newNode
            count += 1
            
        } else {
            
            var current = head
            
            while current?.next != nil {
                
                current = current?.next
                
            }
            
            current?.next = newNode
            count += 1
        }
    }
    
    func addCycle(data: Int) {
        
        var newNode: Node = Node(data: data)
        
        if head == nil {
            
            head = newNode
            head?.next = newNode
        } else {
            
            var current = head
            
            while current?.next != nil {
                
                current  = current?.next
            }
            
            current?.next = newNode
            newNode.next = current
            
        }
        
    }
    
    func remveDuplicates() -> LinkedList {
        
        var current = head

        var previous: Node? = head
//        var next = current?.next
        
        while current != nil {

            var next = current?.next

//            var next = current?.next
            
            while next != nil {
            
                if current?.data == next?.data {
                    
                    print("here dup \(current?.data) == \(next?.data)")
                    current?.next = (next?.next != nil) ? next?.next : nil
                    
                    count -= 1
                    
                    
                }
                
                next = next?.next
                
            }
            
            current = current?.next
            
            
        }
        
        //print(self)
        
        return self
    }
    
    func reverseLinkedList(m: Int, n: Int) -> LinkedList {
        
        var current = head
        var previous: Node? = nil
        var next: Node? = nil
        
        while current != nil {
            
            next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        
        head = previous
        
        return self
    }
}

extension LinkedList: CustomStringConvertible {
    
    var description: String {
        
        var desc = ""
        
        
        var current = self.head
        
        
        current = self.head
        var cycledNode = current?.next
        
        //desc += " \(current?.data) -->"
        
//        while current != nil {
     //   for i in 0..<self.count {
            //current = current?.next
            
            
            
//            for _ in 0..<self.count {
//                
//               if current === cycledNode?.next {
//                    
//                    print("cycled  in \(cycledNode?.data) and \(current?.data)")
//                    break
//                }
//                
//                cycledNode = current?.next
//            
//            }
//            
        while current != nil {
            
        
        
            desc += "\(current!.data)-->"
            current = current?.next
            
        }
        
        desc += "nil \(self.count)"
        
        return desc
        
    }
}

var testLL: LinkedList = LinkedList()

testLL.addNode(data: 1)
testLL.addNode(data: 2)
testLL.addNode(data: 3)
testLL.addNode(data: 4)

//testLL.addCycle(data: 5)


print(testLL)

//83. Remove Duplicates from Sorted List
//Given a sorted linked list, delete all duplicates such that each element appear only once.
//For example,
//Given 1->1->2, return 1->2.
//Given 1->1->2->3->3, return 1->2->3.

var lLRemove: LinkedList = LinkedList()
lLRemove.addNode(data: 1)
lLRemove.addNode(data: 1)
lLRemove.addNode(data: 2)
lLRemove.addNode(data: 3)
lLRemove.addNode(data: 3)

print(lLRemove)

lLRemove.remveDuplicates()


print(lLRemove)


//92. Reverse Linked List II
//Reverse a linked list from position m to n. Do it in-place and in one-pass. For example:
//Given 1->2->3->4->5->NULL, m = 2 and n = 4,
//return 1->4->3->2->5->NULL.
//Note:
//Given m, n satisfy the following condition: 1 ≤ m ≤ n ≤ length of list.

var reverseLL: LinkedList = LinkedList()
reverseLL.addNode(data: 1)
reverseLL.addNode(data: 2)
reverseLL.addNode(data: 3)
reverseLL.addNode(data: 4)
reverseLL.addNode(data: 5)

print(reverseLL)

reverseLL.reverseLinkedList(m: 2, n: 4)

//missing this ^


//290. Word Pattern
//Given a pattern and a string str, find if str follows the same pattern.
//Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.
//Examples:
//1. pattern="abba",str="dogcatcatdog"shouldreturntrue. 2. pattern="abba",str="dogcatcatfish"shouldreturnfalse. 3. pattern="aaaa",str="dogcatcatdog"shouldreturnfalse. 4. pattern="abba",str="dogdogdogdog"shouldreturnfalse.
//Notes:
//You may assume pattern contains only lowercase letters, and str contains lowercase letters separated by a single space.




