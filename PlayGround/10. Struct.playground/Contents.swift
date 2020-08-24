import Cocoa

//10. Struct

// 구조체
// 구조체는 Swift에서 Type을 정의한다.

// Property & Method

struct Sample{
    var sampleProperty: Int = 10 // 가변 property
    let fixedSampleProperty : Int = 100 // 불변 property
    static var typeProperty: Int = 1000 // 타입 property
    

    func instanceMethod() {
        print("instance method")
    }
    
    static func typeMethod() {
        print("type method")
    }
}


//타입 프로퍼티 및 메서드
var samp: Sample = Sample()
print(samp.sampleProperty)
samp.sampleProperty = 100
print(samp.sampleProperty)

print(samp.fixedSampleProperty)
//samp.fixedSampleProperty = 1000   -> let 이라서 값을 못 바꾼다.


Sample.typeProperty = 300   // static은 인스턴스 없이 바로 쓸 수 있다.
print(Sample.typeProperty)
Sample.typeMethod()
samp.instanceMethod()


// 학생 구조체
struct Student{
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    static func selfIntroduce() { //타입 메서드
        print("학생 타입 입니다.")
    }
    
    func selfIntroduce() {
        print("저는 \(`class`)반 \(name) 입니다.")
    }
}


// 학생 구조체 사용
Student.selfIntroduce()

//가변 인스턴스 사용
var student: Student = Student()
student.name = "James"
student.class = "스위프트"
student.selfIntroduce()

