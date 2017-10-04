//
//  FetchPlaces.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/14/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation

final class FetchPlaces: NetworkManager<GoogleSearchResults> {
  init(postString: String,parseHandler: @escaping (GoogleSearchResults) -> Void,failure: @escaping (Error) -> Void) {

   super.init(path: Path.googleNearbySearchPath, postString: postString, httpMethod: Method.post.rawValue, postCompleted: parseHandler, onFailure: failure)
    
  }
  
  
}





