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
    
    @State private var isShowDialog = false
    
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
                            isShowDialog.toggle()
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
                        .padding(.vertical, 6)
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
        .padding(.vertical, 6)
        .onAppear(perform: load)
        
        .contextMenu {
            if thread.userId == FireAuth.userId() {
                Button(role: .destructive) {
                    isShowDialog.toggle()
                } label: {
                    Label("delete_thread", systemImage: "trash")
                }
            }
            
            Button(action: {
                // TODO: Report
            }) {
                Label("report_thread", systemImage: "flag")
            }
        }
        
        .confirmationDialog("", isPresented: $isShowDialog, titleVisibility: .hidden) {
            Button("delete_thread", role: .destructive) {
                FireThread.deleteThread(threadId: thread.id)
            }
        } message: {
            Text("are_you_sure_you_want_to_delete_this_thread")
        }
    }
    
    private func load() {
        FireComment.readFirstComment(threadId: thread.id) { comment in
            self.firstComment = comment
        }
    }
}
