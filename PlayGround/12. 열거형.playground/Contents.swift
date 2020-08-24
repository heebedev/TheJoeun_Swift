import Cocoa

// 12. 열거형

enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sum
}

var day: Weekday = Weekday.mon
print(day)
day = .tue
print(day)
