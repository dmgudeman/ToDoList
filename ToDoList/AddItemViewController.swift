//
//  AddItemViewController.swift
//  ToDoList
//
//  Created by David Gudeman on 11/9/15.
//  Copyright (c) 2015 David Gudeman. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

  @IBOutlet var AddName: UITextField!
  @IBOutlet var AddTime: UITextField!
  @IBOutlet var AddImageFile: UITextField!
  var NewToDo : (ToDoObject ->())!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

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
  @IBAction func ClickedCancel(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }

  @IBAction func ClickedSave(sender: AnyObject) {
//    self.NewToDo?.iName = self.AddName.text
//    self.NewToDo?.iTime = self.AddTime.text
//    self.NewToDo?.iFile = self.AddImageFile.text
//    self.NewToDo?.iCheck = false
    
    NewToDo(ToDoObject(iName: self.AddName.text, iTime: self.AddTime.text, iFile: self.AddImageFile.text, iCheck: false))
    
    self.dismissViewControllerAnimated(true, completion: nil )
  }
}
