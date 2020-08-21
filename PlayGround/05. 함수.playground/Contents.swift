import Cocoa

//⚽️🏀⚾️🏐       ⚽️🏀⚾️🏐       ⚽️🏀⚾️🏐       ⚽️🏀⚾️🏐


func integerSum(a: Int, b: Int) -> Int {
    return a+b
}

print(integerSum(a: 2, b: 4))


func greet(person: String) -> String {
    let greeting = "Hello, \(person)!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

// 파라미터가 없는 함수
func sayHelloWorld() -> String {
    return "Hello World!"
}


print(sayHelloWorld())

// 복수의 파라미터를 사용하는 함수
func greet1(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greet(person: person)
    } else {
        return "bye!"
    }
}

print(greet1(person: "Tim", alreadyGreeted: true))
print(greet1(person: "Tim", alreadyGreeted: false))



//앞에 _ 가 들어가면 변수 선언시 name 안보임
func buildAddress(_ name: String, address: String, city: String, zipCode postalCode: String, country:String? = "USA") -> String{
     
    return """
            \(name)
            \(address)
            \(city)
            \(postalCode)
            \(country ?? "")
           """
}

print(buildAddress("John Doe", address: "5 Covington Square", city: "Birmingham", zipCode: "01234"))

print(buildAddress("John Doe1", address: "5 Covington Square", city: "Birmingham", zipCode: "01234", country: "KOREA"))

print(buildAddress("John Doe1", address: "5 Covington Square", city: "Birmingham", zipCode: "01234", country: nil))

// 반환값이 없는 함수
func printHello(name: String) -> Void {
    print("Hello, \(name)!")
}

printHello(name: "Tim")

//return의 무시
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

print(printAndCount(string: "Hello, World!"))
printAndCount(string: "Hello, World!")

func printWithoutCount(string: String) {
    _ = printAndCount(string: string)
}

//_를 쓰면 메모리가 좋아진다..... 왤까???
printWithoutCount(string: "Hello, World!")


// 매개변수 기본값
func greeting(friend: String, me: String = "조조") {
    print("Hello \(friend)! I'm \(me)")
}


print(greeting(friend: "유비"))
print(greeting(friend: "유비", me: "관우"))

func greeting2(friend: String="동탁", me: String="조조") {
    print("Hello \(friend)! I'm \(me)")
}

greeting2()

// 전달인자 레이블  (to ~ 변수명 앞에 쓰는걸 레이블이라고 한다)
func greeting3(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}


greeting3(to: "공명", from: "여포")


// 가변 매개변수.  (...-> 복수의 값을 받겟다.)
func sayHelloToFriends(me: String ,friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)"
}


print(sayHelloToFriends(me: "초선", friends: "손견", "손책", "장양"))


// 복수의 값을 반환하는 함수
// 튜플을 함수의 반환값으로 사용

func getCountry() -> (dialCode: Int, isoCode: String, name: String) {
    let country = (dialCode: 82, isoCode: "KR", name: "Korea")
    return country
}

let ret = getCountry()

print(ret)

print(ret.dialCode)
print(ret.name)
print(ret.isoCode)

// Swapping Function
//
func swapValue(_ fstNum: Int, _ secNum: Int) -> (fstReturn: Int, secReturn: Int) {
    return (secNum, fstNum)
}

var a = 3
var b = 4
let (a1, b1) = swapValue(a,b)
a = a1
b = b1
print("\(a), \(b)")




// Array중 최대값과 최소값을 구한다.

func minMax(array: Array<Int>) -> (min: Int, max: Int) {
    return(array.min()!, array.max()!)
}

func minMax1(array: Array<Int>) -> (min: Int, max: Int) {
    return(array.min() ?? 0, array.max() ?? 0)
}

func minMax2(array: Array<Int>) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return (0,0)
    } else {
        return(array.min()!, array.max()!)
    }
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print(bounds.min, bounds.max)
// ?? 하고 default 값을 넣으면 nil 값이 들어갓을 때 default 값을 return 한다.
let bounds2 = minMax1(array: [])
print(bounds2)
// null 값을 받으면 nil while unwrapping error가 뜬다.
//let bounds1 = minMax(array: [])
//print(bounds1)
let bounds3 = minMax2(array: [8, -6, 2, 109, 3, 71])
print(bounds3!.min, bounds3!.max)

let bounds4 = minMax2(array: [])
print(bounds4!.min, bounds4!.max)


// 숫자들을 입력 받아 평균을 구하는 함수 만들기

func arithematicMean(_ keyined: Double...) -> Double {
    var avg : Double = 0
    for i in keyined {
        avg += i/(Double)(keyined.count)
    }
    return avg
}


print(arithematicMean(1,2,3,4,5))
print(arithematicMean(3,8.25,18.75))
