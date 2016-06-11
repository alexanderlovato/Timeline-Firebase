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
    private static let kUsername = "username"
    private static let kBio = "bio"
    private static let kUrl = "url"
    
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
        
        jsonRepresentation = [User.kUsername : username]
        
        if let bio = bio, url = url {
            jsonRepresentation[User.kBio] = bio
            jsonRepresentation[User.kUrl] = url
        }
        
        return jsonRepresentation
    }
    
    init?(dictionary: [String : AnyObject], identifier: String){
        guard let username = dictionary[User.kUsername] as? String else { return nil }
		
        let bio = dictionary[User.kBio] as? String
		let url = dictionary[User.kUrl] as? String
		
		self.init(username: username, bio: bio, url: url)
		
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