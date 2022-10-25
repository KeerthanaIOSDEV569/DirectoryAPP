//
//  RoomAvailabilityTableViewCell.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 25/10/22.
//

import UIKit

class RoomAvailabilityTableViewCell: UITableViewCell {
    ///Properties
    @IBOutlet weak var maxOcuupencyLabel: UILabel!
    @IBOutlet weak var occupiedStatusLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
