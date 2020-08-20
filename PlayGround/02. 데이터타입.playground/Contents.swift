import Cocoa

// ------------------------------------- //
// 내 PC의 OS 크기 확인
// ------------------------------------- //

print("Int   :" + String(Int.min) + " ~ " + String(Int.max))
print("Int8   :" + String(Int8.min) + " ~ " + String(Int8.max))
print("Int16   :" + String(Int16.min) + " ~ " + String(Int16.max))
print("Int32   :" + String(Int32.min) + " ~ " + String(Int32.max))
print("Int64   :" + String(Int64.min) + " ~ " + String(Int64.max))

// ------------------------------------- //
// 기본 데이터 타입
// ------------------------------------- //
/*
 Swift의 기본 데이터 타입
 Bool, Int, UInt, Float, Double, Character, String
 */

// Bool
var someBool : Bool = true
someBool = false
//someBool = 0

// Int
var someInt : Int = -100
someInt = Int(100.1)
someInt = 100_000
someInt = 100_00_00
print(someInt)

// UInt
var someUInt: UInt = 100
// someUInt = -100
// someUInt = someInt


// Float
var someFloat: Float = 3.14
someFloat = 3
someFloat = 10_000.44_556

// Double
var someDouble: Double = 3.14
someDouble = 3
someDouble = 10_000.44_556
someDouble = Double(someFloat)

print("Printing \(type(of: someDouble)) : \(someDouble)")

// 숫자 Type 변환
let doubleNum = 4.999999
var castToInt = Int(doubleNum)
var roundToInt = Int(doubleNum.rounded())
print("Origin :", doubleNum, "After Cast:", castToInt, "After Rounded", roundToInt)

// Character
var someCharacter : Character = "🐶"
print(someCharacter)
someCharacter = "가"
someCharacter = "A"
//someCharacter = "하하하하"

// String
var someString : String = "하하하 😄"
someString += " 웃으면 복이와요"
print(someString)
//someString = someCharacter
someString = """
    fjsaljfl;dsdflasjf
    sfjklasl;fjlsdfjdls
    adfsjalsfjl
"""
print(someString)
//someString = """aaa"""
someString = """
    aaa
"""
print(someString)

// 문자열과 특수문자
// \t, \n, \r, \", \'
print("aa\tbb\tcc")
let wiseWords = "\"Imageination is more important than knowledge\"~ Einstein"
print(wiseWords)


// 유니코드
// 전 세계의 모든 문자를 컴퓨터에서 일관되게 표현하고 다룰 수 있도록 설계된 국제 표준어
let dollaSign = "\u{24}"
print(dollaSign)
let blackHeart = "\u{2665}"
print(blackHeart)
print("\u{AE40} \u{C2B9} \u{D76C}")

// 빈 문자열 초기화
var emptyString  = ""
var anotherEptyString = String()

// 빈 문자열 확인
if emptyString.isEmpty {
    print("Nothing to see here")
}

// 문자열 수정
var variableString = "Horse"
variableString += " and carriage"
print(variableString)

// 문자열이 개별 문자를 출력
for character in variableString {
    print(character)
}

// 문자 상수 선언
let exclamationMark: Character = "!"

// 문자 배열을 이용한 문자열 출력
let catCharacters : [Character] = ["C", "a", "t", "!", "!"]
let catString = String(catCharacters)
let catString1 : String = String(catCharacters)
print(catString, catString1)

// 문장려과 문자의 결합
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
print(welcome)

print(welcome + "!")
let exclamationMark1 : Character = "!"
welcome.append(exclamationMark1)
print(welcome)


// ----
let multiplier = 3

print(multiplier)

var num : Double = 2.5

print("\(multiplier) times \(num) is \(Double(multiplier) * num)")


// 문자 길이
let str = "12345,6789"
print("str has \(str.count) characters.")

// 문자열 인덱스
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy:7)
greeting[index]

// 문자열의 개별 문자 접근
for index in greeting {
    print(index)
}

