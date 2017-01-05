//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//290. Word Pattern
//Given a pattern and a string str, find if str follows the same pattern.
//Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.
//Examples:
//1. pattern="abba",str="dogcatcatdog"shouldreturntrue. 2. pattern="abba",str="dogcatcatfish"shouldreturnfalse. 3. pattern="aaaa",str="dogcatcatdog"shouldreturnfalse. 4. pattern="abba",str="dogdogdogdog"shouldreturnfalse.
//Notes:
//You may assume pattern contains only lowercase letters, and str contains lowercase letters separated by a single space.

var input = "dog cat cat dog"
var pattern = "abba"

func wordPattern(input: String) {
    
    
}

//this ^


//187. Repeated DNA Sequences
//All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T, for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to identify repeated sequences within the DNA.
//Write a function to find all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.
//For example,
//Given s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT",
//Return: ["AAAAACCCCC", "CCCCCAAAAA"].

var s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"

func repeatedDNASequences(input: String) -> [String] {
    
    var output: [String] = []
    
    
    input.characters.count
    var startRange = input.index(input.startIndex, offsetBy: 0)
    var endIndex = input.index(startRange, offsetBy: 10)
    
    var rangeOfString = input.startIndex..<endIndex
    
    var testWindow = input[rangeOfString]
    
    
    
    
    return output
    
}

repeatedDNASequences(input: s)

//this ^
//
//18. 4 Sum
//Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array, which gives the sum of target.
//Note: The solution set must not contain duplicate quadruplets. For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0. Asolutionsetis:[ [-1, 0,0,1], [-2,-1,1,2], [-2, 0,0,2]]

var S = [1, 0, -1, 0, -2, 2]
var target = 0


func sum4(input: [Int], target: Int) -> [(Int, Int, Int, Int)] {
    
    var output: [(Int, Int, Int, Int)] = []
    

    for i in 0..<input.count {
        print(i)
        for k in 1..<input.count {
            print(k)
            for j in 2..<input.count {
                print(j)
                for l in 3..<input.count {
                    print(l)
                    
                        
                        if (input[i] + input[k] + input[j] + input[l]) == target {
                            
                            print("one")
                            
                            output.append((input[i], input[k], input[j], input[l]))
                        
                        
                    }
                }
            }
        }
        
        
    }
    
    
    //output = Array(Set(arrayLiteral: output))
    
    //output.filter { $0 == $1 && $2 == $3 && $3 == $0 }
    
    var outputClean: [(Int, Int, Int, Int)] = []
    
    for i in 0..<output.count {
        
        var testTuple = output[i]
        
        for j in 1..<output.count {
            
            if testTuple != output[j] {
                
                print("another")
                
                
            } else {
                
                outputClean.append(output[j])
            }
        }
    }
    
    output
    
    return outputClean
}

sum4(input: S, target: target)


//303. Range Sum Query - Immutable
//Given an integer array nums, find the sum of the elements between indices i and j (i ≤ j), inclusive.
//Example:
//Given nums = [-2, 0, 3, -5, 2, -1] sumRange(0, 2) -> 1 sumRange(2, 5) -> -1 sumRange(0, 5) -> -3
//Note:
//1. Youmayassumethatthearraydoesnotchange. 
//2. TherearemanycallstosumRangefunction.

var nums = [-2, 0, 3, -5, 2, -1]

func sumRange(i1: Int, i2: Int, nums: [Int]) -> Int {
    
    var output: Int = 0
    
    for i in i1...i2 {
        
        output += nums[i]
        
    }
    
    return output
}

sumRange(i1: 0, i2: 2, nums: nums)
sumRange(i1: 2, i2: 5, nums: nums)
sumRange(i1: 0, i2: 5, nums: nums)

var output = 0

func sumRangeRecursive(i1: Int, i2: Int, nums: [Int]) -> Int {
    
    
    print(nums[i1])
    
    if i1 == i2 {
        
        print("last one \(nums[i1]) \(i1)")
        return nums[i1] + output
    }
    
    output += nums[i1]
    print("here \(nums[i1])")
    
    return sumRangeRecursive(i1: i1 + 1, i2: i2, nums: nums)
}


sumRangeRecursive(i1: 0, i2: 2, nums: nums)
output = 0
sumRangeRecursive(i1: 2, i2: 5, nums: nums)
output = 0
sumRangeRecursive(i1: 0, i2: 5, nums: nums)

//72. Edit Distance
//Given two words word1 and word2, find the minimum number of steps required to convert word1 to word2. (each operation is counted as 1 step.)
//You have the following 3 operations permitted on a word:
//a) Insert a character b) Delete a character c) Replace a character

func editDistance(word1: String, word2: String) -> Int {
    
    var count = 0
    
    var firstWordCount = word1.characters.count
    var secondWordCount = word2.characters.count
    
    if firstWordCount == secondWordCount {
        
        for (idx, char) in word1.characters.enumerated() {
            
            if char == word2[word2.index(word2.startIndex, offsetBy: idx)] {
                
                print("yup")
                
            } else {
                
                print("replace")
                count += 1
            }
        }
        
    } else {
        
        for (idx, char) in word1.characters.enumerated() {
            
        }
        
    }
    
    
    
    return count
}

editDistance(word1: "foo", word2: "bar")

var arrayOfNums = [3, 5, 7, 2, 9, 10, 15, 4]

func insertion(key: Int, array: [Int]) {

    var arrayInsert = array
    
    for i in 0..<array.count {
        
        var x = array[i]
        var j = i
        
        while (j > 0) && (x < array[j - 1]) {
            
            arrayInsert[j] = array[j - 1]
            j -= 1
        }
        
    }
    
    
    print(arrayInsert)
    
}


insertion(key: 10, array: arrayOfNums)