//
//  CreateCommentView.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import SwiftUI

struct CreateCommentView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let threadId: String
    @State private var displayName = ""
    @State private var text = ""
        
    var body: some View {
        NavigationView {
            Form {
                TextField("display_name", text: $displayName)
                MyTextEditor(hintText: Text("comment"), text: $text)
            }
            
            .navigationTitle("new_comment")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        FireComment.createComment(threadId: threadId, displayName: displayName, text: text)
                        dismiss()
                    }) {
                        Text("add")
                            .fontWeight(.bold)
                    }
                    .disabled(displayName.isEmpty || text.isEmpty)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

