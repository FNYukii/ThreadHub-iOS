//
//  ThreadRow.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import SwiftUI

struct ThreadRow: View {
    
    let thread: Thread
    @State private var firstComment: Comment? = nil
    
    var body: some View {
        NavigationLink(destination: ThreadView(thread: thread)) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top) {
                    Text(thread.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Menu {
                        Button(action: {
                            
                        }) {
                            Label("report", systemImage: "flag")
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.secondary)
                            .padding(.vertical, 4)
                    }
                }
                
                
                Text(firstComment == nil ? "---" : firstComment!.text)
                    .multilineTextAlignment(.leading)
                
                Divider()
            }
            .padding(.horizontal)
        }
        .foregroundColor(.primary)
        .onAppear(perform: load)
    }
    
    private func load() {
        FireComment.readFirstComment(threadId: thread.id) { comment in
            self.firstComment = comment
        }
    }
}
