//
//  NetworkManager.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/14/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation

// NetworkManager is class of type ParsedEntity which conforms to any ParsedEntity and NSObject protocol.Type ParsedEntity can be any type that adopts these protocol.
class NetworkManager<Parsed: ParsedEntity> :NSObject{// where parsed: ParsedEntity & NSObject
  typealias postCompleted = (_ response : Parsed) -> Void
  typealias failure = (Error) -> Void
  
  
  init(path:String,postString : String, httpMethod : String, postCompleted : @escaping (Parsed) -> Void, onFailure: @escaping failure) {
    
    let urlString = BaseUrl + path + postString
    print(urlString)
    var request = URLRequest(url: URL(string: urlString)!)
    request.httpMethod = httpMethod
    
    let session = URLSession.shared
    
    let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
      
      // check for any errors
      guard error == nil else {
        onFailure(error!)
        return
      }
      guard let responseData = data else {
        onFailure(error!)
        return
      }
      do {
        guard let parsedJson = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
          onFailure(error!)
          return
        }
        if let modelObject = Parsed(dictionary: parsedJson){
          postCompleted(modelObject)
        }
        
      } catch  {
        onFailure(error)
        return
      }
      
    })
    
    task.resume()
  }
  
}


