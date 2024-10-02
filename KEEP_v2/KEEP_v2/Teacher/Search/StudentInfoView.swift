//
//  StudentInfoView.swift
//  KEEP_v2
//
//  Created by 김주환 on 9/23/24.
//

import SwiftUI

struct StudentInfoView: View {
    let studentData: StudentData
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "F9FAFC")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("학생 정보")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(textColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 39)
                        .padding(.bottom, 40)
                    
                    Rectangle()
                        .frame(width: 308, height: 520)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .shadow(radius: 0.5)
                        .overlay {
                            VStack(spacing: 26) {
                                VStack(spacing: 25) {
                                    AsyncImage(url: URL(string: studentData.imgUrl ?? "")) { image in
                                        image.resizable()
                                            .frame(width: 172, height: 172)
                                            .clipShape(Circle())
                                    } placeholder: {
                                        Circle()
                                            .frame(width: 172, height: 172)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    VStack(spacing: 7) {
                                        Text(studentData.studentName)
                                            .font(.system(size: 36, weight: .semibold))
                                            .foregroundColor(textColor)
                                        
                                        Text("\(studentData.studentId)")
                                            .font(.system(size: 23, weight: .regular))
                                            .foregroundColor(textColor)
                                        
                                        Text(studentData.phoneNum)
                                            .font(.system(size: 23, weight: .regular))
                                            .foregroundColor(textColor)
                                    }
                                }
                                
                                VStack(spacing: 11) {
                                    Button {
                                        if let phoneURL = URL(string: "tel:\(studentData.phoneNum)") {
                                            if UIApplication.shared.canOpenURL(phoneURL) {
                                                UIApplication.shared.open(phoneURL)
                                            }
                                        }
                                    } label: {
                                        Rectangle()
                                            .frame(width: 261, height: 50)
                                            .foregroundColor(mainColor)
                                            .cornerRadius(10)
                                            .overlay {
                                                HStack(spacing: 0) {
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
                                        if let smsURL = URL(string: "sms:\(studentData.phoneNum)") {
                                            if UIApplication.shared.canOpenURL(smsURL) {
                                                UIApplication.shared.open(smsURL)
                                            }
                                        }
                                    } label: {
                                        Rectangle()
                                            .frame(width: 261, height: 50)
                                            .foregroundColor(mainColor)
                                            .cornerRadius(10)
                                            .overlay {
                                                HStack(spacing: 2) {
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
                    
                    VStack(spacing: 3) {
                        Text("학생의 상태는 \"\(statusText(for: studentData.status))\"입니다.")
                            .font(.system(size: 17, weight: .medium))
                            .foregroundColor(textColor)
                        Text("8분전 업데이트됨")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(Color(hex: "4D5967"))
                    }
                    .padding(.top, 25)
                }
            }
        }
    }
    func statusText(for status: String) -> String {
        switch status {
        case "NORMAL":
            return "정상"
        case "PAIN":
            return "통증"
        case "HEALTHROOM":
            return "보건실"
        case "EMERGENCY":
            return "긴급"
        default:
            return "알 수 없음"
        }
    }
}

#Preview {
    // 예시 데이터 생성
    let exampleStudentData = StudentData(
        id: 1,
        studentName: "김주환",
        imgUrl: "https://example.com/image.jpg",
        studentId: "2학년 2반 8번",
        phoneNum: "010-3852-4644",
        mail: "example@example.com",
        status: "정상"
    )
    StudentInfoView(studentData: exampleStudentData)
}
