import UIKit

func evenNumber(number: Int) -> Int{
    number % 2 == 0 ? print("Ваше число четное") : print("Ваше число не четное")
    return number
}

evenNumber(number: 6)

func threeNumber(number: Int) -> Int{
    number % 3 == 0 ? print("Ваше число делится на три без остатка") : print("Ваше число не делится на три")
    return number
}

threeNumber(number: 10)

    var array: Array<Int> = []
    for i in stride(from: 0, through: 100, by: 1){
        array.append(i)
    }
    print(array)

var toDelete = array.filter{$0 % 2 != 0 && $0 % 3 == 0}
print(toDelete)

func fibonacciArray(_ n: Int) -> [Double] {
    var fibonacci: [Double] = [1, 1]
    (2...n).forEach{ i in
        fibonacci.append(fibonacci[i - 1] + fibonacci[i - 2])
    }
    return fibonacci
}
print(fibonacciArray(100))

func primeNumbers(arrayPassed: [Int]) -> [Int] {
    var primes: [Int] = []
    var newArr = arrayPassed
    while let newP = newArr.first {
        primes.append(newP)
        newArr = newArr.filter { $0 % newP != 0 }
    }
    return primes
}
print(primeNumbers(arrayPassed: Array(2...100)))
