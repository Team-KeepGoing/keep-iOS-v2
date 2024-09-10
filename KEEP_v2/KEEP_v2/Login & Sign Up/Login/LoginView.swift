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
    @State private var navigateToHome: Bool = false
    @State private var isTeacher: Bool = false

    var body: some View {
        VStack {
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
                login()
            } label: {
                Rectangle()
                    .frame(width: 354, height: 62)
                    .cornerRadius(15)
                    .foregroundColor(mainColor)
                    .overlay {
                        Text("로그인")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                    }
            }
            .padding(.bottom, 66)
            NavigationLink(destination: destinationView, isActive: $navigateToHome) {
                EmptyView()
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

    func login() {
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        
        let url = LoginAPI
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("응답 상태: \(response.response?.statusCode ?? -1)")
                print("응답 데이터: \(response.data ?? Data())")
                print("응답 오류: \(response.error?.localizedDescription ?? "없음")")
                
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any],
                       let token = json["token"] as? String,
                       let teacher = json["teacher"] as? Int {
                        print("로그인 성공: \(json)")
                        
                        UserDefaultsManager.shared.saveToken(token: token)
                        
                        DispatchQueue.main.async {
                            isTeacher = (teacher == 1)
                            navigateToHome = true
                        }
                    } else {
                        print("응답 데이터 형식이 올바르지 않습니다.")
                    }
                case .failure(let error):
                    print("로그인 실패: \(error.localizedDescription)")
                }
            }
    }
}

#Preview {
    LoginView()
}
