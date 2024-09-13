//
//  NoticeWriteView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/12/24.
//

import SwiftUI

struct NoticeWriteView: View {
    var body: some View {
        VStack {
            Text("긴급 공지사항 🚨")
                .font(.system(size: 25, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 50)
                .padding(.top, 30)
            ScrollView {
                VStack {
                    Rectangle()
                        .frame(width: 358, height: 173)
                        .foregroundColor(Color(hex: "F9FAFC"))
                        .cornerRadius(15)
                        .shadow(radius: 2, x:2, y:2)
                        .overlay {
                            
                        }
                }
                .frame(width:500)
            }
            .padding(.top, 10)
        }
    }
}

#Preview {
    NoticeWriteView()
}
