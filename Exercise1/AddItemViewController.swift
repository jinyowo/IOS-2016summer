//
//  AddItemViewController.swift
//  Exercise1
//
//  Created by 허진 on 2016. 8. 22..
//  Copyright © 2016년 Jin Her. All rights reserved.
//

import UIKit
import MobileCoreServices //아이폰 기본앱의 기능들

//delegate프로토콜(약속), 함수정의만가능
protocol AddDelegate {
    func didAddDone(controller:AddItemViewController, title: String, image: UIImage)
}

class AddItemViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var wordName: UITextField!
    
    var captureImg : UIImage!
    var flagImageSave = false
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var delegate: AddDelegate?  //? : nil값 허용
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLoad(sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary)) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .PhotoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            presentViewController(imagePicker, animated: true, completion: nil)
        }

    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        
        if mediaType.isEqualToString(kUTTypeImage as NSString as String) {
            captureImg = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImg, self, nil, nil)
            }
            
            imgView.image = captureImg
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addWord(sender: UIButton) {
        if(delegate != nil)
        {
            delegate?.didAddDone(self, title: wordName.text!,image: captureImg! )
        }
        wordName.text=""
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
