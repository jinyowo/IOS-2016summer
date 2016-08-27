//
//  ViewController.swift
//  Exercise2
//
//  Created by 허진 on 2016. 8. 23..
//  Copyright © 2016년 Jin Her. All rights reserved.
//

import UIKit
import CoreData //db 사용하겟다고 선언

class ViewController: UIViewController {

    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).application(<#T##application: UIApplication##UIApplication#>, didFinishLaunchingWithOptions: <#T##[NSObject : AnyObject]?#>)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insert()
    {
        //wordlist 테이블에 삽입될 하나의 row를 만들어줌
        let wordObject = NSEntityDescription.insertNewObjectForEntityForName("WordList", inManagedObjectContext: context)
        
        //insert
        wordObject.setValue(datacount, forKey: "id")
        wordobject.setValue("title" + String(datacount), forKey: "title")
        //datacount = datacount + 1
        
    }
    
    func delete()
    {
    
    }
    
    func save()
    {
        do {
            try context.save()
        } catch {
            fatalError("Failure to save context : \(error)")
        }
    }
    
    func fetch()
    {
        let wordFetch = NSFetchRequest(entityName: "WordList")
        
        do {
            wordFetch.predicate = NSPredicate(format: "title == %@", "title")
            
            let fetchWordList = try context.executeFetchRequest(wordFetch) as! [WordList]
        
            datacount = fetchWordList.count
            
        }
    }
}

