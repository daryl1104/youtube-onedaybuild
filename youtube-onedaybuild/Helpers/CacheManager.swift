//
//  CacheManager.swift
//  youtube-onedaybuild
//
//  Created by daryl on 2023/5/1.
//  Copyright © 2023 daryl. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
