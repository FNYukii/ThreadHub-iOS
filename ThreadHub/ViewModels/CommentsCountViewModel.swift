//
//  CommentsCountViewModel.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/19.
//

import Firebase
import SwiftUI

class CommentsCountViewModel: ObservableObject {
    
    @Published var count: Int  = 0
    @Published var isLoaded = false
    
    init(threadId: String) {
        let db = Firestore.firestore()
        db.collection("comments")
            .whereField("threadId", isEqualTo: threadId)
            .order(by: "createdAt", descending: false)
            .addSnapshotListener {(snapshot, error) in
                guard let snapshot = snapshot else {
                    print("HELLO! Fail! Error fetching snapshots: \(error!)")
                    return
                }
                print("HELLO! Success! Read \(snapshot.documents.count) Comments.")
                
                withAnimation {
                    self.count = snapshot.documents.count
                    self.isLoaded = true
                }
            }
    }
}
