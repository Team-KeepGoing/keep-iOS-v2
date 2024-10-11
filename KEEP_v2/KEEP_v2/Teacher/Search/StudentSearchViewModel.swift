//
//  StudentSearchViewModel.swift
//  KEEP_v2
//
//  Created by 김주환 on 10/1/24.
//

import Foundation
import Alamofire

class StudentSearchViewModel: ObservableObject {
    @Published var studentData: [StudentData]?  // 배열로 수정 (이름 검색 시 사용)
    @Published var singleStudentData: StudentData?  // 단일 학생 검색 시 사용
    @Published var errorMessage: String?

    // 학번으로 학생 검색
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
                    self.singleStudentData = data.data  // 단일 객체 저장
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
    }

    // 이름으로 학생 검색
    func searchStudentByName(_ name: String) {
        self.studentData = nil
        let parameters: [String: String] = ["studentName": name]

        AF.request(StudentNameAPI, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: NameSearchResponse.self) { response in
                switch response.result {
                case .success(let data):
                    print("Received data: \(data)")
                    DispatchQueue.main.async {
                        self.studentData = data.data  // 배열로 저장
                    }
                case .failure(let error):
                    print("Error: \(error)")
                    DispatchQueue.main.async {
                        self.studentData = nil
                    }
                }
            }
    }
}

// 단일 학생 응답
struct StudentSearchResponse: Decodable {
    let httpStatus: String
    let message: String
    let data: StudentData  // 단일 학생 객체
}

// 이름 검색 응답
struct NameSearchResponse: Decodable {
    let httpStatus: String
    let message: String
    let data: [StudentData]  // 학생 배열
}

// 학생 데이터 구조체
struct StudentData: Identifiable, Decodable {
    let id: Int
    let studentName: String
    let imgUrl: String?
    let studentId: String
    let phoneNum: String
    let mail: String
    let status: String
    let statusTime: String
}
