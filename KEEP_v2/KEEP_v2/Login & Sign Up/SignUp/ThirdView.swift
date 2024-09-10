//
//  ThirdView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/5/24.
//

import SwiftUI
import Alamofire

struct ThirdView: View {
    @StateObject var viewModel: SignUpViewModel
    @State private var password: String = ""
    @State private var repassword: String = ""
    @State private var navigateToHome: Bool = false
    @State private var isTeacher: Bool = false
    @State private var showPasswordMismatchAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 17) {
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
                    .padding(.bottom, 30)
                    VStack(spacing: 13) {
                        VStack {
                            SecureField("비밀번호 입력", text: $password)
                                .frame(width: 299)
                                .foregroundColor(mainColor)
                            Rectangle()
                                .frame(width: 299, height: 2)
                                .foregroundColor(mainColor)
                        }
                        VStack {
                            SecureField("비밀번호 확인", text: $repassword)
                                .frame(width: 299)
                                .foregroundColor(mainColor)
                            Rectangle()
                                .frame(width: 299, height: 2)
                                .foregroundColor(mainColor)
                        }
                    }
                }
                Spacer()
                    .frame(height: 280)
                Button {
                    if password == repassword {
                        viewModel.signUpData.password = password
                        signUp()
                    } else {
                        showPasswordMismatchAlert = true
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
                NavigationLink(destination: destinationView, isActive: $navigateToHome) {
                    EmptyView()
                }
            }
            .alert(isPresented: $showPasswordMismatchAlert) {
                Alert(
                    title: Text("비밀번호 불일치"),
                    message: Text("비밀번호가 일치하지 않습니다. 다시 확인해 주세요."),
                    dismissButton: .default(Text("확인"))
                )
            }
        }
    }
    
    private var destinationView: some View {
        if isTeacher {
            return AnyView(TeacherHomeView())
        } else {
            return AnyView(StudentHomeView())
        }
    }

    func signUp() {
        let signUpData = viewModel.signUpData
        
        let parameters: [String: Any] = [
            "email": signUpData.email,
            "password": signUpData.password,
            "name": signUpData.name,
            "teacher": signUpData.isTeacher
        ]
        
        let url = SignUpAPI
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any],
                       let data = json["data"] as? [String: Any],
                       let token = data["token"] as? String,
                       let teacher = data["teacher"] as? Int {
                        print("회원가입 성공: \(value)")
                        
                        UserDefaultsManager.shared.saveToken(token: token)
                        
                        DispatchQueue.main.async {
                            isTeacher = (teacher == 1)
                            navigateToHome = true
                        }
                    }
                case .failure(let error):
                    print("회원가입 실패: \(error.localizedDescription)")
                }
            }
    }
}

#Preview {
    ThirdView(viewModel: SignUpViewModel())
}
