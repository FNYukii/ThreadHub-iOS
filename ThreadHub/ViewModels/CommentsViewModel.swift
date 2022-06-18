//
//  CommentsViewModel.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import Firebase
import SwiftUI

class CommentsViewModel: ObservableObject {
    
    @Published var comments: [Comment] = []
    @Published var isLoaded = false
    
    init(threadId: String) {
        let db = Firestore.firestore()
        db.collection("comments")
            .whereField("threadId", isEqualTo: threadId)
            .order(by: "createdAt", descending: true)
            .addSnapshotListener {(snapshot, error) in
                guard let snapshot = snapshot else {
                    print("HELLO! Fail! Error fetching snapshots: \(error!)")
                    return
                }
                print("HELLO! Success! Read comments. size: \(snapshot.documents.count)")
                
                var comments: [Comment] = []
                snapshot.documents.forEach { document in
                    let comment = Comment(document: document)
                    comments.append(comment)
                }
                
                withAnimation {
                    self.comments = comments
                    self.isLoaded = true
                }
            }
    }
}
