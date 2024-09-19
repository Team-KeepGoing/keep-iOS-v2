//
//  NoticeView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/11/24.
//

import SwiftUI

struct NoticeView: View {
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
                                        Text("이예봉 선생님")
                                            .foregroundColor(textColor)
                                            .font(.system(size: 17, weight: .medium))
                                        Text("<필독> 2학기 중간고사 일정 변경 10월 1일 임시공휴일 지정 및 1학년 해양수련원 일정변경으로 인해 중간고사일정을 아래와 같이 변경하니 학생들은 반드시 확인바랍니다. - 중간고사 변경일: 10월 7일(월) ~ 10월 8일(화) 그 외에 블라블라블라블라 해피해피해피캣 힘드네 알아서 더 채우던가 아님 비워놔도 더ㅣㄹ거같네요")
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
                .frame(width: 500)
            }
        }
    }
}

#Preview {
    NoticeView()
}
