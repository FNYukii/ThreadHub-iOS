//
//  ThreadView.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import SwiftUI

struct ThreadView: View {
    
    let thread: Thread
    
    var body: some View {
        
        ScrollView {
            VStack {
                
            }
        }
        
            .navigationTitle(thread.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

