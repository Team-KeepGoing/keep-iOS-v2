//
//  FirstView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/5/24.
//

import SwiftUI

struct FirstView: View {
    @StateObject var viewModel: SignUpViewModel
    @State private var name: String = ""
    @State private var showAlert: Bool = false
    @State private var navigateToSecondView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 17) {
                    VStack(alignment: .leading) {
                        Text("회원가입을 위해")
                            .font(.system(size: 23, weight: .semibold))
                            .foregroundColor(textColor)
                        Text("이름을 입력해 주세요")
                            .font(.system(size: 23, weight: .semibold))
                            .foregroundColor(textColor)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("올바른 이름을 입력해 주세요.")
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(Color(hex: "#A6ABAF"))
                        Text("ex) 홍길동")
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(Color(hex: "#A6ABAF"))
                    }
                    .padding(.bottom, 20)
                    
                    VStack {
                        TextField("이름을 입력해 주세요", text: $name)
                            .frame(width: 299)
                            .foregroundColor(mainColor)
                        Rectangle()
                            .frame(width: 299, height: 2)
                            .foregroundColor(mainColor)
                    }
                }
                
                Spacer()
                    .frame(height: 322)
                
                Button(action: {
                    if name.isEmpty {
                        showAlert = true
                    } else {
                        viewModel.signUpData.name = name
                        navigateToSecondView = true
                    }
                }) {
                    Rectangle()
                        .frame(width: 354, height: 62)
                        .cornerRadius(15)
                        .foregroundColor(mainColor)
                        .overlay {
                            Text("다음")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                        }
                }
                .padding(.bottom, 66)
                
                NavigationLink(
                    destination: SecondView(viewModel: viewModel),
                    isActive: $navigateToSecondView
                ) { EmptyView() }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("이름 입력"),
                    message: Text("이름을 입력해 주세요."),
                    dismissButton: .default(Text("확인"))
                )
            }
        }
    }
}

#Preview {
    FirstView(viewModel: SignUpViewModel())
}
