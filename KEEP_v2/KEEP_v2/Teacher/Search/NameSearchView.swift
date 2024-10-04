//
//  NameSearchView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/22/24.
//
import SwiftUI

struct NameSearchView: View {
    @StateObject private var viewModel = StudentSearchViewModel()
    var searchedName: String  // 검색된 이름 전달받기
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "F9FAFC").edgesIgnoringSafeArea(.all)
                VStack(spacing: 35) {
                    Text("'\(searchedName)' 학생 검색 결과")
                        .font(.system(size: 25, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(textColor)
                        .padding(.leading, 36)
                        .padding(.top, 50)
                    
                    ScrollView {
                        if let students = viewModel.studentData {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                ForEach(students, id: \.id) { student in
                                    NavigationLink(destination: StudentInfoView(studentData: student)) {
                                        Rectangle()
                                            .frame(width: 150, height: 176)
                                            .foregroundColor(.white)
                                            .cornerRadius(15)
                                            .shadow(radius: 2)
                                            .overlay {
                                                VStack(spacing: 6) {
                                                    AsyncImage(url: URL(string: student.imgUrl ?? "")) { image in
                                                        image.resizable()
                                                            .frame(width: 81.7, height: 84)
                                                    } placeholder: {
                                                        Image("StudentProfile")
                                                            .resizable()
                                                            .frame(width: 81.7, height: 84)
                                                    }
                                                    Text(student.studentName)
                                                        .foregroundColor(textColor)
                                                        .font(.system(size: 20, weight: .bold))
                                                    Text(student.studentId)
                                                        .font(.system(size: 17, weight: .regular))
                                                        .foregroundColor(Color(hex: "4D5969"))
                                                }
                                            }
                                    }
                                }
                            }
                            .padding()
                        } else {
                            Text("검색 결과가 없습니다.")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.searchStudentByName(searchedName)
            }
        }
    }
}


#Preview {
    NameSearchView(searchedName: "김주환")
}

