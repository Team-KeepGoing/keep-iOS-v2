//
//  MypageView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/19/24.
//

import SwiftUI

struct MypageView: View {
    var body: some View {
        ZStack {
            Color(hex:"F9FAFC")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                HStack(spacing: 14) {
                    Image("StudentProfile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 71)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("최미래")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(textColor)
                        Text("2학년 2반 6번")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color(hex: "4D5969"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 33)
                VStack(spacing: 35) {
                    VStack(spacing: 10) {
                        Text("회원님이 대출중인 도서 현황")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color(hex: "8E98A8"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 36)
                        Rectangle()
                            .frame(width: 346, height: 148)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .shadow(radius: 1)
                    }
                    VStack(spacing: 10) {
                        Text("회원님이 대출중인 기자재 현황")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Color(hex: "8E98A8"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 36)
                        Rectangle()
                            .frame(width: 346, height: 148)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .shadow(radius: 1)
                    }
                    Button {
                        
                    } label: {
                        Rectangle()
                            .frame(width:346, height: 54)
                            .foregroundColor(mainColor)
                            .cornerRadius(13)
                            .overlay {
                                Text("로그아웃")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .bold))
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    MypageView()
}
