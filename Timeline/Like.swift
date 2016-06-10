//
//  Like.swift
//  Timeline
//
//  Created by Alexander Lovato on 6/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Like: Equatable {
    
    let username: String
    let postIdentifier: String
    var identifier: String?
    
    init(username: String, postIdentifier: String, identifier: String? = nil) {
        self.username = username
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
    
}

func==(lhs: Like, rhs: Like) -> Bool {
    return lhs.username == rhs.username && lhs.identifier == rhs.identifier
}