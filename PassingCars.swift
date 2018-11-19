import Foundation

public func solution(_ A : [Int]) -> Int {
    var westCarsCount = A.reduce(0, {$0 + $1}) //just by counting 1s
    var pairsCount = 0;
    
    for car in A {
        if car == 0 {
            pairsCount += westCarsCount
        } else {
            westCarsCount -= 1
        }
        
        if pairsCount > 1_000_000_000 {
            return -1
        }
    }
    
    return pairsCount
}
