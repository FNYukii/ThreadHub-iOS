//
//  FireComment.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import Firebase

class FireComment {
    
    static func readFirstComment(threadId: String, completion: ((Comment) -> Void)?) {
        let db = Firestore.firestore()
        db.collection("comments")
            .whereField("threadId", isEqualTo: threadId)
            .order(by: "createdAt", descending: false)
            .limit(to: 1)
            .addSnapshotListener {(snapshot, error) in
                guard let snapshot = snapshot else {
                    print("HELLO! Fail! Error fetching snapshots: \(error!)")
                    return
                }
                print("HELLO! Success! Read \(snapshot.documents.count) Comments.")
                
                if let document = snapshot.documents.first {
                    let comment = Comment(document: document, isFirst: true)
                    completion?(comment)
                }
            }
    }
    
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
                        print("HELLO! Success! Added 1 Comment.")
                    }
                }
        }
    }
    
    static func deleteComment(commentId: String) {
        let db = Firestore.firestore()
        db.collection("comments")
            .document(commentId)
            .delete() { err in
            if let err = err {
                print("HELLO! Fail! Error removing document: \(err)")
            } else {
                print("HELLO! Success! Deleted 1 Comment.")
            }
        }
    }
}
