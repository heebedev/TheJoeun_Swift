import Cocoa

/*
 Class
 - 전통적인 OOP 관점에서의 클래스
 - 단일 상속
 - 메소드
 - 프로퍼티
 - 참조 타입
 
 Struct
 - 다양한 형태로 사용 가능
 - 상속 불가
 - 메소드
 - 프로퍼티
 - 값 타입
 -> 연관된 값들을 모아서 하나의 데이터 타입으로 선언하고 싶을때
 -> 다른 객체 또는 함수 등으로 전달 될 때
 -> 참조가 아닌 복사를 원할 때
 -> 자신을 상속할 필요가 없거나 상속 받을 필요가 없을 때
 
 
 Enum
 - 상속 불가
 - 메소드
 - 프로퍼티
 - 값 타입
 - 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아 정리
 
 
 Value와 Reference
 - Value : Data값을 전달할 때 값을 복사하여 전달
 - Reference : Data 값을 전달할 때 값의 메모리 위치를 전달
 
 
 */


// Class, Struct 비교

struct ValueType {
    var property = 1
}

let firstStructInstance = ValueType()
var secondStructInstance = firstStructInstance
secondStructInstance.property = 2

print("first struct instance property : \(firstStructInstance.property)")
print("second struct instance property: \(secondStructInstance.property)")


class ReferenceType {
    var property = 1
}

let firstClassReference = ReferenceType()
var secondClassReference = firstClassReference
secondClassReference.property = 2

print("first class instance property : \(firstClassReference.property)")
print("second class instance property: \(secondClassReference.property)")
