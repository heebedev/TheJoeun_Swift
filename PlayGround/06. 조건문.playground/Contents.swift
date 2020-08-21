import Cocoa

// if 조건문

let someInteger = 100

if someInteger == 100 {
    print("100점")
}

if (someInteger == 100) {
    print("100점")
}else{
    print("100점 아님.")
}

if someInteger < 100 {
    print("100점 미만")
} else if someInteger > 100 {
    print("100점 초과")
}else{
    print("100점")
}


var isCar = true
var isNew = true

if isCar, isNew {
    print("New Car")
}

isNew = false

if isCar, isNew {
    print("New Car")
} else{
    print("Old Car")
}


// Unwrapping if문 (정상적인 wrapping) - 입력되는 부분에 nil값이 들어오거나 할 때
let price: Double? = 5.99
if let p=price, p > 5.0 {
    print(p)
}

// Unwrapping if문 (강제 wrapping)
if price! > 5.0 {
    print(price!)
}


// Switch 조건문
let personAge = 14

switch personAge {
    case 0..<1 : print("baby")
    case 1..<3 : print("toddler")
    case 3..<5 : print("preshooler")
    case 5..<13 : print("gradeschooler")
    case 13..<18 : print("teen")
    default: print("adult")
}


let someCharacter: Character = "z"
switch someCharacter {
    case "a","A" :
        print("The first letter of the alphabet")
    case "z","Z" :
        print("The last letter of the alphabet")
    default:
        print("Some other character")
}


switch someInteger {
case 0:
    print("Zero")
case 1..<100:
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
default:
    print("Unknown")
}


switch "James" {
case "jake" :
    print("jake")
case "mina" :
    print("mina")
case "James", "james", "Bond", "bond" :
    print("I'm James Bond")
default :
    print("Unknown")
}

// Tuple로 Switch 사용하기
let somePoint = (1,1)
switch somePoint {
    case (0,0) :
        print("\(somePoint) is at the origin")
    case (_, 0) :
        print("\(somePoint) is at the x-axis.")
    case(0, _) :
        print("\(somePoint) is at the y-axis.")
    case(-2...2, -2...2):
        print("\(somePoint) is inside the box.")
    default :
        print("\(somePoint) is outside the box.")
}

// case에 where 조건 사용하기
let yetAnotherPoint = (1,-1)
switch yetAnotherPoint {
    case let(x,y) where x == y :
        print("\(x), \(y) is on the line x == y")
    case let(x,y) where x == -y :
        print("\(x), \(y) is on the line x == -y")
    case let(x,y):
        print("\(x), \(y) is just some arbitary point")
}

//switch yetAnotherPoint {
//    case (x,y) where x == y :
//        print("\(x), \(y) is on the line x == y")
//    case (x,y) where x == -y :
//        print("\(x), \(y) is on the line x == -y")
//    case (x,y):
//        print("\(x), \(y) is just some arbitary point")
//}
// 이러면 x,y가 입력값을 못받아온다...
