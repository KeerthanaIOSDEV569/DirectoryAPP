//
//  RommAvaiabilityViewController.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 23/10/22.
//

import UIKit

class RommAvaiabilityViewController: UIViewController {
    ///Properties
    @IBOutlet weak var roomTableView: UITableView!
    var viewModel = RoomsAvailabilityViewModel()
    var rooms = [Rooms]()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadRoomsList{ rooms in
            self.rooms = rooms
            self.roomTableView.reloadData()
        }
        viewModel.setUpLocalization(vc: self)
        roomTableView.register(UINib(nibName: "RoomAvailabilityTableViewCell", bundle: nil), forCellReuseIdentifier: "RoomAvailabilityTableViewCell")
    }
}
  
//Mark: UITableViewDelegate
extension RommAvaiabilityViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomAvailabilityTableViewCell") as? RoomAvailabilityTableViewCell
        cell?.maxOcuupencyLabel!.text = "maxOccupancy: "+"\(rooms[indexPath.row].maxOccupancy ?? 0)"
        if rooms[indexPath.row].isOccupied == true{
            cell?.occupiedStatusLabel.text = "Occupied"
            cell?.occupiedStatusLabel.textColor = UIColor.red

        }else{
            cell?.occupiedStatusLabel.text = "Book Now"
            cell?.occupiedStatusLabel.textColor = UIColor.green

        }

        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
}
