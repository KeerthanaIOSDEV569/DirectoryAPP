//
//  PeopleDirectoryViewModel.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 23/10/22.
//

import Foundation

class PeopleDirectoryViewModel{
    
    ///loadPeopleData
    func loadPeopleList(completion: @escaping ([People])  -> Void){
        try? APIClient.shared.loadRequest([People].self, with: APIEndpoint.people) { response in
            completion(response)
        } failure: { errorData in
            print(errorData)
        }

    }
    /// setup/Manage UI data
    func setUpLocalization(vc:PeopleDirectoryViewController){
        vc.navigationItem.title = "Directory"

    }
    
}
