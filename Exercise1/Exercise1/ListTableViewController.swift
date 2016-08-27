//
//  ListTableViewController.swift
//  Exercise1
//
//  Created by 허진 on 2016. 8. 17..
//  Copyright © 2016년 Jin Her. All rights reserved.
//

import UIKit

protocol DetailDelegate {
    func setData(controller: ListTableViewController, title: String, image: UIImage)
}


class ListTableViewController: UITableViewController, AddDelegate {
    
    @IBOutlet var tabWord: UITableView!
    @IBOutlet weak var btnAdd: UIBarButtonItem!

    var items = ["berry", "pineapple", "watermelon"]
    var itemImages = [UIImage] ()//["berry.png", "pineapple.png", "watermelon.png" ]
    
    var delegate: DetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        btnAdd.title = "+"
        
        let image_berry = UIImage (named: "berry.png")
        itemImages.append(image_berry!)
        let image_pine = UIImage (named: "pineapple.png")
        itemImages.append(image_pine!)
        let image_watermelon = UIImage (named: "watermelon.png")
        itemImages.append(image_watermelon!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("wordCell", forIndexPath: indexPath)

        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = itemImages[indexPath.row]
        // Configure the cell...

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            items.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let itemToMove = items[fromIndexPath.row]
        
        let itemImageToMove = itemImages[fromIndexPath.row]
        
        items.removeAtIndex(fromIndexPath.row)
        itemImages.removeAtIndex(fromIndexPath.row)
        
        items.insert(itemToMove, atIndex: toIndexPath.row)
        itemImages.insert(itemImageToMove, atIndex: toIndexPath.row)

    }
 
    func didAddDone(controller: AddItemViewController, title: String, image: UIImage ) {
        items.append(title)
        itemImages.append(image)
    }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "sgAdd"
        {
            let addViewController = segue.destinationViewController as! AddItemViewController
        
            addViewController.delegate = self
        }
        else if segue.identifier == "sgDetail"
        {
            let detailViewController = segue.destinationViewController as! DetailViewController
        
            self.delegate = detailViewController
        
            //cell이 UITableViewCell형태 일때만
            let cell = sender as! UITableViewCell
            let idx = tableView.indexPathForCell(cell)
            
            delegate?.setData(self, title: items[(idx?.row)!], image: itemImages[(idx?.row)!])
            
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
