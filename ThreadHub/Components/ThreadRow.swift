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
                Text(thread.title)
                    .fontWeight(.bold)
                
                Text(firstComment == nil ? "---" : firstComment!.text)
            }
        }
        .onAppear(perform: load)
    }
    
    private func load() {
        FireComment.readFirstComment(threadId: thread.id) { comment in
            self.firstComment = comment
        }
    }
}
