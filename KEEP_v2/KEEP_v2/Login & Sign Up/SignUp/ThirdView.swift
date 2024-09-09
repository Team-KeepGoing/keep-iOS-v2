//
//  ThirdView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/5/24.
//

import SwiftUI

struct ThirdView: View {
    @StateObject var viewModel: SignUpViewModel
    @State private var password: String = ""
    @State private var repassword: String = ""
    var body: some View {
        Spacer()
        VStack(alignment:.leading, spacing:17) {
            VStack(alignment: .leading) {
                Text("회원가입을 위해")
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(textColor)
                Text("비밀번호를 입력해 주세요")
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(textColor)
            }
            VStack(alignment: .leading) {
                Text("비밀번호 인증까지 진행하여 주세요.")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(Color(hex: "#A6ABAF"))
            }
            .padding(.bottom,30)
            VStack(spacing:13) {
                VStack {
                    TextField("비밀번호 입력", text: $password)
                        .frame(width:299)
                        .foregroundColor(mainColor)
                    Rectangle()
                        .frame(width:299, height:2)
                        .foregroundColor(mainColor)
                }
                VStack {
                    TextField("비밀번호 확인", text: $repassword)
                        .frame(width:299)
                        .foregroundColor(mainColor)
                    Rectangle()
                        .frame(width:299, height:2)
                        .foregroundColor(mainColor)
                }
            }
        }
        Spacer()
            .frame(height:280)
        Button {
            if password == repassword {
                viewModel.signUpData.password = password
            } else {
                print("Passwords do not match")
            }
        } label: {
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
    }
}

#Preview {
    ThirdView(viewModel: SignUpViewModel())
}
