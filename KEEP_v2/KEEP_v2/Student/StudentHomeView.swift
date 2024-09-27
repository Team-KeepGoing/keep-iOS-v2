//
//  StudentHomeView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/10/24.
//

import SwiftUI
import Alamofire

struct StudentHomeView: View {
    @StateObject private var viewModel = DeviceViewModel()
    @StateObject private var bookViewModel = BookViewModel()
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    @State private var selectedBook: Book?
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
                                .shadow(radius: 3, x: 3, y: 3)
                                .overlay {
                                    HStack {
                                        Text("긴급 공지")
                                            .font(.system(size: 18, weight: .bold))
                                            .foregroundColor(Color(hex: "F6556C"))
                                        Text("확인하러 가기")
                                            .font(.system(size: 18, weight: .medium))
                                            .foregroundColor(textColor)
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
                                    .foregroundColor(textColor)
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
                                HStack(spacing: 0) {
                                    Text("회원님")
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(textColor)
                                        .padding(.leading,10)
                                    Text("이 대출중인 책")
                                        .font(.system(size: 15, weight: .semibold))
                                        .foregroundColor(textColor)
                                }
                                .padding(.top, 29)
                            }
                            VStack(alignment: .leading, spacing: 8) {
                                Text("내 상태 전송")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(textColor)
                                    .padding(.leading,10)
                                Rectangle()
                                    .frame(width: 155, height: 191)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 3, x: 3, y:3)
                                    .overlay {
                                        VStack(spacing:25) {
                                            HStack(spacing: 31) {
                                                Button {
                                                    sendStatusToServer(status: "NORMAL")
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
                                                    sendStatusToServer(status: "PAIN")
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
                                                    sendStatusToServer(status: "HEALTHROOM")
                                                } label: {
                                                    VStack(spacing: 8) {
                                                        Image("medc")
                                                            .resizable()
                                                            .frame(width:39, height: 39)
                                                        Text("보건실")
                                                            .foregroundColor(mainColor)
                                                            .font(.system(size: 10.5, weight: .semibold))
                                                    }
                                                }
                                                Button {
                                                    sendStatusToServer(status: "EMERGENCY")
                                                } label: {
                                                    VStack(spacing:11) {
                                                        Image("wari")
                                                            .resizable()
                                                            .frame(width:42, height: 36)
                                                        Text("긴급")
                                                            .foregroundColor(mainColor)
                                                            .font(.system(size: 10.5, weight: .semibold))
                                                    }
                                                }
                                            }
                                        }
                                    }
                            }
                        }
                        .frame(width:500)
                        Rectangle()
                            .frame(width: 346, height: 262)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .shadow(radius: 3, x: 3, y: 3)
                            .overlay {
                                VStack(alignment: .leading,spacing: 28) {
                                    if bookViewModel.books.isEmpty {
                                        Text("대여 중인 책이 없습니다.")
                                            .font(.system(size: 19, weight: .semibold))
                                            .foregroundColor(Color(hex: "7B8086"))
                                    } else {
                                        HStack(spacing:38) {
                                            ForEach(bookViewModel.books) { book in
                                                Button {
                                                    selectedBook = book
                                                } label: {
                                                    Image("testbook")
                                                        .resizable()
                                                        .frame(width: 68, height: 100)
                                                }
                                            }
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading,39)
                                        VStack(alignment: .leading, spacing:11) {
                                            if let selectedBook = selectedBook {
                                                VStack(alignment: .leading, spacing: 3) {
                                                    HStack(spacing:5) {
                                                        Text(selectedBook.bookName)
                                                            .font(.system(size: 17, weight: .semibold))
                                                            .foregroundColor(textColor)
                                                        Text("D-3")
                                                            .font(.system(size: 17, weight: .semibold))
                                                            .foregroundColor(mainColor)
                                                    }
                                                    Text(selectedBook.writer)
                                                        .font(.system(size: 13, weight: .medium))
                                                        .foregroundColor(Color(hex: "8E98A8"))
                                                }
                                                VStack(alignment: .leading, spacing: 8) {
                                                    HStack(spacing: 10) {
                                                        Text("대출일")
                                                            .font(.system(size: 13, weight: .regular))
                                                            .foregroundColor(textColor)
                                                        Text(selectedBook.truncatedRentDate)
                                                            .font(.system(size: 13, weight: .medium))
                                                            .foregroundColor(Color(hex: "3182F7"))
                                                    }
                                                    HStack(spacing: 10) {
                                                        Text("반납 예정일")
                                                            .font(.system(size: 13, weight: .regular))
                                                            .foregroundColor(textColor)
                                                        Text("2024.04.11")
                                                            .font(.system(size: 13, weight: .medium))
                                                            .foregroundColor(Color(hex: "F6556C"))
                                                    }
                                                }
                                            }
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading,23)
                                    }
                                }
                                .onAppear {
                                    bookViewModel.fetchBooks()
                                }
                            }
                            .padding(.bottom, 23)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("기기 대여 현황")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                            Rectangle()
                                .frame(width: 346, height: 338)
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                .shadow(radius: 3, x: 3, y: 3)
                                .overlay {
                                    ScrollView {
                                        VStack(spacing: 30) {
                                            ForEach(viewModel.devices) { device in
                                                HStack(spacing: 10) {
                                                    AsyncImage(url: URL(string: device.imgUrl)) { image in
                                                        image.resizable()
                                                            .frame(width: 70, height: 70)
                                                    } placeholder: {
                                                        ProgressView()
                                                    }
                                                    
                                                    VStack(alignment: .leading, spacing: 6) {
                                                        HStack(spacing: 8) {
                                                            Text(device.deviceName)
                                                                .foregroundColor(Color(hex: "4D5967"))
                                                                .font(.system(size: 17, weight: .semibold))
                                                            Rectangle()
                                                                .frame(width: 48, height: 15)
                                                                .cornerRadius(7)
                                                                .foregroundColor(device.status == "AVAILABLE" ? Color(hex: "5589FE") : Color(hex: "F6556C"))
                                                                .overlay {
                                                                    Text(device.status == "AVAILABLE" ? "대여 가능" : "사용 중")
                                                                        .foregroundColor(.white)
                                                                        .font(.system(size: 10, weight: .regular))
                                                                }
                                                        }
                                                        if(device.status == "AVAILABLE") {
                                                            Text("대여 가능한 상태입니다.")
                                                                .font(.system(size: 11, weight: .regular))
                                                                .foregroundColor(Color(hex: "B0B9C2"))
                                                        } else {
                                                            HStack(spacing: 11) {
                                                                Text("대여 시작일")
                                                                    .foregroundColor(textColor)
                                                                    .font(.system(size: 12, weight: .regular))
                                                                Text(device.truncatedRegDate)
                                                                    .foregroundColor(Color(hex: "4D5967"))
                                                                    .font(.system(size: 13, weight: .medium))
                                                            }
                                                            HStack(spacing: 35) {
                                                                Text("대여자")
                                                                    .foregroundColor(textColor)
                                                                    .font(.system(size: 12, weight: .regular))
                                                                Text(device.maskedBorrower)
                                                                    .foregroundColor(Color(hex: "4D5967"))
                                                                    .font(.system(size: 13, weight: .medium))
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 40)
                                        .padding(.top, 30)
                                    }
                                }
                                .alert(isPresented: $showAlert) {
                                    Alert(title: Text("상태 전송"), message: Text(alertMessage), dismissButton: .default(Text("확인")))
                                }
                        }
                        .onAppear {
                            viewModel.fetchDevices()
                        }
                    } // 스크롤뷰
                } // VStack
                .navigationBarBackButtonHidden(true)
            } // ZStack
        } // NavigationStack
    }
    
    func sendStatusToServer(status: String) {
        let parameters: [String: Any] = [
            "status": status
        ]
        
        guard let token = UserDefaultsManager.shared.loadToken() else {
            print("토큰을 찾을 수 없습니다.")
            alertMessage = "토큰을 찾을 수 없습니다."
            showAlert = true
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
        
        AF.request(UserStatusAPI, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    alertMessage = "상태 전송 완료 !"
                    showAlert = true
                    print("상태 전송 성공: \(status)")
                case .failure(let error):
                    alertMessage = "상태 전송 실패: \(error.localizedDescription)"
                    showAlert = true
                    print("상태 전송 실패: \(error.localizedDescription)")
                }
            }
    }
    
}

#Preview {
    StudentHomeView()
}
