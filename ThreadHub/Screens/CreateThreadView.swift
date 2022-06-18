//
//  CreateThreadView.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import SwiftUI

struct CreateThreadView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var displayName = ""
    @State private var title = ""
    @State private var text = ""
    
    init() {
        let displayName = UserDefaults.standard.string(forKey: "displayName") ?? ""
        _displayName = State(initialValue: displayName)
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("title", text: $title)
                
                Section(header: Text("comment")) {
                    TextField("display_name", text: $displayName)
                    MyTextEditor(hintText: Text("comment"), text: $text)
                }
            }
            
            .navigationTitle("new_thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        FireThread.createThread(title: title) { threadId in
                            UserDefaults.standard.set(displayName, forKey: "displayName")
                            FireComment.createComment(threadId: threadId, displayName: displayName, text: text)
                        }
                        dismiss()
                    }) {
                        Text("create")
                            .fontWeight(.bold)
                    }
                    .disabled(displayName.isEmpty || title.isEmpty || text.isEmpty)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
