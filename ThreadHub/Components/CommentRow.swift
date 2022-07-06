//
//  CommentRow.swift
//  ThreadHub
//
//  Created by Yu on 2022/06/18.
//

import SwiftUI

struct CommentRow: View {
    
    let comment: Comment
    
    @State private var isShowDialog = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(comment.displayName)
                    .fontWeight(.bold)
                    .lineLimit(1)
                Text("@\(comment.userId)")
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                HowManyAgoText(from: comment.createdAt)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                Spacer()
                
                if comment.userId == FireAuth.userId() {
                    Menu {
                        Button(role: .destructive) {
                            isShowDialog.toggle()
                        } label: {
                            Label("delete_comment", systemImage: "trash")
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .padding(.top, 2)
                            .padding(.bottom, 6)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            Text(comment.text)
        }
        .padding(.vertical, 6)
        
        .contextMenu {
            if comment.userId == FireAuth.userId(){
                Button(role: .destructive) {
                    isShowDialog.toggle()
                } label: {
                    Label("delete_comment", systemImage: "trash")
                }
            }
            
            Button(action: {
                // TODO: Report
            }) {
                Label("report_comment", systemImage: "flag")
            }
        }
        
        .confirmationDialog("", isPresented: $isShowDialog, titleVisibility: .hidden) {
            Button("delete_comment", role: .destructive) {
                FireComment.deleteComment(commentId: comment.id)
            }
        } message: {
            Text("are_you_sure_you_want_to_delete_this_comment")
        }
    }
    
    private func HowManyAgoText(from: Date) -> Text {
        let inputDate = from
        
        let secondDiff: Int = (Calendar.current.dateComponents([.second], from: inputDate, to: Date())).second!
        if secondDiff < 1 {
            return Text("now")
        }
        if secondDiff < 60 {
            return Text("\(secondDiff)s")
        }
        
        let minuteDiff = (Calendar.current.dateComponents([.minute], from: inputDate, to: Date())).minute!
        if minuteDiff < 60 {
            return Text("\(minuteDiff)m")
        }
        
        let hourDiff = (Calendar.current.dateComponents([.hour], from: inputDate, to: Date())).hour!
        if hourDiff < 24 {
            return Text("\(hourDiff)h")
        }
        
        let dayDiff = (Calendar.current.dateComponents([.day], from: inputDate, to: Date())).day!
        if dayDiff < 31 {
            return Text("\(dayDiff)d")
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("YYYY MMMM d")
        return Text(dateFormatter.string(from: from))
    }
}
