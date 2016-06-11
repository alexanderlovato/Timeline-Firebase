//
//  Comment.swift
//  Timeline
//
//  Created by Alexander Lovato on 6/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Comment: Equatable, FirebaseType {
    
    //MARK: Constants
    
    static let kEndPoint = "comments"
    private let kUsername = "username"
    private let kText = "text"
    private let kPostIdentifier = "postIdentifier"
    
    //MARK: Properties
    
    let username: String
    let text: String
    let postIdentifier: String
    
    //MARK: Firebase Type
    
    var identifier: String?
    var endpoint: String {
        return Comment.kEndPoint
    }
    
    var jsonValue: [String : AnyObject] {
        var jsonRepresentation = [String : AnyObject]()
        
        jsonRepresentation = [kUsername : username, kText : text, kPostIdentifier : postIdentifier]

        return jsonRepresentation
    }
    
    init?(dictionary: [String : AnyObject], identifier: String) {
        guard let username = dictionary[kUsername] as? String, text = dictionary[kText] as? String, postIdentifier = dictionary[kPostIdentifier] as? String else { return nil }
        
        self.username = username
        self.text = text
        self.postIdentifier = postIdentifier
        
        self.identifier = identifier
    }
    
    //MARK: Initializers
    
    init(username: String, text: String, postIdentifier: String) {
        
        self.username = username
        self.text = text
        self.postIdentifier = postIdentifier
    }
    
    //MARK: Other Methods
}

func==(lhs: Comment, rhs: Comment) -> Bool {
    return lhs.username == rhs.username && lhs.identifier == rhs.identifier
}