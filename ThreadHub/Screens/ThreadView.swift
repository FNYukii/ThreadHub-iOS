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
    @State private var isShowSheet = false
        
    init(thread: Thread) {
        self.thread = thread
        self.commentsViewModel = CommentsViewModel(threadId: thread.id)
    }
    
    var body: some View {
        
        ZStack {
            
            if commentsViewModel.comments.count == 0 {
                Text("there_are_no_comments_yet")
                    .foregroundColor(.secondary)
            }
            
            List {
                ForEach(commentsViewModel.comments) { comment in
                    CommentRow(comment: comment)
                }
                .listRowSeparator(.hidden, edges: .top)
                .listRowSeparator(.visible, edges: .bottom)
            }
            .listStyle(PlainListStyle())
            
        }
        
        
        
        .sheet(isPresented: $isShowSheet) {
            CreateCommentView(threadId: thread.id)
        }
        
        .navigationTitle(thread.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isShowSheet.toggle()
                }) {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
    }
}

