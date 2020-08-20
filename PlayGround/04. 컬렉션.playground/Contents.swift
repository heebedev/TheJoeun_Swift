import Cocoa


/*
 컬렉션 : 여러 값들을 묶어서 하나의 변수로 사용
 
 Array : 순서가 있는 리스트 컬렉션
 Dictionary : 키와 값의 쌍으로 이루어진 컬렉션

 Set : 순서가 없고 멤버가 유일한 컬렉션, 집합 연산
 */

//Array
//빈 Int Array 생성
var intVariable: Array<Int> = Array<Int>()

intVariable.append(1)
intVariable.append(10)
intVariable.append(100)

print(intVariable)
print(intVariable.contains(100))
print(intVariable.contains(99))

print(intVariable[0])

print(intVariable[0...1])

intVariable.remove(at: 0)

print(intVariable)

intVariable.removeLast()

print(intVariable)

intVariable.removeAll()
print(intVariable)

print("count of integers:", intVariable.count)
//print(intVariable[0])

// 여러가지 Array 선언 방법
// Array<Double> = [Double]
var doubleArray : Array<Double> = Array<Double>()
var doubleArray1 : Array<Double> = [Double]()
var doubleArray2: [Double] = [Double]()
var doubleArray3: [Double] = []

let intVariable1 = [1,2,3]
//intVariable1.removeAll()

var someInts = [Int]()
someInts.append(3)
someInts = []
print("someInts is of type [Int] with \(someInts.count) items")

// 기본값으로 설정된 배열 생성하기
var threeDoubles = Array(repeating: 0.0, count: 10)
print(threeDoubles)

var anotherDoubles = Array(repeating: 2.5, count: 10)
print(anotherDoubles)

var tenDoubles = threeDoubles + anotherDoubles
print(tenDoubles)

var stringVariable = Array(repeating: true, count: 10)
print(stringVariable)

//문자를 이용한 배열의 생성
var shoppingLists: [String] = ["Eggs", "Milk", "Apple", "Noodle"]
print(shoppingLists)

// 낱개로 출력하기

for i in shoppingLists {
    print(i)
}

for i in 0..<shoppingLists.count {
    print(shoppingLists[i])
}

for i in 0..<shoppingLists.endIndex {
    print(shoppingLists[i])
}

// shoppingList가 비어있는지 확인
// 비어있으면 The shopping list is empty.
// 아니면 The shopiing list is not empty.

if (shoppingLists.isEmpty) {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

// shoppingList에 knife 추가하기
shoppingLists.append("Knife")
print(shoppingLists)

shoppingLists += ["Baking Powder", "Banana"]
print(shoppingLists.count, shoppingLists)

print(shoppingLists[0])
print(shoppingLists[0...4])

shoppingLists[0...1] = ["AAA", "BBB"]
print(shoppingLists)

// 배열의 특정 위치 데이터 추가, 삭제, 변경
shoppingLists.insert("Maple Syrup", at: 0)
print(shoppingLists)

//0번 내용 지우기
shoppingLists.remove(at: 0)
print(shoppingLists)

//배열의 가장 끝의 내용 지우기

//배열의 값과 인덱스가 필요하다.
for (index, value) in shoppingLists.enumerated() {
    print("Item \(index+1) : \(value)")
}


// Dictionary
// key가 String이고 value가 String인 빈 Dictionary 생성
var stringDictionary: Dictionary<String, String> = [String:String]()
stringDictionary["name"] = "유비"
print(stringDictionary)

stringDictionary["name1"]  = "관우"
stringDictionary["name2"]  = "장비"
print(stringDictionary)
print(stringDictionary["name"]!)

//key가 String이고 Value가 Int인 빈 Dictionary 생성
// 유비 <- 100, 관우 <- 90, 장비 <- 80 넣고 출력

var stringDictionary1: Dictionary<String, Int> = [String:Int]()
stringDictionary1["유비"] = 100
stringDictionary1["관우"] = 90
stringDictionary1["장비"] = 80

print(stringDictionary1)

//key가 String이고 vlaue가 Any인 빈 Dictionary todtjd
// somekey <- "Value", anotherKey <- 100

var stringDictionary2: Dictionary<String, Any> = [String:Any]()
stringDictionary2["someKey"] = "Value"
stringDictionary2["anotherKey"] = 100

print(stringDictionary2)

//key에 해당하는 값 변경
stringDictionary2["someKey"] = "dictionary"
print(stringDictionary2)

// key에 해당하는 값 제거
stringDictionary2.removeValue(forKey: "anotherKey")
print(stringDictionary2)
stringDictionary2["someKey"] = nil
print(stringDictionary2)

// 간편한 Dictionary 생성
let emptyDictionary : [String:String] = [:]

// 초기값을 갖는 Dictionary 생성
let initializedDictionary : [String:String] = ["name":"James", "gender":"male"]
print(initializedDictionary)
let someValue : String = initializedDictionary["name"]!
print(someValue)

//빈 Dictionary 생성
var nameOfIntegers = [Int:String]()
print(nameOfIntegers.count, nameOfIntegers)

nameOfIntegers[16] = "sixteen"
print(nameOfIntegers.count, nameOfIntegers)

nameOfIntegers = [:]
print(nameOfIntegers.count, nameOfIntegers)

// 초기값이 있는 Dictionary
var airports:[String:String]=["YYZ":"Toronto Pearson", "DUB":"Dublin"]
print(airports.count, airports)

print(airports["YYZ"]!)

if airports.isEmpty{
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
print(airports.count, airports)

// Set : 집합 연산
let setA: Set<Int> = [1,2,3,4,5]
let setB: Set<Int> = [3,4,5,6,7]

print(setA.union(setB))

let unionSet = setA.union(setB)
print(unionSet.sorted())

print(setA.intersection(setB))

print(setA.subtracting(setB))

// Set의 멤버십과 동등 비교
let houseAnimals: Set = ["dog", "cat"]
let farmAnimals: Set = ["cow", "chicken", "sheep", "dog", "cat"]
let cityAnimals: Set = ["duck", "rabbit"]

print(houseAnimals.isSubset(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))
print(farmAnimals.isDisjoint(with: cityAnimals))

