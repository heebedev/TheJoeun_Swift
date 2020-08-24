import Cocoa

// Class
// 구조체는 값 타입인 반면 클래스는 참조 타입


class Sample {
    var sampleProperty: Int = 10
    let fixedSampleProperty: Int = 100
    static var typeProperty: Int = 100
    
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    // 재정의 부락 타입 메서드 - static
    
    static func typeMethod() {
        print("type method-static")
    }
    
    // 재정의 가능 타입 메서드 - class : 함수에 대한 타입....
    class func classMethod() {
        print("type method-class")
    }
}


// 인스턴스 생성
var samp: Sample = Sample()
samp.sampleProperty = 200
print(samp.sampleProperty)

let samp2: Sample = Sample()

samp2.sampleProperty = 500
print(samp2.sampleProperty)
print(samp.sampleProperty)

samp = samp2
print(samp2.sampleProperty)
print(samp.sampleProperty)

Sample.typeProperty = 300
print(Sample.typeProperty)

Sample.typeMethod()





// 학생 클래스

class Student{
    var name: String = "unknown"
    var `class`: String = "Swift"
    
    class func selfIntroduce() {  // 타입 메서드 -> 인스턴스 안만들고 쓸 수 있는 애들...
        print("학생 타입 입니다.")
    }
    
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name) 입니다.")
    }
    
}

// 타입 메서드 사용
Student.selfIntroduce()

// 인스턴스
var student: Student = Student()

student.name = "james"
student.class = "스위프트"
student.selfIntroduce()

let cathy: Student = Student()
cathy.name = "Cathy"
cathy.selfIntroduce()


// --------
// Class & Struct
// --------

struct Resolution  {
    var width = 0
    var height = 0
    
}


class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
}

let someResolution = Resolution() // 구조체 인스턴스
let someVideoMode = VideoMode() //클래스 인스턴스

print("The width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

print(someResolution.width)
//스트럭트는 call by value라서 아무 상관이 없다.


// 구조체의 멤버 초기화
let vga = Resolution(width: 640, height: 480)
var cinema = vga
print("cinema is now \(cinema.width) pixels")

