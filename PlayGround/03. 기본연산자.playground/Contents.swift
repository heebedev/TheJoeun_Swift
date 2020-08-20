import Cocoa

var a = 2

//튜플을 사용한 할당 연산자
let(x1, y1) = (1, 2)
print(x1, y1)

var(x2, y2) = (3, "kim")
print(x2, y2)

// 사칙 연산자
print(10 / 3)
print(10.0 / 3.0)
print(9 % 4)

// 단항 음수 연산자
let one = 1
let minusOne = -one
let plusOne = -minusOne
print(one, minusOne, plusOne)


// 비교 연산자
1 == 1

let name = "world"
if (name == "world") {
    print("Hello World")
}else {
    print("I'm sorry \(name), but ....")
}

(1,"zebra") < (2,"apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")
("bird", -1) < ("purple", 1)
//("blue", false) < ("purple", true)

// 일반 조건 연산자
let contentHeight = 40
let hasHeader = true
let rowHeight : Int

if hasHeader {
    rowHeight = contentHeight + 50
} else {
    rowHeight = contentHeight + 20
}

print(rowHeight)


// 삼항 조건 연산자
let contentHeight1 = 40
let hasHeader1 = true
let rowHeight1 = contentHeight1 + (hasHeader ? 50 : 20)

print(rowHeight1)


// Nil 병합 연산자
let defaultColorName = "red"
var userDefinedColorName : String? // 값은 nil --> Optional 변수
var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName

// 범위 연산자
for i in 1...10 {
    print(i)
}

// 1부터 10까지 합계를 구하시오
var sum = 0
for i in 1...10 {
    sum += i
}

print("1 ~ 10의 합계는 \(sum) 입니다.")


// 1 X 5 = 5
// ...
// 5 X 5 = 25

for i in 1...5 {
    print("\(i) X 5 = \(i * 5)")
}


// 반 닫힌 연산자
for i in 1..<10 {
    print("\(i) X 5 = \(i * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count

for i in 0..<count {
    print("Person \(i+1) is called \(names[i])")
}


let a1 = [-1, -2, -3, 0, 1, 2, 3]
let b1 = a1[2...]
print(b1)

// 단방향 범위

for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

let range = ...5
range.contains(7)
range.contains(2)

// 논리 연산자

// 논리 부정 연산자
let allowedEntry = false
if !allowedEntry {
    print("Access Denied")
}

// 논리곱 연산자
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("Access Denied!")
}

// 논리합 연산자
let hasDoorKey = false
let knowsOverridePassword = true

if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("Access Denied!")
}
