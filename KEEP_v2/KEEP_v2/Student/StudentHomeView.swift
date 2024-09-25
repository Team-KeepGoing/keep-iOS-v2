//
//  StudentHomeView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/10/24.
//

import SwiftUI
import Alamofire

struct Device: Codable, Identifiable {
    let id: Int
    let deviceName: String
    let imgUrl: String
    let regDate: String
    let rentDate: String?
    let status: String
}

struct DeviceResponse: Codable {
    let httpStatus: String
    let message: String
    let data: [Device]
}

struct StudentHomeView: View {
    @StateObject private var viewModel = DeviceViewModel()
    
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
                        .frame(width:500)
                        Rectangle()
                            .frame(width: 346, height: 262)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .shadow(radius: 3, x: 3, y: 3)
                            .overlay {
                                VStack(alignment: .leading,spacing: 28) {
                                    HStack(spacing:38) {
                                        Button {
                                            
                                        } label: {
                                            Image("testbook")
                                                .resizable()
                                                .frame(width: 68, height: 100)
                                        }
                                        Button {
                                            
                                        } label: {
                                            Image("testbook")
                                                .resizable()
                                                .frame(width: 68, height: 100)
                                        }
                                        Button {
                                            
                                        } label: {
                                            Image("testbook")
                                                .resizable()
                                                .frame(width: 68, height: 100)
                                        }
                                    }
                                    VStack(alignment: .leading, spacing:11) {
                                        VStack(alignment: .leading, spacing: 3) {
                                            HStack(spacing:5) {
                                                Text("나는 너랑 노는게 제일 좋아")
                                                    .font(.system(size: 17, weight: .semibold))
                                                    .foregroundColor(textColor)
                                                Text("D-3")
                                                    .font(.system(size: 17, weight: .semibold))
                                                    .foregroundColor(mainColor)
                                            }
                                            Text("허태완")
                                                .font(.system(size: 13, weight: .medium))
                                                .foregroundColor(Color(hex: "8E98A8"))
                                        }
                                        VStack(alignment: .leading, spacing: 8) {
                                            HStack(spacing: 10) {
                                                Text("대출일")
                                                    .font(.system(size: 13, weight: .regular))
                                                    .foregroundColor(textColor)
                                                Text("2024.03.28")
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
                                                                .foregroundColor(device.status == "AVAILABLE" ? Color.green : Color.red)
                                                                .overlay {
                                                                    Text(device.status == "AVAILABLE" ? "대여 가능" : "사용 중")
                                                                        .foregroundColor(.white)
                                                                        .font(.system(size: 10, weight: .regular))
                                                                }
                                                        }
                                                        HStack(spacing: 11) {
                                                            Text("대여 시작일")
                                                                .foregroundColor(textColor)
                                                                .font(.system(size: 12, weight: .regular))
                                                            Text(device.regDate)
                                                                .foregroundColor(Color(hex: "4D5967"))
                                                                .font(.system(size: 13, weight: .medium))
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 40)
                                        .padding(.top, 30)
                                    }
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
}

class DeviceViewModel: ObservableObject {
    @Published var devices: [Device] = []
    
    func fetchDevices() {
        guard let token = UserDefaultsManager.shared.loadToken() else {
            print("토큰이 없습니다.")
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(DeviceListAPI, method: .get, headers: headers).responseDecodable(of: DeviceResponse.self) { response in
            switch response.result {
            case .success(let deviceResponse):
                DispatchQueue.main.async {
                    self.devices = deviceResponse.data
                }
            case .failure(let error):
                print("Error fetching devices: \(error)")
            }
        }
    }
}

#Preview {
    StudentHomeView()
}
