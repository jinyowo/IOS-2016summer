//: Playground - noun: a place where people can play

import UIKit

//Function : 특정 작업을 수행하는 코드를 포함하는 덩어리
//Defining and Calling Functions(함수의 정의와 호출)

//Defining
func greet(person: String) -> String {          //func 함수이름(입력변수:타입)->출력변수타입
    let greeting = "Hello, " + person + "!"
    return greeting
}

//Calling
//print(greet(person: "Anna"))    //관련없는 문구라고 경고

print(greet("Anna"))            //"Hello, Anna!"

//좀더 짧은바디의 함수
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

print(greetAgain("Anna"))       //"Hello again, Anna!"

//Function Parameters and Return Values(함수 파라미터와 반환값)
//파라미터와 반환값은 유연해서, 단순한 함수부터 복잡한 함수까지 정의가능

//Without parameters
func sayHelloWorld() -> String {
    return "Hello, world"
}

print(sayHelloWorld())          //"Hello, World"

//With multiple parameters
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person)
    }
    else {
        return greet(person)
    }
}

//print (greet("Tim", alreadyGreeted: true))


//Without return values
func greet2(person: String) {
    print("Hello, \(person)!")
}
greet2("Dave")

//With multiple return values
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }
        else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax([8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//Parameter Names
//기본적으로 내부이름과 같은 외부이름을 가진다. 따로 지정해주려면 스페이스로 구분, 생략하려면 앞에 _ 붙임
func greet(hi person: String, _ hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(hi: "Bill", "Seoul"))

//디폴트값 지정
func someFunction(parameter: Int=12) {

}
//가변파라미터(지정된 타임에 따라 하나이상의 값을 가짐)
func countFunction(numbers: Double...){
    
}
countFunction(1, 2, 3, 4, 5)
countFunction(3, 8.25, 18.75)

//In-Out parameters
//func swapTwoInts(a: inout Int, b: inout Int)
func swapTwoInts(inout a: Int, inout b: Int) {
    let temp = a
    a = b
    b = temp
}

//사용할때는 &붙임
var first = 3;
var second = 107;

print(first, second)
swapTwoInts(&first, b: &second)
print(first, second)

//함수안에 함수를 넣을 수 있지만 해당함수안에서만 사용가능
func outFunction(backward: Bool) {
    func inFunction(input: Int) -> Int {
        return input+1
    }
}










