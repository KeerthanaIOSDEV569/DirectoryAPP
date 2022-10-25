//
//  MainDirectoryViewController.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 23/10/22.
//

import UIKit

class PeopleDirectoryViewController: UIViewController {
    ///Properties
    @IBOutlet weak var peopleTableView: UITableView!
    @IBOutlet weak var popUpBGView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpAvatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    var people = [People]()
    var viewModel = PeopleDirectoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadPeopleList { people in
            self.people = people
            self.peopleTableView.reloadData()
            
        }
        viewModel.setUpLocalization(vc: self)
        peopleTableView.register(UINib(nibName: "PeopleDirectoryTableViewCell", bundle: nil), forCellReuseIdentifier: "PeopleDirectoryTableViewCell")
        popUpBGView.isHidden = true
        
    }
    
    @IBAction func CloseAction(_ sender: Any) {
        popUpBGView.isHidden = true
    }
    
}
//Mark: UITableViewDelegate
extension PeopleDirectoryViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleDirectoryTableViewCell") as! PeopleDirectoryTableViewCell
        let url = URL(string: people[indexPath.row].avatar)!
        // Fetch Image Data
        if let data = try? Data(contentsOf: url) {
            // Create Image and Update Image View
            cell.avatarImageView.image = UIImage(data: data)
        }
        
        cell.nameLabel.text = people[indexPath.row].firstName+" "+people[indexPath.row].firstName
        cell.designationLabel.text =  people[indexPath.row].jobtitle
        cell.emailIDLabel.text = people[indexPath.row].email
        cell.favouratieColor.backgroundColor = UIColor(named: people[indexPath.row].favouriteColor)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        popUpBGView.isHidden = false
        let url = URL(string: people[indexPath.row].avatar)!
        // Fetch Image Data
        if let data = try? Data(contentsOf: url) {
            // Create Image and Update Image View
            popUpAvatarImageView.image =  UIImage(data: data)
        }
        nameLabel.text = people[indexPath.row].firstName+" "+people[indexPath.row].firstName
        jobTitleLabel.text = people[indexPath.row].jobtitle
        mailLabel.text = people[indexPath.row].email
        createdLabel.text =  "Created At: "+people[indexPath.row].createdAt
        colorLabel.text = "Favourite Color: "+people[indexPath.row].favouriteColor
    }
    
    
}
