//
//  ToDoObject.swift
//  ToDoList
//
//  Created by David Gudeman on 11/7/15.
//  Copyright (c) 2015 David Gudeman. All rights reserved.
//

import UIKit
import CoreData

class ToDoObject: NSManagedObject {
  @NSManaged var iName : String!
  @NSManaged var iTime : String!
  @NSManaged var iFile : String!
  @NSManaged var iCheck : NSNumber!
  
  
  
  }
