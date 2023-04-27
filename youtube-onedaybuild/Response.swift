//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by daryl on 2023/4/27.
//  Copyright © 2023 daryl. All rights reserved.
//

import Foundation
struct Response: Decodable {
    var items: [Video]?
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decode([Video].self, forKey: .items)
        
    }
}
