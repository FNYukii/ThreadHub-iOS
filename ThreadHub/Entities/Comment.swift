//
//  Comment.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import Firebase

struct Comment: Identifiable {
    let id: String
    let threadId: String
    let createdAt: Date
    let userId: String
    let displayName: String
    let text: String
    let isFirst: Bool
    
    init(document: QueryDocumentSnapshot, isFirst: Bool = false) {
        self.id = document.documentID
        self.createdAt = (document.get("createdAt", serverTimestampBehavior: .estimate) as! Timestamp).dateValue()
        self.threadId = document.get("threadId") as! String
        self.userId = document.get("userId") as! String
        self.displayName = document.get("displayName") as! String
        self.text = document.get("text") as! String
        self.isFirst = isFirst
    }
}
