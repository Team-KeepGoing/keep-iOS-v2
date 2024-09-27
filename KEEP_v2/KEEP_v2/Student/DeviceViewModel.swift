//
//  DeviceViewModel.swift
//  KEEP_v2
//
//  Created by 김주환 on 9/27/24.
//

import Foundation
import Alamofire

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

struct Device: Codable, Identifiable {
    let id: Int
    let deviceName: String
    let imgUrl: String
    let borrower: String
    let regDate: String
    let rentDate: String?
    let status: String
    
    var truncatedRegDate: String {
        return String(regDate.prefix(10))
    }
    
    var maskedBorrower: String {
        guard !borrower.isEmpty else { return "" } // 빈 이름 처리
        let firstChar = borrower.prefix(1) // 첫 글자
        let masked = String(repeating: "*", count: max(0, borrower.count - 1)) // 나머지 글자
        return firstChar + masked
    }
}

struct DeviceResponse: Codable {
    let httpStatus: String
    let message: String
    let data: [Device]
}
