//
//  UserController.swift
//  Timeline
//
//  Created by Alexander Lovato on 6/1/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class UserController {
    
    var currentUser: User! {
        
        return nil
    }
    
    static let sharedController = UserController()
    
    
    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        
    }
    
    static func fetchAllUsers(completion: (users: [User]) -> Void) {
        
    }
    
    static func followUser(user: User, completion: (success: Bool) -> Void) {
        
    }
    
    static func unfollowUser(user: User, completion: (success: Bool) -> Void) {
        
    }
    
    static func userFollowUser(user: User, followsUser: User, completion: (follows: Bool) -> Void) {
        
    }
    
    static func followedByUser(user: User, completion: (followed: [User]) -> Void) {
        
    }
    
    static func authenticateUser(email: String, password: String, completion: (success: Bool, user: User?) -> Void) {
        
    }
    
    static func createUser(email: String, username: String, password: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        
    }
    
    static func updateUser(user: User, username: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        
    }
    
    static func logOutCurrentUser() {
        
    }
    
    static func mockUsers() -> [User] {
        
        let user1 = User(username: "Juan Yolo", identifier: "13245")
        let user2 = User(username: "John Dillinger", identifier: "13246")
        let user3 = User(username: "Johnny Danger", identifier: "13247")
        
        return [user1, user2, user3]
        
        
    }
    
}











