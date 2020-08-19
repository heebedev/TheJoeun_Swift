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
