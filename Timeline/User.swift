//
//  User.swift
//  Timeline
//
//  Created by Alexander Lovato on 5/31/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct User: Equatable, FirebaseType {
    
    /*************
     * CONSTANTS *
     *************/
    
    static let kEndpoint = "users"
    private let kUsername = "username"
    private let kBio = "bio"
    private let kUrl = "url"
    
    /**************
     * PROPERTIES *
     **************/
    
    let username: String
    var bio: String?
    var url: String?
    
    /*****************
     * FIREBASE TYPE *
     *****************/
    
    var identifier: String?
    var endpoint: String {
        return User.kEndpoint
    }
    
    var jsonValue: [String : AnyObject] {
        var jsonRepresentation = [String : AnyObject]()
        
        jsonRepresentation = [kUsername : username]
        
        if let bio = bio, url = url {
            jsonRepresentation[kBio] = bio
            jsonRepresentation[kUrl] = url
        }
        
        return jsonRepresentation
    }
    
    init?(dictionary: [String : AnyObject], identifier: String) {
        guard let username = dictionary[kUsername] as? String else { return nil }
        
        self.username = username
        
        if let bio = dictionary[kBio] as? String, url = dictionary[kUrl] as? String {
            self.bio = bio
            self.url = url
        }
        
        self.identifier = identifier
    }
    
    /********
     * INIT *
     ********/
    
    init(username: String, bio: String? = nil, url: String? = nil) {
        
        self.username = username
        self.bio = bio
        self.url = url
    }
    
    /*****************
     * OTHER METHODS *
     *****************/
    
}

func==(lhs: User, rhs: User) -> Bool {
    return lhs.username == rhs.username && lhs.identifier == rhs.identifier
}