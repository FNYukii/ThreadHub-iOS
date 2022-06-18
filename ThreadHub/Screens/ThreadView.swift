//
//  ThreadView.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import SwiftUI

struct ThreadView: View {
    
    private let thread: Thread
    @ObservedObject private var commentsViewModel: CommentsViewModel
    
        
    init(thread: Thread) {
        self.thread = thread
        self.commentsViewModel = CommentsViewModel(threadId: thread.id)
    }
    
    var body: some View {
        
        List {
            ForEach(commentsViewModel.comments) { comment in
                CommentRow(comment: comment)
            }
        }
        
            .navigationTitle(thread.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

