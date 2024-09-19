//
//  NoticeWriteView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/12/24.
//

import SwiftUI

struct NoticeWriteView: View {
    @State private var notice: String = ""
    var body: some View {
        ZStack {
            Color(hex:"F9FAFC")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:46) {
                VStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 43) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("긴급 공지 작성")
                                .font(.system(size: 25, weight: .semibold))
                                .foregroundColor(textColor)
                            Text("긴급한 내용을 학생들에게 공지해요.")
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(Color(hex: "A6ABAF"))
                        }
                        Text("공지 내용")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(textColor)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 36)
                    Rectangle()
                        .frame(width: 338, height: 372)
                        .cornerRadius(15)
                        .foregroundColor(Color(hex: "F3F4F6"))
                        .overlay {
                            TextField("최대 150자 까지 작성할 수 있어요.", text: $notice)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .multilineTextAlignment(.leading)
                        }
                }
                VStack(spacing: 13) {
                    Text("※ 버튼을 누르는 순간 전체 학생에게 전송됩니다 ※")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(Color(hex: "A6ABAF"))
                    Button {
                        
                    } label: {
                        Rectangle()
                            .frame(width: 354, height: 62)
                            .foregroundColor(mainColor)
                            .cornerRadius(15)
                            .overlay {
                                Text("공지하기")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25, weight: .bold))
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    NoticeWriteView()
}
