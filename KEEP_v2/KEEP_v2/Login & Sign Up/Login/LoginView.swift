//
//  LoginView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/10/24.
//

import SwiftUI
import Alamofire

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showHomeView = false
    
    var body: some View {
        Spacer()
        VStack(alignment:.leading, spacing:17) {
            VStack(alignment: .leading) {
                Text("로그인 하기 위한")
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(textColor)
                Text("이메일과 비밀번호를")
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(textColor)
                Text("정확히 입력해 주세요")
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(textColor)
            }
            .padding(.bottom,30)
            VStack(spacing:13) {
                VStack {
                    TextField("이메일 입력", text: $email)
                        .frame(width:299)
                        .foregroundColor(mainColor)
                    Rectangle()
                        .frame(width:299, height:2)
                        .foregroundColor(mainColor)
                }
                VStack {
                    SecureField("비밀번호 입력", text: $password)
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
        NavigationLink(destination: UserHomeView(), isActive: $showHomeView) {
            EmptyView()
        }
    }
}

#Preview {
    LoginView()
}
