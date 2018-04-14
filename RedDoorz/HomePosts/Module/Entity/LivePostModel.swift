//
//  LivePostModel.swift
//  RedDoorz
//
//  Created by Praveen Singh on 13/04/18.
//  Copyright © 2018 Praveen Singh. All rights reserved.
//

import Foundation
import ObjectMapper


class LivePostModel: Mappable{
    internal var author: String?
    internal var title: String?
    internal var description: String?
    internal var url: String?
    internal var urlToImage: String?
    internal var publishedAt: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
    }
    
}
