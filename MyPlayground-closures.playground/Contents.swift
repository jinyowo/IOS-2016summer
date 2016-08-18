//: Playground - noun: a place where people can play

import UIKit
//Closures(클로저)
//스스로를 포함하는 함수블럭. C언어의 block, 다른언어의 lambda와 비슷
//클로저 표현은 깔끔하며, 명확한 스타일이고, 최적화하는데 도움을 주고, 공통 시나리오에서 혼란스럽지 않게 해줌

//Closure Expression Syntax(클로저표현식 문법)
//{ (parameters) -> return type in statements }
let names = ["C", "A", "E", "B", "D"]
var reversedNames = names.sort({(s1:String, s2:String)->Bool in return s1>s2})

reversedNames = names.sort( { (s1: String, s2: String) -> Bool in return s1 > s2 } )
reversedNames = names.sort( { s1, s2 in return s1 > s2 } )
reversedNames = names.sort( { s1, s2 in s1 > s2 } )

