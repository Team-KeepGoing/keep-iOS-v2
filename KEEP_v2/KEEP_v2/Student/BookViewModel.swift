//
//  BookViewModel.swift
//  KEEP_v2
//
//  Created by 김주환 on 9/27/24.
//

import Foundation
import Alamofire

class BookViewModel: ObservableObject {
    @Published var books: [Book] = []

    func fetchBooks() {
        guard let token = UserDefaultsManager.shared.loadToken() else {
            print("토큰이 없습니다.")
            return
        }

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]

        AF.request(BookMyAPI, method: .get, headers: headers).responseDecodable(of: BookResponse.self) { response in
            switch response.result {
            case .success(let bookResponse):
                DispatchQueue.main.async {
                    self.books = bookResponse.data
                }
            case .failure(let error):
                print("책 데이터를 가져오는 중 오류 발생: \(error.localizedDescription)")
            }
        }
    }
}

struct Book: Codable, Identifiable {
    let id: Int
    let bookName: String
    let writer: String
    let imageUrl: String
    let registrationDate: String
    let rentDate: String
    let state: String
    
    var truncatedRentDate: String {
        return String(rentDate.prefix(10))
    }
    
    var truncatedRegistrationDate: String {
        return String(registrationDate.prefix(10))
    }
}

struct BookResponse: Codable {
    let httpStatus: String
    let message: String
    let data: [Book]
}
