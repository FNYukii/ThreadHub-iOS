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
    @State private var detail = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("title", text: $title)
                
                Section(header: Text("comment")) {
                    TextField("display_name", text: $displayName)
                    MyTextEditor(hintText: Text("text"), text: $detail)
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
                        FireThread.createThread(title: title)
                        dismiss()
                    }) {
                        Text("create")
                            .fontWeight(.bold)
                    }
                    .disabled(displayName.isEmpty || title.isEmpty || detail.isEmpty)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
