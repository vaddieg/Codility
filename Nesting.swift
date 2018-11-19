import Foundation

public func nesting(S : String) -> Int {
    // No need to use actual stack here
    var stackDepth = 0
    
    for ch in S.characters {
        if ch == "(" {
            stackDepth += 1
        } else if ch == ")" {
            stackDepth -= 1
        }
        if stackDepth < 0 {
            return 0
        }
    }
    return stackDepth == 0 ? 1 : 0
}

public func testNesting() {
    let t1 = ("((((", 0)
    let t2 = ("))))", 0)
    let t3 = ("(()()(()()))", 1)
    
    for test in [t1, t2, t3] {
        if nesting(S: test.0) != test.1 {
            print("Testcase failed \(test)")
        } else {
            print("Testcase passed \(test)")
        }
    }
}
