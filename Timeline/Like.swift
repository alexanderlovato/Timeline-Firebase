//
//  Like.swift
//  Timeline
//
//  Created by Alexander Lovato on 6/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Like: Equatable, FirebaseType {
    
    //MARK: Constants
    
    static let kEndpoint = "likes"
    private let kUsername = "username"
    private let kPostIdentifier = "postIdentifier"
    
    //MARK: Properties
    
    let username: String
    let postIdentifier: String
    
    //MARK: Firebase Type
    
    var identifier: String?
    var endpoint: String {
        return Like.kEndpoint
    }
    
    var jsonValue: [String : AnyObject] {
        var jsonRepresentation = [String : AnyObject]()
        
        jsonRepresentation = [kUsername : username, kPostIdentifier : postIdentifier]
        
        
        return jsonRepresentation
    }
    
    init?(dictionary: [String : AnyObject], identifier: String) {
        guard let username = dictionary[kUsername] as? String, postIdentifier = dictionary[kPostIdentifier] as? String else { return nil }
        
        self.username = username
        self.postIdentifier = postIdentifier
        
        self.identifier = identifier
    }
    
    //MARK: Initializers
    
    
    init(username: String, postIdentifier: String) {
        self.username = username
        self.postIdentifier = postIdentifier
    }
    
    //MARK: Other Methods
    
}

func==(lhs: Like, rhs: Like) -> Bool {
    return lhs.username == rhs.username && lhs.identifier == rhs.identifier
}