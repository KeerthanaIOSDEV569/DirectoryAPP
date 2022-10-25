//
//  PeopleDirectoryTableViewCell.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 25/10/22.
//

import UIKit

class PeopleDirectoryTableViewCell: UITableViewCell {
    ///Properties'
    
    @IBOutlet weak var favouratieColor: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var emailIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
