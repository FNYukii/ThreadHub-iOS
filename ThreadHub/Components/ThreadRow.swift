//
//  ThreadRow.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import SwiftUI

struct ThreadRow: View {
    
    let thread: Thread
    
    var body: some View {
        NavigationLink(destination: ThreadView(thread: thread)) {
            VStack(alignment: .leading, spacing: 8) {
                Text(thread.title)
                    .fontWeight(.bold)
            }
        }
    }
}
