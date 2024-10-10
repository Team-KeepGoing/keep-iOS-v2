//
//  MypageViewModel.swift
//  KEEP_v2
//
//  Created by 김주환 on 9/30/24.
//

import SwiftUI
import Alamofire

class MypageViewModel: ObservableObject {
    @Published var borrowedBooks: [BorrowedBook] = []
    @Published var borrowedDevices: [BorrowedDevice] = []
    @Published var name: String = ""
    
    func fetchData() {
        guard let token = UserDefaultsManager.shared.loadToken() else {
            print("토큰을 불러오지 못했습니다.")
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(UserInfoAPI, method: .get, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                print("전체 JSON 값: \(value)")
                if let json = value as? [String: Any],
                   let books = json["borrowedBooks"] as? [[String: Any]],
                   let devices = json["borrowedDevices"] as? [[String: Any]],
                   let name = json["name"] as? String {
                    
                    self.name = name
                    
                    self.borrowedBooks = books.compactMap { dict in
                        guard let id = dict["id"] as? Int,
                              let bookName = dict["bookName"] as? String,
                              let imageUrl = dict["imageUrl"] as? String,
                              let rentDate = dict["rentDate"] as? String else { return nil }
                        return BorrowedBook(id: id, bookName: bookName, imageUrl: imageUrl, rentDate: rentDate)
                    }
                    
                    self.borrowedDevices = devices.compactMap { dict in
                        guard let id = dict["id"] as? Int,
                              let deviceName = dict["deviceName"] as? String,
                              let imgUrl = dict["imgUrl"] as? String,
                              let rentDate = dict["rentDate"] as? String else { return nil }
                        return BorrowedDevice(id: id, deviceName: deviceName, imgUrl: imgUrl, rentDate: rentDate)
                    }
                    
                } else {
                    print("JSON 형식이 맞지 않습니다.")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}


struct BorrowedBook: Identifiable {
    let id: Int
    let bookName: String
    let imageUrl: String
    let rentDate: String
}

struct BorrowedDevice: Identifiable {
    let id: Int
    let deviceName: String
    let imgUrl: String
    let rentDate: String
}
