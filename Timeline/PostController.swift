//
//  PostController.swift
//  Timeline
//
//  Created by Alexander Lovato on 6/5/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    var allPosts: [Post] = []
    
    static func fetchTimelineForUser (user: User, completion: (post: [Post]?) -> Void) {
        
    }
    
    static func addPost(image: UIImage, caption: String?, completion: (success: Bool, post: Post?) -> Void) {
        
    }
    
    static func postFromIdentifier(identifier: String, completion: (post: Post?) -> Void) {
        
    }
    
    static func postsForUser(user: User, completion: (posts: [Post]) -> Void) {
        
    }
    
    static func deletePost(post: Post) {
        
    }
    
    static func addCommentWithTextPost(string: String, post: Post, completion: (success: Bool, post: Post?) -> Void) {
        
    }
    
    static func deleteComment(comment: Comment, completion: (success: Bool, post: Post?) -> Void) {
        
    }
    
    static func addLikePost(like: Like, completion: (success: Bool, post: Post?) -> Void) {
        
    }
    
    static func deleteLike(like: Like, completion: (success: Bool, post: Post?) -> Void) {
        
    }
    
    static func orderPosts(post: [Post]) -> [Post] {
        return []
    }
    
    static func mockPosts() -> [Post] {
        
        let sampleImageIdentifier = "-K1l4125TYvKMc7rcp5e"
        
        let like1 = Like(username: "Strongbad", postIdentifier: "13254")
        let like2 = Like(username: "Cheeto", postIdentifier: "13255")
        let like3 = Like(username: "YoloMancer", postIdentifier: "13256")
        
        let comment1 = Comment(username: "Strongbad", text: "Do, dodo, do, dooo", postIdentifier: "1234")
        let comment2 = Comment(username: "DeadmouCinco", text: "Who wants to shoot them down!", postIdentifier: "3256")
        
        let post1 = Post(imageEndpoint: sampleImageIdentifier, caption: "Just picked up a few drones!", username: "DeadmouCinco", comments: [comment1, comment2], like: [like1, like2, like3])
        let post2 = Post(imageEndpoint: sampleImageIdentifier, caption: "Nice!")
        let post3 = Post(imageEndpoint: sampleImageIdentifier, caption: "Who's down?")
        
        return [post1, post2, post3]
        
        
    }
    
}















