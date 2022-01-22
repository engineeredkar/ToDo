//
//  ToDoCell.swift
//  ToDo
//
//  Created by Edgar Karapetyan on 14.01.22.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    weak var delegate: ToDoCellDelegate?
    
    @IBAction func completeButtonTapped(_ sender: UIButton){
        delegate?.checkmarkTapped(sender: self)
    }

}
