import Cocoa

let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names {
    print("Hello, \(name)!")
}

for (index, text) in names.enumerated() {
    print("The name at index \(index) is \(text)")
}


let minutes = 60
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}

// While
var integers = [1,2,3]
while integers.count > 1 {
    integers.removeLast()
    print(integers)
}

let price: [Double] = [1.99, 2.99, 3.99, 4.99, 5.99, 6.99, 7.99, 8.99, 9.99]
var total = 0.0
var i = 0
while i < price.count && price[i] < 7.0 {
    i += 1
    total += price[i]
    
}
print("Total: \(total), Counts: \(i)")

// String Formatter
print("Total:", String.init(format: "%.2f", total), "counts:", i)


// repeat
integers = [1,2,3]
repeat {
    print(integers)
    integers.removeLast()
} while integers.count > 0


// Label 구문
var startIndex1 = 0
let endIndex1 = 100
var sum1 = 0

gameLoop: while startIndex1 <= endIndex1 {
    startIndex1 += 1
    sum1 += startIndex1
    if sum1 >= 50 {
        break gameLoop
    }else{
        continue gameLoop
    }
}
print(sum1)
