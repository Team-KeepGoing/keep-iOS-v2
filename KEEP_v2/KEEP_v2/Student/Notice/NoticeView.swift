//
//  NoticeView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/11/24.
//

import SwiftUI

struct NoticeView: View {
    @StateObject private var viewModel = NoticeViewModel()
    var body: some View {
        VStack(spacing: 21) {
            Text("긴급 공지사항 🚨")
                .foregroundColor(textColor)
                .font(.system(size: 25, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 50)
                .padding(.top, 30)
            ScrollView {
                VStack {
                    ForEach(viewModel.notices) { notice in
                        Button {
                            
                        } label : {
                            Rectangle()
                                .frame(width: 358, height: 173)
                                .cornerRadius(15)
                                .foregroundColor(Color(hex: "F9FAFC"))
                                .shadow(radius: 2, x: 3, y: 3)
                                .overlay {
                                    HStack(spacing: 14) {
                                        Image("TeacherProfile")
                                            .resizable()
                                            .frame(width: 52, height: 53)
                                            .padding(.leading, 14)
                                            .padding(.bottom, 70)
                                        VStack(alignment: .leading, spacing: 6) {
                                            HStack {
                                                Text(notice.teacherName)
                                                    .foregroundColor(textColor)
                                                    .font(.system(size: 17, weight: .medium))
                                                Text(notice.createTime.formattedDate())
                                                    .foregroundColor(Color(hex: "#4D5967"))
                                                    .font(.system(size: 13, weight: .regular))
                                            }
                                            Text(notice.message)
                                                .foregroundColor(Color(hex: "4D5967"))
                                                .font(.system(size: 14, weight: .regular))
                                                .lineLimit(5)
                                                .multilineTextAlignment(.leading)
                                                .frame(width: 251, height: 85)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                        }
                    }
                }
                .frame(width: 500)
            }
        }
        .onAppear {
            viewModel.fetchNotices()
        }
    }
}

extension String {
    func formattedDate() -> String {
        return String(self.prefix(10))
    }
}

#Preview {
    NoticeView()
}
