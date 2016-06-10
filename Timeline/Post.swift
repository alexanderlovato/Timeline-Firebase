//
//  Post.swift
//  Timeline
//
//  Created by Alexander Lovato on 6/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Post: Equatable {
    
    var imageEndPoint: String
    let caption: String?
    let username: String
    let comments: [Comment]
    let like: [Like]
    var identifier: String?
    
    init(imageEndPoint: String, caption: String? = nil, username: String = "", comments: [Comment] = [], like: [Like] = [], identifier: String? = nil) {
        
        self.imageEndPoint = imageEndPoint
        self.caption = caption
        self.username = username
        self.comments = comments
        self.like = like
        self.identifier = identifier
    }
    
}

func==(lhs: Post, rhs: Post) -> Bool {
    return lhs.username == rhs.username && lhs.identifier == rhs.identifier
}