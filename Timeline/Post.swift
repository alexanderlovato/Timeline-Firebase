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
	private static let kImageEndpoint = "imageEndpoint"
	private static let kCaption = "caption"
	private static let kUsername = "username"
	private static let kComments = "comments"
	private static let kLikes = "like"
	
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
		return "posts"
	}
	
	var jsonValue: [String : AnyObject] {
		var jsonRepresentation = [String : AnyObject]()
		
		jsonRepresentation = [Post.kUsername : username, Post.kImageEndpoint : imageEndpoint, Post.kComments : comments.map({$0.jsonValue}), Post.kLikes : likes.map({$0.jsonValue})]
		
		if let caption = caption {
			jsonRepresentation[Post.kCaption] = caption
		}
		
		return jsonRepresentation
	}
	
	init?(dictionary: [String : AnyObject], identifier: String) {
		guard let imageEndpoint = dictionary[Post.kImageEndpoint] as? String, username = dictionary[Post.kUsername] as? String else { return nil }
		
		let caption = dictionary[Post.kCaption] as? String
		
		let commentDictionary = dictionary[Post.kComments] as? [String : AnyObject]
		let comments = commentDictionary?.flatMap({Comment(dictionary: $0.1 as! [String : AnyObject], identifier: $0.0)}) ?? []
		
		let likeDictionary = dictionary[Post.kLikes] as? [String : AnyObject]
		let likes = likeDictionary?.flatMap({Like(dictionary: $0.1 as! [String : AnyObject], identifier: $0.0)}) ?? []
		
		self.init(imageEndpoint: imageEndpoint, caption: caption, username: username, comments: comments, like: likes)
		
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