//
//  ThreadsViewModel.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import Foundation
import Firebase
import SwiftUI

class ThreadsViewModel: ObservableObject {
    
    @Published var threads: [Thread] = []
    @Published var isLoaded = false
    
    init() {
        let db = Firestore.firestore()
        db.collection("threads")
            .order(by: "createdAt", descending: true)
            .addSnapshotListener {(snapshot, error) in
                guard let snapshot = snapshot else {
                    print("HELLO! Fail! Error fetching snapshots: \(error!)")
                    return
                }
                print("HELLO! Success! Read threads. size: \(snapshot.documents.count)")
                
                var threads: [Thread] = []
                snapshot.documents.forEach { document in
                    let thread = Thread(document: document)
                    threads.append(thread)
                }
                
                withAnimation {
                    self.threads = threads
                    self.isLoaded = true
                }
            }
    }
}
