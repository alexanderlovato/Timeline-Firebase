//
//  Post.swift
//  Timeline
//
//  Created by Alexander Lovato on 6/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Post: Equatable, FirebaseType {
    
    /*************
     * CONSTANTS *
     *************/
    
    static let kEndpoint = "posts"
    private let kImageEndpoint = "imageEndpoint"
    private let kCaption = "caption"
    private let kUsername = "username"
    private let kComments = "comments"
    private let kLikes = "like"
    
    /**************
     * PROPERTIES *
     **************/
    
    let imageEndpoint: String
    let caption: String?
    let username: String
    let comments: [Comment]
    let likes: [Like]
    
    /*****************
     * FIREBASE TYPE *
     *****************/
    
    var identifier: String?
    var endpoint: String {
        return Post.kEndpoint
    }
    
    var jsonValue: [String : AnyObject] {
        var jsonRepresentation = [String : AnyObject]()
        
        jsonRepresentation = [kUsername : username, kImageEndpoint : imageEndpoint, kComments : comments.map({$0.jsonValue}), kLikes : likes.map({$0.jsonValue})]
        
        if let caption = caption {
            jsonRepresentation[kCaption] = caption
        }
        
        return jsonRepresentation
    }
    
    init?(dictionary: [String : AnyObject], identifier: String) {
        guard let imageEndpoint = dictionary[kImageEndpoint] as? String, username = dictionary[kUsername] as? String else { return nil }
        
        self.imageEndpoint = imageEndpoint
        self.username = username
        
        if let caption = dictionary[kCaption] as? String {
            self.caption = caption
        }
        
        if let commentDictionary = dictionary[kComments] as? [String : AnyObject] {
            self.comments = commentDictionary.flatMap({Comment(dictionary: $0.1 as! [String : AnyObject], identifier: $0.0)})
        } else {
            self.comments = []
        }
        
        if let likeDictionary = dictionary[kLikes] as? [String : AnyObject] {
            self.likes = likeDictionary.flatMap({Like(dictionary: $0.1 as! [String : AnyObject], identifier: $0.0)})
        } else {
            self.likes = []
        }
        
        self.identifier = identifier
    }
    
    
    
    
    init(imageEndpoint: String, caption: String? = nil, username: String = "", comments: [Comment] = [], like: [Like] = []) {
        
        self.imageEndpoint = imageEndpoint
        self.caption = caption
        self.username = username
        self.comments = comments
        self.likes = like
    }
    
}

func==(lhs: Post, rhs: Post) -> Bool {
    return lhs.username == rhs.username && lhs.identifier == rhs.identifier
}