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
                TextField("display_name", text: $displayName)
                
                Section {
                    TextField("title", text: $title)
                    MyTextEditor(hintText: Text("detail"), text: $detail)
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
                        dismiss()
                    }) {
                        Text("create")
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
