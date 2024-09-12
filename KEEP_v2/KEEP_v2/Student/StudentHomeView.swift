//
//  StudentHomeView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/10/24.
//

import SwiftUI

struct StudentHomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex:"F9FAFC")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Image("keepchr")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28)
                        Spacer()
                            .frame(width: 277)
                        NavigationLink(destination: NoticeView()) {
                            Image("mailalert")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28)
                        }
                    }
                    .padding(.bottom,10)

                    ScrollView {
                        NavigationLink(destination: NoticeView()) {
                            Rectangle()
                                .frame(width: 346, height: 59)
                                .foregroundColor(.white)
                                .cornerRadius(14)
                                .shadow(radius: 3, x: 5, y: 3)
                                .overlay {
                                    HStack {
                                        Text("긴급 공지")
                                            .font(.system(size: 18, weight: .bold))
                                            .foregroundColor(Color(hex: "F6556C"))
                                        Text("확인하러 가기")
                                            .font(.system(size: 18, weight: .medium))
                                            .foregroundColor(.black)
                                        Spacer()
                                            .frame(width:120)
                                        Image(systemName: "greaterthan")
                                            .frame(width: 14)
                                            .foregroundColor(.black)
                                    }
                                }
                        }
                        .padding(.bottom,10)
                        HStack(alignment: .top, spacing: 35) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("QR 발급")
                                    .font(.system(size: 17, weight: .semibold))
                                    .font(.system(size: 17, weight: .semibold))
                                    .padding(.leading,10)
                                NavigationLink(destination: QrView()) {
                                    Rectangle()
                                        .frame(width: 155, height: 155)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                        .shadow(radius: 3, x: 3, y:3)
                                        .overlay {
                                            Image("QRcode")
                                                .resizable()
                                                .frame(width:100,height: 100)
                                        }
                                }
                            }
                            VStack(alignment: .leading, spacing: 8) {
                                Text("내 상태 전송")
                                    .font(.system(size: 17, weight: .semibold))
                                    .padding(.leading,10)
                                NavigationLink(destination: QrView()) {
                                    Rectangle()
                                        .frame(width: 155, height: 191)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                        .shadow(radius: 3, x: 3, y:3)
                                        .overlay {
                                            VStack(spacing:25) {
                                                HStack(spacing: 31) {
                                                    Button {
                                                        
                                                    } label: {
                                                        VStack(spacing: 5) {
                                                            Image("good")
                                                                .resizable()
                                                                .frame(width:38, height: 49)
                                                            Text("정상")
                                                                .foregroundColor(mainColor)
                                                                .font(.system(size: 10.5, weight: .semibold))
                                                        }
                                                    }
                                                    Button {
                                                        
                                                    } label: {
                                                        VStack(spacing:9) {
                                                            Image("sick")
                                                                .resizable()
                                                                .frame(width:42, height: 42)
                                                            Text("통증")
                                                                .foregroundColor(mainColor)
                                                                .font(.system(size: 10.5, weight: .semibold))
                                                        }
                                                    }
                                                }
                                                HStack(spacing: 31) {
                                                    Button {
                                                        
                                                    } label: {
                                                        VStack(spacing: 8) {
                                                            Image("medc")
                                                                .resizable()
                                                                .frame(width:39, height: 39)
                                                            Text("정상")
                                                                .foregroundColor(mainColor)
                                                                .font(.system(size: 10.5, weight: .semibold))
                                                        }
                                                    }
                                                    Button {
                                                        
                                                    } label: {
                                                        VStack(spacing:11) {
                                                            Image("wari")
                                                                .resizable()
                                                                .frame(width:42, height: 36)
                                                            Text("통증")
                                                                .foregroundColor(mainColor)
                                                                .font(.system(size: 10.5, weight: .semibold))
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                }
                            }
                        }
                        .frame(width:500)
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    StudentHomeView()
}
