//
//  NetworkManager.swift
//  Friends
//
//  Created by Tashnik on 6/8/21.
//

import UIKit


final class NetworkManager {
  
  static let shared = NetworkManager()
  private let cache = NSCache<NSString, UIImage>()
  
  static let baseURL = "https://randomuser.me/api/?"
  
  // Change amount of results to whatever you like
  private let friendsURL = baseURL + "results=15"
  
  private init() {}
  
  func getFriends(completed: @escaping (Result<[Friend], FRError>) -> Void) {
    
    guard let url = URL(string: friendsURL) else {
      completed(.failure(.invalidURL))
      return
    }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
      if let _ = error {
        completed(.failure(.unableToComplete))
        return
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completed(.failure(.invalidResponse))
        return
      }
      
      guard let data = data else  {
        completed(.failure(.invalidData))
        print("first data")
        return
      }
      
      do {
        let decoder = JSONDecoder()
        let decodedResponse = try decoder.decode(FriendResults.self, from: data)
        completed(.success(decodedResponse.results))
      } catch {
        completed(.failure(.invalidData))
      }
    }
    
    task.resume()
  }
  
  
  func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
    
    let cacheKey = NSString(string: urlString)
    
    if let image = cache.object(forKey: cacheKey) {
      completed(image)
      return
    }
    
    guard let url = URL(string: urlString) else {
      completed(nil)
      return
    }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
      
      guard let data = data, let image = UIImage(data: data) else {
        completed(nil)
        return
      }
      
      self.cache.setObject(image, forKey: cacheKey)
      completed(image)
    }
    
    task.resume()
  }
}
