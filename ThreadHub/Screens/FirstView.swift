//
//  FirstView.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import SwiftUI

struct FirstView: View {
    
    @ObservedObject private var threadsViewModel = ThreadsViewModel()
    @State private var isShowSheet = false
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(threadsViewModel.threads) { thread in
                    ThreadRow(thread: thread)
                }
            }
            .listStyle(PlainListStyle())
            
            .sheet(isPresented: $isShowSheet) {
                CreateThreadView()
            }
            
            .navigationTitle("threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowSheet.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
