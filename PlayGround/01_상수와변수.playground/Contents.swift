import Cocoa

// ----------------------------------- //
// 작명 규칙
// ----------------------------------- //
/*
 - Lower Camel Case : function, method, variable, constant
    ex) studentName, studentAge, ...
 - Upper Carmel Case : type(class, struct, enum, extension, ...)
    ex) Student, Product
 - 대소문자 구분
 - 첫 글자 숫자로 시작 X
 */
// ----------------------------------- //
// Hello World 만들기
// ----------------------------------- //
let message = "Hello World!"
print(message)

// ----------------------------------- //
// 상수(let)과 변수(var)
// ----------------------------------- //
/*
 - 상수 : 한 번 선언된 값에 대해 변경이 불가능
 - 변수 : 한 번 선언된 값에 대해 변경 가능
 
 - 상수 선언 방법
    - Basic Method
        let <variable name> : <type> = <value>
 - 변수 선언 방법
    - Basic Method
        var <variable name> : <type> = <value>
    - 추론 방법 : 값이 명확한 경우
        car <variable name> = <value>
 */

let intLetNum1:Int = 200
let intLetNum2 = 100

var intVarNum1:Int = 200
var intVarNum2 = 100

//intLetNum1 = 2000
intVarNum1 = 2000
//intVarNum1 = 'abc'   - 한 번 선언된 변수 타입은 못바꾼다.

// ----------------------------------------- //
// Console Log
// ----------------------------------------- //
/*
 - print : 단순 문자열 출력
 - dump : Instance의 자세한 내용까지 출력
 */

print(intLetNum1)
print(intLetNum2)
print(intVarNum1)
print(intVarNum2)

dump(intLetNum1)
dump(intLetNum2)
dump(intVarNum1)
dump(intVarNum2)

// Class 생성
class Student {
    var name: String = "유비"
    var age: Int = 20
}

let student: Student = Student() //Instance생성

print(student)
print(student.name)
print(student.age)
dump(student)
dump(student.name)
dump(student.age)

// -------------------------------------------- //
// 문자열 보간법
// -------------------------------------------- //
/*
 - String Interporation
 - Program 실행중 문자열, 변수, 상수의 값을 표현하기 위해 사용
 */

let studentName = "홍길동"
print("Name :" + studentName)
print("Name :", studentName)
print("Name : \(studentName)")


let age:Int = 10
print("저는 \(age)살 입니다.")
print("저의 형은 \(age+4)살 입니다.")

// 상수 선언 후에 나중에 값 할당하기
// - 나중에 할당하려고 하는 상수나 변수는 타입을 꼭 명시해 주어야 한다.
let sum:Int
let inputA: Int = 100
let inputB: Int = 200

sum = inputA + inputB
print(sum)
// sum = 1

var nickName: String
nickName = "유비"
nickName = "관우"
print(nickName)

