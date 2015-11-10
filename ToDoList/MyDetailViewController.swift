//
//  MyDetailViewController.swift
//  ToDoList
//
//  Created by David Gudeman on 10/26/15.
//  Copyright (c) 2015 David Gudeman. All rights reserved.
//

import UIKit

class MyDetailViewController: UIViewController {

  @IBOutlet var LabelItem: UILabel!
  @IBOutlet var LabelTime: UILabel!
  @IBOutlet var ImageItem: UIImageView!
  
//  var LabelItemText : String!
//  var LabelTimeText : String!
//  var LabelImageText : String!
  var toDoDetail: ToDoObject!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
//      self.LabelItem.text = self.LabelItemText
//      self.LabelTime.text = self.LabelTimeText
//      self.ImageItem.image = UIImage(named: self.LabelImageText)
      
        self.LabelItem.text = self.toDoDetail.iName
        self.LabelTime.text = self.toDoDetail.iTime
        self.ImageItem.image = UIImage(named: self.toDoDetail.iFile)
      
      navigationItem.title = toDoDetail.iName

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
