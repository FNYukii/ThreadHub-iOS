//
//  ThreadRow.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import SwiftUI

struct ThreadRow: View {
    
    private let thread: Thread
    @State private var firstComment: Comment? = nil
    @ObservedObject private var commentsCountViewModel: CommentsCountViewModel
    
    init(thread: Thread) {
        self.thread = thread
        self.commentsCountViewModel = CommentsCountViewModel(threadId: thread.id)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                Text(thread.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Menu {
                    if thread.userId == FireAuth.userId() {
                        Button(role: .destructive) {
                            // TODO: Delete
                        } label: {
                            Label("delete_thread", systemImage: "trash")
                        }
                    }
                    
                    Button(action: {
                        // TODO: Report
                    }) {
                        Label("report_thread", systemImage: "flag")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.secondary)
                        .padding(.vertical, 4)
                }
            }
            
            Text(firstComment == nil ? "---" : firstComment!.text)
                .multilineTextAlignment(.leading)
            
            HStack(spacing: 2) {
                Text(commentsCountViewModel.isLoaded ? String(commentsCountViewModel.count) : "-")
                Text("comments")
            }
            .foregroundColor(.secondary)
        }
        .background( NavigationLink("", destination: ThreadView(thread: thread)).opacity(0) )
        .foregroundColor(.primary)
        .onAppear(perform: load)
    }
    
    private func load() {
        FireComment.readFirstComment(threadId: thread.id) { comment in
            self.firstComment = comment
        }
    }
}
