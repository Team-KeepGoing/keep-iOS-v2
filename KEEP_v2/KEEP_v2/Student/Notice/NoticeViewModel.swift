//
//  NoticeViewModel.swift
//  KEEP_v2
//
//  Created by 김주환 on 9/25/24.
//
import Foundation
import Alamofire

class NoticeViewModel: ObservableObject {
    @Published var notices: [Notice] = []
    
    init() {
        fetchNotices()
    }
    
    func fetchNotices() {
        guard let token = UserDefaultsManager.shared.loadToken() else {
            print("토큰을 불러오지 못했습니다.")
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(NoticeListAPI, headers: headers).responseDecodable(of: NoticeResponse.self) { response in
            switch response.result {
            case .success(let noticeResponse):
                self.notices = noticeResponse.data
            case .failure(let error):
                print("Error fetching notices: \(error)")
            }
        }
    }
}

struct Notice: Identifiable, Decodable {
    let id: Int
    let message: String
    let teacherName: String
    let createTime: String
    let editTime: String
}

struct NoticeResponse: Decodable {
    let httpStatus: String
    let message: String
    let data: [Notice]
}
