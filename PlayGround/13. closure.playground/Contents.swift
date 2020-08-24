import Cocoa

// Closure
// first-citizen(일급 시민)
// 변수, 상수 등으로 저장, 전달인자로 전달이 가능
// 함수는 이름이 있는 Closure

// Closure와 함수의 비교
// 함수

func sumFunction(a: Int, b: Int) -> Int {
    return (a+b)
}


var sumResult: Int = sumFunction(a: 10, b: 20)
print(sumResult)

// -----------
// closure
// 클라스 안에서 어럴트 같은거 만들 때 자주 쓰고.. 다른 곳에는 잘 안쓰인다....

var sumClosure: (Int, Int) -> Int = {(a:Int, b:Int) -> Int in
    return a+b
    
}

sumResult = sumClosure(10, 20)
print(sumResult)


// ----------
// closure와 함수 사용하기

let add:(Int, Int) -> Int = {(a:Int, b:Int) -> Int in
    return a + b
}

let subtract:(Int, Int) -> Int = {(a:Int, b:Int) -> Int in
    return a - b
}

let multiply:(Int, Int) -> Int = {(a:Int, b:Int) -> Int in
    return a * b
}

let divide:(Int, Int) -> Int = {(a:Int, b:Int) -> Int in
    return a / b
}

func calculate(a:Int, b:Int, method:(Int, Int) -> Int) -> Int{
    return method(a,b)
}

var calculated: Int, num1:Int = 60, num2:Int = 40

calculated = calculate(a: num1, b: num2, method:add)
print(calculated)



