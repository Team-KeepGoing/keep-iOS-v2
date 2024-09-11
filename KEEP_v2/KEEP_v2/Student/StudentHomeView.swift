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
                    Spacer()
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
                    }
                    .padding(.top, 26)
                }
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    StudentHomeView()
}
