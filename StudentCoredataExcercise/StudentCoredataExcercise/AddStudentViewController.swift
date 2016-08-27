//
//  AddStudentViewController.swift
//  StudentCoredataExcercise
//
//  Created by 허진 on 2016. 8. 23..
//  Copyright © 2016년 Jin Her. All rights reserved.
//

import UIKit
import CoreData

protocol AddDelegate {
    func didAddDone(controller:AddStudentViewController, id: Int32, name: String, email: String, regist: String)
}

class AddStudentViewController: UIViewController {

    @IBOutlet weak var studentId: UITextField!
    @IBOutlet weak var studentName: UITextField!
    @IBOutlet weak var studentEmail: UITextField!
    @IBOutlet weak var regist: UITextField!
    
    var delegate: AddDelegate?  //? : nil값 허용
    
    var idData: Int32?
    var nameData: String?
    var emailData: String?
    var registData: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNewStudent(sender: UIButton) {
        
        idData = Int32(studentId.text!)
        nameData = String(studentName.text!)
        emailData = String(studentEmail.text!)
        registData = String(regist.text!)
        
        if(delegate != nil)
        {
            delegate?.didAddDone(self, id: idData!, name: nameData!, email: emailData!, regist: registData!)
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
