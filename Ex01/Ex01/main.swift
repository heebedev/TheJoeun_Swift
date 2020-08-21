//
//  main.swift
//  Ex01
//
//  Created by ZZEUNG on 21/08/2020.
//  Copyright © 2020 ZZEUNG. All rights reserved.
//

import Foundation


//
//print("Input your decimal no:", terminator : "")
////readLine 은 optional 이므로 !를 같이 해줘야함 - 사용자가 숫자를 칠지 안칠지 어떻게 알아?
//var inpNum = Int(readLine()!)
//var repNum = 0
//
//func addF() {
//    print(repNum + 10)
//}
//
//if let _:Int = inpNum {
//    repNum = inpNum!
//    addF()
//}else {
//    print("Input value is wrong")
//}


//print("Input your decimal no:", terminator : "")
//var inpNum = (Int(readLine()!) ?? 0)
//for i in 0..<inpNum!*2 {
//    if i < inpNum! {
//        for j in 0..<i {
//            print("*", terminator: "")
//        }
//        print("")
//    } else {
//        for k in 0..<(inpNum!*2-i) {
//            print("*", terminator: "")
//        }
//        print("")
//    }
//}

//for i in 0...inpNum*2 {
//    if (i <= inpNum) {print(String(repeating: "*", count: i))}
//    else {print(String(repeating: "*", count: (inpNum*2-i)))}
//}

// 10의 10^0 ~ 10^10 까지의 제곱승을 구하라

//for i in 0..<11 {
//    print("10^", String.init(format: "%2d", i), " = ", String.init(format: "%11.0f", pow(10.0, Double(i))))
//}

//print("Input your decimal no:", terminator : "")
//var inpNum = (Int(readLine()!) ?? 0)
//
//var result:Int = 1
//for i in 1...inpNum {
//    result *= i
//}
//print("\(inpNum)'s factorial value = \(String.init(format: "%4d", result))")



//print("Enter an integer:", terminator : "")
//var inpNum:String = readLine() ?? ""
//var result:Int = 0;
//
//for char in inpNum {
//    result += Int(String(char)) ?? 0
//}
//print("Sum of digits = \(String.init(format: "%4d", result))")


//print("몇 개의 숫자를 더할까요? : ", terminator : "")
//var inpNum = (Int(readLine()!) ?? 0)
//print("\(inpNum)의 숫자를 입력하세요")
//var result = 0;
//
//for _ in 1...inpNum {
//    result += (Int(readLine()!) ?? 0)
//}
//
//print("입력한 숫자의 합은 \(result) 입니다.")



//print("몇 단계의 피라미드로 구성할까 ? : ", terminator : "")
//var inpNum = (Int(readLine()!) ?? 0)
//var count = 1
//
//for i in 1...inpNum {
//    for _ in 1...i {
//        print(String.init(format: "%2d", count), terminator:" ")
//        count += 1
//    }
//    print()
//
//}

print("Input score :")
var scores = Array<Int>(repeating: 0, count: 10)

for i in 1...10 {
    print("\(i)의 score :", terminator:"")
    let score = Int(readLine()!) ?? 0
    scores[score/10] += 1
}

print("---------- Histogram -----------")
for i in 0...9 {
    print("\(String.init(format: "%3d", ((9-i)*10))) : \(String(repeating: "#", count: scores[9-i]))")
}




