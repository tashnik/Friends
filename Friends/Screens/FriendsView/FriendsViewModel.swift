//
//  FriendsViewModel.swift
//  Friends
//
//  Created by Tashnik on 6/8/21.
//

import SwiftUI

final class FriendsViewModel: ObservableObject {
  
  @Published var friends: [Friend] = []
  @Published var alertItem: AlertItem?
  
  func getFriends() {
    
    NetworkManager.shared.getFriends { [self] result in
      DispatchQueue.main.async {
        
        switch result {
        case .success(let friends):
          self.friends = friends
          
        case .failure(let error):
          switch error {
          case .invalidURL:
            alertItem = AlertContext.invalidURL
            
          case .invalidResponse:
            alertItem = AlertContext.invalidResponse
            
          case .invalidData:
            alertItem = AlertContext.invalidData
            
          case .unableToComplete:
            alertItem = AlertContext.unableToComplete
          }
        }
      }
    }
  }
  
}
