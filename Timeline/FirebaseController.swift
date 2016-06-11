//
//  FirebaseController.swift
//  Timeline
//
//  Created by Alexander Lovato on 6/9/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    
    static let sharedController = FirebaseController()
    
    var databaseReference: FIRDatabaseReference
    
    init() {
        self.databaseReference = FIRDatabase.database().reference()
    }
}

protocol FirebaseType {
    var identifier: String? { get set }
    var endpoint: String { get }
    var jsonValue: [String : AnyObject] { get }
    
    init?(dictionary: [String : AnyObject], identifier: String)
    
    mutating func save()
}

extension FirebaseType {
    mutating func save() {
        var reference  = FirebaseController.sharedController.databaseReference.child(self.endpoint)
        
        if let firebaseIdentifier = self.identifier {
            reference = reference.child(firebaseIdentifier)
        } else {
            reference = reference.childByAutoId()
            self.identifier = reference.key
        }
        
        reference.updateChildValues(self.jsonValue)
    }
    
    func delete() {
        if let identifier = identifier {
            let reference = FirebaseController.sharedController.databaseReference.child(self.endpoint).child(identifier)
            reference.removeValue()
        }
    }
    
    
}