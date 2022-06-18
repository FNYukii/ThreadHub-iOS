//
//  FireThread.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import Firebase

class FireThread {
    
    static func createThread(displayName: String, title: String, detail: String) {
        if let userId = FireAuth.userId() {
            let db = Firestore.firestore()
            db.collection("threads")
                .addDocument(data: [
                    "createdAt": FieldValue.serverTimestamp(), // TODO: Fix
                    "userId": userId,
                    "displayName": displayName,
                    "title": title,
                    "detail": detail
                ]) { error in
                    if let error = error {
                        print("HELLO! Fail! Error adding new document. Error: \(error)")
                    } else {
                        print("HELLO! Success! Added new document.")
                    }
                }
        }
    }
}
