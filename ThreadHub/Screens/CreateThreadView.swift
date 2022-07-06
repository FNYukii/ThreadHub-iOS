//
//  CreateThreadView.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import SwiftUI

struct CreateThreadView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("thread_title", text: $title)
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
                    .disabled(title.isEmpty)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
