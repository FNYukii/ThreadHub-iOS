//
//  FireComment.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import Firebase

class FireComment {
    
    static func createComment(threadId: String, displayName: String, text: String) {
        if let userId = FireAuth.userId() {
            let db = Firestore.firestore()
            db.collection("comments")
                .addDocument(data: [
                    "createdAt": FieldValue.serverTimestamp(),
                    "threadId": threadId,
                    "userId": userId,
                    "displayName": displayName,
                    "text": text,
                ]) { error in
                    if let error = error {
                        print("HELLO! Fail! Error adding new document. Error: \(error)")
                    } else {
                        print("HELLO! Success! Added new document.")
                    }
                }
        }
    }
    
    static func deleteComment(commentId: String) {
        // TODO: Delete
    }
    
}
