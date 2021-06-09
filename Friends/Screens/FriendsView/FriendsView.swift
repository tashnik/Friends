//
//  ContentView.swift
//  Friends
//
//  Created by Tashnik on 6/8/21.
//

import SwiftUI

struct FriendsView: View {
  
  @StateObject private var viewModel = FriendsViewModel()
  
  let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: columns) {
          ForEach(viewModel.friends) { friend in
            NavigationLink(
              destination: FriendsDetailView(friend: friend),
              label: {
                FriendProfileView(friend: friend)
              })
          }
          .padding()
        }
      }
      .alert(item: $viewModel.alertItem) { alertItem in
        Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
      }
      .navigationBarTitle("Friends")
      .navigationBarTitleDisplayMode(.inline)
    }
    
    .navigationViewStyle(StackNavigationViewStyle())
    .onAppear {
      viewModel.getFriends()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    FriendsView()
  }
}
