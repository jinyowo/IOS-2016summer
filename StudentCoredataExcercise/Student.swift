//
//  Student.swift
//  StudentCoredataExcercise
//
//  Created by 허진 on 2016. 8. 23..
//  Copyright © 2016년 Jin Her. All rights reserved.
//

import Foundation
import CoreData


class Student: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    func insertStudent(id: String, name: String, email: String) -> Bool
    {
        //insert object 생성
        //set value id, name, email
        //set value registe date -> current date
        
    }
    
    func updateStudent(other: Student)
    
    func updateStudent
    
    //학번을 만들어줌
    func generateId() -> String
    {
        //학번만드는 규칙 : 입학년도 + 과코드 + 순번
        return ""
    }

}
