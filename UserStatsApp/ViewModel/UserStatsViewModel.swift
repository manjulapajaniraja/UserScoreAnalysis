//
//  UserStatsViewModel.swift
//  UserStatsApp
//
//  Created by Manjula Pajaniraja on 03/03/21.
//

import Foundation

class UserStatsViewModel {
    
    var userData = Bindable<Data>()
    let networkManager = NetworkManager()
  
    static let apiURL = "https://api.npoint.io/8b415189ae7017923fbd"
    
    func getUserDataForDisplay() {
        networkManager.getUserData(fromUrl: UserStatsViewModel.apiURL, completion: { result in
            switch result {
            case .success(let data):
                self.userData.value = data
            case .failure(_) :
                self.userData.value = nil
            }
        })
    }
}
