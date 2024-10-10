//
//  QrView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/12/24.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import Alamofire

struct QrView: View {
    @State private var qrCodeImage: Image?
    @State private var errorMessage: String?
    
    @State private var qrCodeGenerated: Bool = false
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("QR 대여")
                    .font(.system(size: 25, weight: .semibold))
                Spacer()
                    .frame(height:30)
                VStack(alignment: .leading) {
                    Text("도서관에 배치 되어 있는")
                    Text("QR코드 인식기에")
                    Text("QR을 인식해주세요!")
                }
                .font(.system(size: 20, weight: .regular))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 50)
            
            Spacer()
                .frame(height:50)
            
            VStack {
                if let qrCodeImage = qrCodeImage {
                    qrCodeImage
                        .resizable()
                        .interpolation(.none)
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    Text("QR 코드가 생성되지 않았습니다.")
                }
                
                if qrCodeGenerated {
                    VStack {
                        Text("해당 회원님의 고유 QR이며")
                        HStack(spacing: 4) {
                            Text("앱 재부팅 시")
                            Text("변경될 예정")
                                .underline()
                            Text("입니다.")
                        }
                    }
                    .foregroundColor(mainColor)
                    .font(.system(size: 15, weight: .regular))
                    .padding()
                } else {
                    Button {
                        fetchUserEmailAndGenerateQRCode()
                    } label: {
                        Text("QR코드 생성")
                            .foregroundColor(mainColor)
                            .font(.system(size: 15, weight: .regular))
                    }
                    .padding()
                }
            }
            Spacer()
                .frame(height: 100)
        }
    }
    
    func fetchUserEmailAndGenerateQRCode() {
        guard let token = UserDefaultsManager.shared.loadToken() else {
            print("토큰이 저장되어 있지 않습니다.")
            errorMessage = "토큰이 저장되어 있지 않습니다."
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(UserInfoAPI, method: .get, headers: headers).responseDecodable(of: UserInfo.self) { response in
            switch response.result {
            case .success(let userInfo):
                generateQRCode(from: userInfo.email)
                qrCodeGenerated = true
                
            case .failure(let error):
                print("유저 정보를 불러오는 중 오류 발생: \(error)")
                errorMessage = "유저 정보를 불러오는 중 오류가 발생했습니다."
            }
        }
    }
    
    func generateQRCode(from string: String) {
        let filter = CIFilter.qrCodeGenerator()
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        guard let ciImage = filter.outputImage else { return }
        
        let context = CIContext()
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        qrCodeImage = Image(uiImage: uiImage)
    }
}

struct UserInfo: Codable {
    let email: String
}

#Preview {
    QrView()
}
