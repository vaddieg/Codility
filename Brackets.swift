import Foundation

public func solution(_ S :  String) -> Int {
    var charStack = Array<Character>()
    let pair : Dictionary<Character, Character> = ["{" : "}", "[" : "]", "(" : ")",
                                                   "}" : "{", "]" : "[", ")" : "("]
    for ch in S.characters {
        switch ch {
        case "{", "(", "[" : charStack.append(ch)
        case "}", ")", "]" :
            if charStack.last == nil { return 0 }
            if pair[ch] != charStack.last! {
                return 0
            } else {
                charStack.removeLast()
            }
        default: return 0
        }
    }
    
    return charStack.isEmpty ? 1 : 0
}

public func test() {
    let sample1 = ("{[()()]}", 1)
    let sample2 = ("([)()]", 0)
    
    let charArray = Array(repeating: "(" as Character, count: 100_000)
    let charArray2 = Array(repeating: ")" as Character, count: 100_000)
    let array = charArray + charArray2
    let longStr = String(array)
    
    let sample3 = (longStr, 1)
    
    let samples = [sample1, sample2, sample3]
    for test in samples {
        if solution(test.0) != test.1 {
            print("Testcase error \(test)")
        } else {
            print("Testcase passed \(test)")
        }
    }
    
}
