//
//  Friend.swift
//  Friends
//
//  Created by Tashnik on 6/8/21.
//

import Foundation


struct Coordinate: Decodable {
  let latitude: String
  let longitude: String
}

struct Timezone: Decodable {
  let offset: String
  let description: String
}
struct Name: Decodable {
  let title: String
  let first: String
  let last: String
}

struct Location: Decodable {
//  let street: String
  let city: String
  let state: String
//  let postcode: String
//  let coordinates: Coordinate
  let timezone: Timezone
}



struct Login: Decodable {
  let uuid: String
  let username: String
  let password: String
  let salt: String
  let md5: String
  let sha1: String
  let sha256: String
}

struct DateOfBirth: Decodable {
  let date: String
  let age: Int
}

struct Registered: Decodable {
  let date: String
  let age: Int
}

struct ID: Decodable {
  let name: String
  let value: String
}

struct Picture: Decodable {
  let large: String
  let medium: String
  let thumbnail: String
}

struct Friend: Decodable, Identifiable {
  
  let id = UUID()
  let gender: String
  let name: Name
  
  let location: Location

  let email: String
//  let login: Login
//  let dob: DateOfBirth
//  let registered: Registered
//  let phone: String
  let cell: String
//  let id: ID
  let picture: Picture
//  let nat: String
}

struct Info: Decodable {
  let seed: String
  let results: Int
  let page: Int
  let version: String
}


struct FriendResults: Decodable {
  let results: [Friend]
  let info: Info
}