for index in greeting.indices {
    print("\(greeting[index])", terminator:",")
}

// 문자의 삽입과 삭제
var welcome1 = "hello"
welcome1.insert("!", at : welcome1.endIndex)
print(welcome1)

welcome1.insert(contentsOf: " there", at : welcome1.index(before: welcome1.endIndex))
print(welcome1)

welcome1.remove(at: welcome1.index(before: welcome1.endIndex))
print(welcome1)

let range = welcome1.index(welcome1.endIndex, offsetBy: -6)..<welcome1.endIndex

welcome1.removeSubrange(range)
print(welcome1)


//부분 문자열
let greeting1 = "Hello, World!"
let index1 = greeting1.firstIndex(of: ",") ?? greeting1.endIndex
// ?? - Optional - 쉼표를 만나면 쉼표의 인덱스를 가져가고, 그게 없으면 endIndex를 가져온다.
let beginning = greeting1[..<index1]
// ..< 작은것 전부 : 일종의 for 문
print(beginning)


// 접두사와 접미사
let romeoAndJuliet = [
    "Act 1 Scene 1 : Verona, A public place",
    "Act 1 Scene 2 : Capulet's mansion",
    "Act 1 Scene 3 : A room is Capulet's mansion",
    "Act 1 Scene 4 : A street outside Capulet's mansion",
    "Act 1 Scene 5 : The Great Hall in Capulet's mansion",
    "Act 2 Scene 1 : Outside Capulet's mansion",
    "Act 2 Scene 2 : Capulet's orchard",
    "Act 2 Scene 3 : Outside Friar Lawrence's cell",
    "Act 2 Scene 4 : A street in Verona",
    "Act 2 Scene 5 : Capulet's mansion",
    "Act 2 Scene 6 : Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}

print("There are \(act1SceneCount) scenes in Act 1.")

// 문자열중 끝 부분이 Capulet's mansion의 갯수와 Friar Lowrence's cell 의 갯수를 출력

var capulets = 0
var lowrence = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        capulets += 1
    }
    if scene.hasSuffix("Friar Lawrence's cell") {
        lowrence += 1
    }
}

print("\(capulets) mansion scenes; \(lowrence) cell scenes")


//Any, AnyObject, nil
/*
 Any : Swift의 모든 타입ㅇ르 지칭하는 키워드
 nil : null
 */

// Any
var someAny: Any = 100
someAny = "어떤 타입도 수용 가능합니다."
print(someAny)
// 메모리를 많이 차지한다. 이것저것 수용해야 하니까..

someAny = 123.12
print(someAny)

//let someDouble: Double = someAny
//let someDouble: Double = (Double) someAny
//이렇게 쓸 수 없다... 뭐든 들어가지만 타입은 AnyType 이다.

let someAny1 : Double = someAny as! Double
//! - optional null 값을 미리 방지시키는... null을 허용하는 곳에만 null을 넣겟다.
// ios에서는 any를 많이 쓴다... = !를 쓸 일이 많다...   (java를 배우고 Android를 하듯 swift를 배우고 ios framework를 한다)

// nil
/*
 - nil은 없음을 의미하는 키워드
 - 다른 언어의 NULL, Null, NaN, NA 등과 유사한 표현
 */

//someAny1 = nil

//Tuple
//Tuple 사용 전
var dialCode = 82
var isoCode = "KR"
var name = "Korea"

print(dialCode, isoCode, name)

//Tuple의 사용
var country = (82, "KR", "Korea")
print(country.0, country.1, country.2)

var country1 = (dialCode1: 82, isoCode1:"KR", name1:"Korea")
print(country1.dialCode1)
print(type(of:country1))

/*
    person <- John Doe, 201 Main Street, 35
    John Doe lives at 201 Main Street and is 35 years old.
 
 
 */

var person = (name: "John Doe", address:"201 Main Street", age:35)
print("\(person.name) lives at \(person.address) and is \(person.age) years old.")
