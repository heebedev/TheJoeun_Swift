import Cocoa

//โฝ๏ธ๐โพ๏ธ๐       โฝ๏ธ๐โพ๏ธ๐       โฝ๏ธ๐โพ๏ธ๐       โฝ๏ธ๐โพ๏ธ๐


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

// ํ๋ผ๋ฏธํฐ๊ฐ ์๋ ํจ์
func sayHelloWorld() -> String {
    return "Hello World!"
}


print(sayHelloWorld())

// ๋ณต์์ ํ๋ผ๋ฏธํฐ๋ฅผ ์ฌ์ฉํ๋ ํจ์
func greet1(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greet(person: person)
    } else {
        return "bye!"
    }
}

print(greet1(person: "Tim", alreadyGreeted: true))
print(greet1(person: "Tim", alreadyGreeted: false))



//์์ _ ๊ฐ ๋ค์ด๊ฐ๋ฉด ๋ณ์ ์ ์ธ์ name ์๋ณด์
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

// ๋ฐํ๊ฐ์ด ์๋ ํจ์
func printHello(name: String) -> Void {
    print("Hello, \(name)!")
}

printHello(name: "Tim")

//return์ ๋ฌด์
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

print(printAndCount(string: "Hello, World!"))
printAndCount(string: "Hello, World!")

func printWithoutCount(string: String) {
    _ = printAndCount(string: string)
}

//_๋ฅผ ์ฐ๋ฉด ๋ฉ๋ชจ๋ฆฌ๊ฐ ์ข์์ง๋ค..... ์ค๊น???
printWithoutCount(string: "Hello, World!")


// ๋งค๊ฐ๋ณ์ ๊ธฐ๋ณธ๊ฐ
func greeting(friend: String, me: String = "์กฐ์กฐ") {
    print("Hello \(friend)! I'm \(me)")
}


print(greeting(friend: "์ ๋น"))
print(greeting(friend: "์ ๋น", me: "๊ด์ฐ"))

func greeting2(friend: String="๋ํ", me: String="์กฐ์กฐ") {
    print("Hello \(friend)! I'm \(me)")
}

greeting2()

// ์ ๋ฌ์ธ์ ๋ ์ด๋ธ  (to ~ ๋ณ์๋ช ์์ ์ฐ๋๊ฑธ ๋ ์ด๋ธ์ด๋ผ๊ณ  ํ๋ค)
func greeting3(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}


greeting3(to: "๊ณต๋ช", from: "์ฌํฌ")


// ๊ฐ๋ณ ๋งค๊ฐ๋ณ์.  (...-> ๋ณต์์ ๊ฐ์ ๋ฐ๊ฒ๋ค.)
func sayHelloToFriends(me: String ,friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)"
}


print(sayHelloToFriends(me: "์ด์ ", friends: "์๊ฒฌ", "์์ฑ", "์ฅ์"))


// ๋ณต์์ ๊ฐ์ ๋ฐํํ๋ ํจ์
// ํํ์ ํจ์์ ๋ฐํ๊ฐ์ผ๋ก ์ฌ์ฉ

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




// Array์ค ์ต๋๊ฐ๊ณผ ์ต์๊ฐ์ ๊ตฌํ๋ค.

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
// ?? ํ๊ณ  default ๊ฐ์ ๋ฃ์ผ๋ฉด nil ๊ฐ์ด ๋ค์ด๊ฐ์ ๋ default ๊ฐ์ return ํ๋ค.
let bounds2 = minMax1(array: [])
print(bounds2)
// null ๊ฐ์ ๋ฐ์ผ๋ฉด nil while unwrapping error๊ฐ ๋ฌ๋ค.
//let bounds1 = minMax(array: [])
//print(bounds1)
let bounds3 = minMax2(array: [8, -6, 2, 109, 3, 71])
print(bounds3!.min, bounds3!.max)

let bounds4 = minMax2(array: [])
print(bounds4!.min, bounds4!.max)


// ์ซ์๋ค์ ์๋ ฅ ๋ฐ์ ํ๊ท ์ ๊ตฌํ๋ ํจ์ ๋ง๋ค๊ธฐ

func arithematicMean(_ keyined: Double...) -> Double {
    var avg : Double = 0
    for i in keyined {
        avg += i/(Double)(keyined.count)
    }
    return avg
}


print(arithematicMean(1,2,3,4,5))
print(arithematicMean(3,8.25,18.75))
