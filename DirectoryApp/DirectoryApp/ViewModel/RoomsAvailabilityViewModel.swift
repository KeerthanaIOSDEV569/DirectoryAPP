//
//  RoomsAvailabilityViewModel.swift
//  DirectoryApp
//
//  Created by Siddu Lakshmi Keerthana on 23/10/22.
//

import Foundation
class RoomsAvailabilityViewModel{
    
    ///loadRoomData
    func loadRoomsList(completion: @escaping ([Rooms])  -> Void){
        try? APIClient.shared.loadRequest([Rooms].self, with: APIEndpoint.rooms) { response in
            completion(response)
            
        } failure: { errorData in
            print(errorData)
            
        }
    }
    
    /// setup/Manage UI data
    func setUpLocalization(vc:RommAvaiabilityViewController){
        vc.navigationItem.title = "Rooms Availability"
        
        
    }
}
