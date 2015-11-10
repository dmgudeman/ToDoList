//
//  MyTableViewCell.swift
//  ToDoList
//
//  Created by David Gudeman on 10/14/15.
//  Copyright (c) 2015 David Gudeman. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

  @IBOutlet var cellImage: UIImageView!
  @IBOutlet var cellItemName: UILabel!
  @IBOutlet var cellItemType: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
