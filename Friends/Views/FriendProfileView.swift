//
//  FriendProfileView.swift
//  Friends
//
//  Created by Tashnik on 6/8/21.
//

import SwiftUI

struct FriendProfileView: View {
  
  var friend: Friend
  
  var body: some View {
    
    ZStack {
      Color(.systemBlue)
      
      VStack {
        Text(friend.name.title + " " + friend.name.first + " " + friend.name.last)
          .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .foregroundColor(.white)
          .padding(.top, 10)
       
        FriendRemoteImage(urlString: friend.picture.medium)
          .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
          .cornerRadius(12.0)
        
        Text(friend.location.timezone.description)
          .font(.title2)
          .fontWeight(.semibold)
          .foregroundColor(.white)
          .padding()
      }
    }
  }
}

//struct FriendProfileView_Previews: PreviewProvider {
//  static var previews: some View {
//    FriendProfileView(friend: Friend(gender: "male", name: Name(title: "", first: "Randy", last: "Watson"), timezone: Timezone(offset: "", description: "Canada"), picture: Picture(large: "", medium: "", thumbnail: "")))
//      .previewLayout(.sizeThatFits)
//  }
//}
