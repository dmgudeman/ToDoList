//
//  ToDoObject.swift
//  ToDoList
//
//  Created by David Gudeman on 11/7/15.
//  Copyright (c) 2015 David Gudeman. All rights reserved.
//

import UIKit

class ToDoObject: NSObject {
   var iName = ""
  var iTime = ""
   var iFile = ""
   var iCheck = false
  
  init(iName: String, iTime: String, iFile: String, iCheck: Bool){
    self.iName = iName
    self.iTime = iTime
    self.iFile = iFile
    self.iCheck = iCheck
  }
}
