//
//  StudentSearchViewModel.swift
//  KEEP_v2
//
//  Created by 김주환 on 10/1/24.
//

import Foundation
import Alamofire

class StudentSearchViewModel: ObservableObject {
    @Published var studentData: StudentData?
    @Published var errorMessage: String?

    func searchStudent(grade: String, classNum: String, studentNum: String) {
        let paddedNum = studentNum.count == 1 ? "0\(studentNum)" : studentNum
        let studentId = "\(grade)\(classNum)\(paddedNum)"
        
        let parameters: [String: Any] = [
            "studentId": studentId
        ]
        
        AF.request(StudentfindAPI, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: StudentSearchResponse.self) { response in
                switch response.result {
                case .success(let data):
                    self.studentData = data.data
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
    }
}

struct StudentSearchResponse: Decodable {
    let httpStatus: String
    let message: String
    let data: StudentData
}

struct StudentData: Decodable {
    let id: Int
    let studentName: String
    let imgUrl: String?
    let studentId: String
    let phoneNum: String
    let mail: String
    let status: String
}
