//
//  Thread.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import Firebase

struct Thread: Identifiable {
    let id: String
    let createdAt: Date
    let userId: String
    let displayName: String
    let title: String
    let detail: String
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        self.createdAt = (document.get("createdAt") as! Timestamp).dateValue()
        self.userId = document.get("userId") as! String
        self.displayName = document.get("displayName") as! String
        self.title = document.get("title") as! String
        self.detail = document.get("detail") as! String
    }
}
