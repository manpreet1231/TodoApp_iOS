//
//  todoItemCell.swift
//  TODO_App
//
//  Created by Tajamal on 15/03/2022.
//

import Foundation

import UIKit

class TodoInfoCell: UITableViewCell {

    @IBOutlet weak var lblTodoTittle: UILabel!
    @IBOutlet weak var lblTodoDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblTodoDetail.numberOfLines = 0
        lblTodoTittle.numberOfLines = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
