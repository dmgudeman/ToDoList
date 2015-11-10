//
//  MyTableViewController.swift
//  
//
//  Created by David Gudeman on 9/30/15.
//
//

import UIKit

class MyTableViewController: UITableViewController, UISearchResultsUpdating{
  
    
  
//  var toDoItems = ["buy a clown mask", "buy a gun", "steal a car", "rob a bank"]
//  var toDoTimes = ["10:00 am", "11:00 am", "12:00 pm", "1:00 pm"]
//  var toDoImages = [ "ajax", "xjason", "jquery", "ajax"]
  
  var MyToDo = [
    ToDoObject(iName: "buy a clown mask", iTime: "10:00am", iFile: "ajax", iCheck: false),
   
    ToDoObject(iName: "steal a car", iTime: "12:00pm", iFile: "jquery", iCheck: false),
    ToDoObject(iName: "rob a bank", iTime: "1:00pm", iFile: "ajax", iCheck: false),
     ToDoObject(iName: "buy a gun", iTime: "11:00am", iFile: "xjason", iCheck: false)
  ]
  
  var searchController: UISearchController!
  var searchResults : [ToDoObject] = []
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
      
      self.searchController = UISearchController(searchResultsController: nil)
      self.searchController.searchBar.sizeToFit()
      self.searchController.hidesNavigationBarDuringPresentation = false;
      searchController.searchResultsUpdater = self
      searchController.dimsBackgroundDuringPresentation = false
    
      self.tableView.tableHeaderView = self.searchController.searchBar
  }

  override func viewDidAppear(animated: Bool) {
  self.tableView.reloadData()
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
      if searchController.active {
        return searchResults.count
      }
      else {
        return MyToDo.count
      }
    }

//  override func prefersStatusBarHidden() -> Bool {
//    return true
//  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath
    indexPath: NSIndexPath) -> UITableViewCell {
    let cellIdentifier = "ToDoCell"
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
      forIndexPath: indexPath) as! MyTableViewCell
      
    var todoItem : ToDoObject!
    if searchController.active {
      print("\([indexPath.row])")
      print(MyToDo[indexPath.row].iName)
      todoItem = searchResults[indexPath.row]
    }
    else {
      todoItem = MyToDo[indexPath.row]
    }
      cell.cellItemName?.text = MyToDo[indexPath.row].iName
      cell.cellItemType?.text = MyToDo[indexPath.row].iTime
    
      cell.accessoryType = todoItem.iCheck ? .Checkmark : .None
      
      // display rounded cells
      cell.cellImage?.frame = CGRect (x: 0.0, y: 0.0, width: 60, height: 60)
      cell.cellImage?.layer.cornerRadius =  cell.cellImage.frame.size.width/1.75
      cell.cellImage?.clipsToBounds = true
      cell.cellImage?.layer.masksToBounds = true
      cell.cellImage?.image = UIImage(named: MyToDo[indexPath.row].iFile)
      
    
      //Define the initial state of the cell before fade in
      cell.alpha = 0
      UIView.animateWithDuration(0.5, animations: {cell.alpha = 1})
    
      var rotationTransform: CATransform3D = CATransform3DIdentity
      rotationTransform = CATransform3DTranslate(rotationTransform, -500, 0, 0)
    
      cell.cellImage?.layer.transform = rotationTransform
    
      UIView.animateWithDuration(0.5, animations: { cell.cellImage.layer.transform = CATransform3DIdentity})

        return cell
    }
  
  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    var tdItem = (searchController.active) ? searchResults[indexPath.row] :
      MyToDo[indexPath.row]
    tdItem.iCheck = !(tdItem.iCheck)
    if (tdItem.iCheck)
    {
      self.tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .Checkmark
    }
    else
    {
       self.tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .None
      
    }
    self.tableView.deselectRowAtIndexPath(indexPath, animated : false)
  }

  
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
      if searchController.active {
        return false
      } else {
        return true
    }
  }

  
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
      MyToDo.removeAtIndex(indexPath.row)
      self.tableView.reloadData()
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
      if segue.identifier == "ShowItemDetail"
      {
        if let indPath = self.tableView.indexPathForSelectedRow()
        {
          let detailViewController = segue.destinationViewController as! MyDetailViewController
          
          if searchController.active {
            detailViewController.toDoDetail =
            searchResults[indPath.row]
          } else {
          detailViewController.toDoDetail = MyToDo[indPath.row]
          }
        }
      }
      else if (segue.identifier == "AddNewItem") {
        //var NewItem = ToDoObject.self
        var addViewController = segue.destinationViewController as!
          AddItemViewController
        addViewController.NewToDo = addData
        
      }
    }
  
  func addData(newItem: ToDoObject) {
    MyToDo.append(newItem)
    
  }
  func filterContentForSearchText(searchText: String) {
    searchResults = MyToDo.filter({(ToDoItem:ToDoObject) -> Bool in
      let nameMatch = ToDoItem.iName.rangeOfString(searchText, options:
        NSStringCompareOptions.CaseInsensitiveSearch)
      return nameMatch != nil
  })
  }

  func updateSearchResultsForSearchController(searchController:
    UISearchController) {
    if let searchText = searchController.searchBar.text {
      print("Search:Text ", searchText)
      filterContentForSearchText(searchText)
      tableView.reloadData()
      
    }
  }

}
