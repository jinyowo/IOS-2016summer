//
//  DetailViewController.swift
//  Exercise1
//
//  Created by 허진 on 2016. 8. 23..
//  Copyright © 2016년 Jin Her. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailDelegate {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    //외부에서 호출할지도 모르는함수에는 컨트롤관련된 아울렛변수를 그대로 사용하면 안됨
    var dataTitle: String?
    var dataImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.x
        lblTitle.text = dataTitle
        imgView.image = dataImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setData(controller: ListTableViewController, title: String, image: UIImage)
    {
        dataTitle = title
        dataImage = image
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
