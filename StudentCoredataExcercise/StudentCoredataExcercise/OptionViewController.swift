//
//  OptionViewController.swift
//  StudentCoredataExcercise
//
//  Created by 허진 on 2016. 8. 23..
//  Copyright © 2016년 Jin Her. All rights reserved.
//

import UIKit
import CoreData

class OptionViewController: UIViewController, AddDelegate {

    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var studentArray = [Student] ()
    var idData: Int?
    var nameData: String?
    var emailData: String?
    var registData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetchData()
        
    }
    func fetchData() {
        //student table data load
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    func insert()
        
    {
        //table에 삽입될 하나의 row를 만들어주는 역할
        let studentObject = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: context)
        
        studentObject.setValue(idData, forKey: "id")
        studentObject.setValue(nameData, forKey: "name" )
        studentObject.setValue(emailData, forKey: "email")
        studentObject.setValue(registData, forKey: "regist_data")
    }
    
    func save()
    {
        
        do {
            
            try context.save()
            
        } catch {
            
            fatalError("Failure to save context: \(error)")
            
        }
    }
    
    func fetch()
    {

    }
    
    func didAddDone(controller:AddStudentViewController, id: Int32, name: String, email: String, regist: String) {
        idData = Int(id)
        nameData = name
        emailData = email
        registData = regist
        insert()
        save()
        fetch()

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "sgAdd"
        {
            let addViewController = segue.destinationViewController as! AddStudentViewController
            
            addViewController.delegate = self
        }
               // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}

