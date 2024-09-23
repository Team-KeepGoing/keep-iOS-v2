//
//  StudentInfoView.swift
//  KEEP_v2
//
//  Created by 김주환 on 9/23/24.
//

import SwiftUI

struct StudentInfoView: View {
    var body: some View {
        ZStack {
            Color(hex:"F9FAFC")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("학생 정보")
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(textColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 39)
                    .padding(.bottom, 40)
                Rectangle()
                    .frame(width: 308,height: 520)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .shadow(radius: 0.5)
                    .overlay {
                        VStack(spacing: 26) {
                            VStack(spacing: 25) {
                                Image("StudentProfile")
                                    .resizable()
                                    .frame(width: 172, height: 172)
                                VStack(spacing: 7) {
                                    Text("김주환")
                                        .font(.system(size: 36, weight: .semibold))
                                        .foregroundColor(textColor)
                                    Text("2학년 2반 8번")
                                        .font(.system(size: 23, weight: .regular))
                                        .foregroundColor(textColor)
                                    Text("010-3852-4644")
                                        .font(.system(size: 23, weight: .regular))
                                        .foregroundColor(textColor)
                                }
                            }
                            VStack(spacing: 11) {
                                Button {
                                    
                                } label: {
                                    Rectangle()
                                        .frame(width: 261, height: 50)
                                        .foregroundColor(mainColor)
                                        .cornerRadius(10)
                                        .overlay {
                                            HStack(spacing:0) {
                                                Image("call")
                                                    .resizable()
                                                    .frame(width: 30, height: 30)
                                                Text("전화걸기")
                                                    .font(.system(size: 20, weight: .semibold))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                }
                                Button {
                                    
                                } label: {
                                    Rectangle()
                                        .frame(width: 261, height: 50)
                                        .foregroundColor(mainColor)
                                        .cornerRadius(10)
                                        .overlay {
                                            HStack(spacing:2) {
                                                Image("chat")
                                                    .resizable()
                                                    .frame(width: 27, height: 27)
                                                Text("문자하기")
                                                    .font(.system(size: 20, weight: .semibold))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                }
                            }
                        }
                    }
                VStack(spacing:3) {
                    HStack(spacing: 0) {
                        Text("학생의 상태는")
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(textColor)
                        Text(" \"정상\" ")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(mainColor)
                        Text("입니다.")
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(textColor)
                    }
                    Text("8분전 업데이트됨")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Color(hex: "4D5967"))
                }
                .padding(.top, 25)
            }
        }
    }
}

#Preview {
    StudentInfoView()
}
