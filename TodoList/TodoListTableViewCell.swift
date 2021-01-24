//
//  TodoListTableViewCell.swift
//  TodoList
//
//  Created by 楊惠文 on 2020/12/10.
//  Copyright © 2020 楊惠文. All rights reserved.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    
    @IBOutlet var itemName: UILabel!
    @IBOutlet var checked:UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //  checked 的 完成事件
  
    
    

}
