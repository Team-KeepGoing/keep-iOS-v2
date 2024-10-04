//
//  StudentSearchView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/12/24.
//

import SwiftUI
import Alamofire

struct StudentSearchView: View {
    @StateObject private var viewModel = StudentSearchViewModel()
    
    let ScGrades = ["1", "2", "3"]
    let ScClass = ["1", "2", "3", "4"]
    let ScNum = Array(1...20).map { String($0) }
    
    @State private var SearchName: String = ""
    
    @State private var selectedGrade: String = "2"
    @State private var selectedClass: String = "2"
    @State private var selectedNum: String = "2"
    
    @State private var isNavigatingByName: Bool = false
    @State private var isNavigatingById: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "F9FAFC")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack(spacing: 29) {
                        Text("학생정보 검색")
                            .font(.system(size: 25, weight: .semibold))
                            .foregroundColor(textColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 39)
                        
                        VStack {
                            HStack(spacing: 141) {
                                TextField("이름을 입력해주세요", text: $SearchName)
                                    .frame(width: 150)
                                    .padding(.leading, 39)
                                
                                Button {
                                    if !SearchName.isEmpty {
                                        // 이름으로 학생 검색
                                        viewModel.searchStudentByName(SearchName)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                            if let studentData = viewModel.studentData, !studentData.isEmpty {
                                                // 검색된 학생이 있을 경우에만 네비게이션 처리
                                                isNavigatingByName = true
                                            }
                                        }
                                    }
                                } label: {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .frame(width: 26, height: 26)
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Rectangle()
                                .frame(width: 325, height: 2)
                                .foregroundColor(textColor)
                        }
                    }
                    
                    Text("검색할 학번 입력")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(textColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 39)
                        .padding(.top, 40)
                        .padding(.bottom, 25)
                    
                    VStack(spacing: 21) {
                        VStack(spacing: 0) {
                            Text("학년")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(textColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 39)
                            
                            Picker("학년 선택", selection: $selectedGrade) {
                                ForEach(ScGrades, id: \.self) { grade in
                                    Text(grade).tag(grade)
                                }
                            }
                            .pickerStyle(.inline)
                            .frame(width: 330, height: 100)
                        }
                        
                        VStack(spacing: 0) {
                            Text("반")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(textColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 39)
                            
                            Picker("반 선택", selection: $selectedClass) {
                                ForEach(ScClass, id: \.self) { grade in
                                    Text(grade).tag(grade)
                                }
                            }
                            .pickerStyle(.inline)
                            .frame(width: 330, height: 100)
                        }
                        
                        VStack(spacing: 0) {
                            Text("번호")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(textColor)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 39)
                            
                            Picker("번호 선택", selection: $selectedNum) {
                                ForEach(ScNum, id: \.self) { grade in
                                    Text(grade).tag(grade)
                                }
                            }
                            .pickerStyle(.inline)
                            .frame(width: 330, height: 100)
                        }
                    }
                    
                    Button(action: {
                        // 학번으로 검색
                        viewModel.searchStudent(grade: selectedGrade, classNum: selectedClass, studentNum: selectedNum)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if viewModel.singleStudentData != nil {
                                isNavigatingById = true
                            }
                        }
                    }) {
                        Rectangle()
                            .frame(width: 354, height: 62)
                            .cornerRadius(15)
                            .foregroundColor(mainColor)
                            .overlay {
                                Text("검색하기")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25, weight: .bold))
                            }
                            .padding(.top, 15)
                    }
                    
                    NavigationLink(destination: StudentInfoView(studentData: viewModel.singleStudentData ?? StudentData(id: 0, studentName: "", imgUrl: nil, studentId: "", phoneNum: "", mail: "", status: "")), isActive: $isNavigatingById) {
                        EmptyView()
                    }
                    
                    NavigationLink(destination: NameSearchView(), isActive: $isNavigatingByName) {
                        EmptyView()
                    }
                }
            }
        }
    }
}

#Preview {
    StudentSearchView()
}
