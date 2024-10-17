//
//  MypageView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/19/24.
//

import SwiftUI
import Alamofire

struct MypageView: View {
    @StateObject private var viewModel = MypageViewModel()
    
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
                        Text(viewModel.name)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(textColor)
                        Text(viewModel.formattedStudentInfo())
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(Color(hex: "4D5969"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 33)
                VStack(spacing: 27) {
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
                            .overlay {
                                ScrollView(.horizontal) {
                                    HStack(spacing: 39) {
                                        ForEach(viewModel.borrowedBooks) { book in
                                            AsyncImage(url: URL(string: book.imageUrl)) { image in
                                                image
                                                    .resizable()
                                                    .frame(width: 68, height: 100)
                                            } placeholder: {
                                                ProgressView()
                                            }
                                        }
                                    }
                                }
                                .padding(.leading, 31)
                            }
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
                            .overlay {
                                ScrollView(.horizontal) {
                                    HStack(spacing: 39) {
                                        ForEach(viewModel.borrowedDevices) { device in
                                            AsyncImage(url: URL(string: device.imgUrl)) { image in
                                                image
                                                    .resizable()
                                                    .frame(width: 68, height: 68)
                                            } placeholder: {
                                                ProgressView()
                                            }
                                        }
                                    }
                                }
                                .padding(.leading, 31)
                            }
                    }
                    VStack(alignment: .leading, spacing: 19) {
                        Link(destination: URL(string: "https://romantic-approach-561.notion.site/KEEP-fd89b85b34ac450c9334a4e2748e1bab?pvs=4")!) {
                            Text("개인정보 처리 방침")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(textColor)
                        }
                        HStack(spacing: 230) {
                            Text("버전 정보")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(textColor)
                            Text("1.0.0")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(Color(hex: "8E98A8"))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 36)
                    Button {
                        moveToRootView()
                        UserDefaultsManager.shared.deleteToken()
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
        .onAppear {
            viewModel.fetchData()
        }
    }
    func moveToRootView() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = UIHostingController(rootView: StartView())
            window.makeKeyAndVisible()
        }
    }
}

#Preview {
    MypageView()
}
