import Cocoa

// Optional
// - 값이 있을 수도 있고, 없을 수도 있음
// - nil을 포함할 수도 있고, 아닐 수도 있음.

var constantNum = 100
//constantNum = nil
let optionalConstant : Int! = nil
let optionalConstant2 : Int? = nil

var constantNum1: Int? = 100
print(constantNum1! + 10)
constantNum1 = nil
//print(constantNum1! + 1)

switch constantNum1 {
case .none:
    print("The optional variable is null")
case .some (let value):
    print("Value is \(value)")
}


var myName: String? = nil
// 정상적으로 nil 체크하는 방법...
if let name: String = myName {
    print(name)
} else {
    print("nil")
}
