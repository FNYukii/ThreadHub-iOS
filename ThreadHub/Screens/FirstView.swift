//
//  FirstView.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import SwiftUI

struct FirstView: View {
    
    @ObservedObject private var threadsViewModel = ThreadsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(threadsViewModel.threads) { thread in
                    ThreadRow(thread: thread)
                }
            }
            
            .navigationTitle("threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
