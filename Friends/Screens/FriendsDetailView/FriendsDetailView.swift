//
//  FriendsDetailView.swift
//  Friends
//
//  Created by Tashnik on 6/8/21.
//

import SwiftUI
import UIKit
import MessageUI

struct FriendsDetailView: View {
  
  var friend: Friend
  
  @State private var showSheet = false
  @State var showAlert = false
  @State var result: Result<MFMailComposeResult, Error>? = nil
  
  
  var body: some View {
    HStack() {
      FriendRemoteImage(urlString: friend.picture.large)
        .frame(width: 400, height: 400)
        .cornerRadius(12.0)
      
      VStack(spacing: 20) {
        Spacer()
        
        Spacer()
        
        Text(friend.name.title + " " + friend.name.first + " " + friend.name.last)
          .font(.title)
          .fontWeight(.bold)
        
        Text(friend.location.city)
          .font(.title2)
          .fontWeight(.semibold)
        
        Text(friend.location.state)
          .font(.title2)
          .fontWeight(.semibold)
        
        Text(friend.location.timezone.description)
          .font(.title2)
          .fontWeight(.semibold)
        
        Button {
          
          if MFMailComposeViewController.canSendMail() {
            self.showSheet.toggle()
          } else {
            self.showAlert.toggle()
            print("Error sending email")
          }
        } label: {
          Text(friend.email)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 330, height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
            .padding()
        }
        
        Text(friend.cell)
          .font(.title2)
          .fontWeight(.semibold)
        
        Spacer()
        
        Spacer()
      }
      .padding()
     
    }
    .sheet(isPresented: $showSheet) {
      MailView(result: self.$result, newSubject: "Friends App", newMsgBody: "Found you on the Friends App", email: friend.email)
    }
    .navigationBarTitle("Friend")
  }
}

struct FriendsDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FriendsDetailView(friend: Friend(gender: "", name: Name(title: "", first: "David", last: "Potashnik"), location: Location(city: "", state: "", timezone: Timezone(offset: "", description: "")), email: "davidpotashnik@yahoo.com", cell: "732-310-0690", picture: Picture(large: "", medium: "", thumbnail: "")))
  }
}
