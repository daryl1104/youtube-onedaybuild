//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by daryl on 2023/4/26.
//  Copyright © 2023 daryl. All rights reserved.
//

import Foundation

class Model {
    func getVideos() {
        // create a URL object
        let url = URL(string: Constants.API_URL)
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            // check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            // parsing the data into video object
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            }catch{
                
            }
         
            
        }
        
        // Kick off the task
        dataTask.resume()
        
    }
}
