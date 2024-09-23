//
//  NameSearchView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/22/24.
//

import SwiftUI

struct NameSearchView: View {
    var body: some View {
        ZStack {
            Color(hex:"F9FAFC")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 35) {
                Text("'김주환' 학생 검색 결과")
                    .font(.system(size: 25, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(textColor)
                    .padding(.leading, 36)
                    .padding(.top, 50)
                ScrollView {
                    HStack(spacing:27) {
                        Rectangle()
                            .frame(width: 150, height: 176)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 2)
                            .overlay {
                                VStack(spacing: 6) {
                                    Image("StudentProfile")
                                        .resizable()
                                        .frame(width: 81.7,height: 84)
                                    Text("김주환")
                                        .foregroundColor(textColor)
                                        .font(.system(size: 20, weight: .bold))
                                    Text("2학년 2반 8번")
                                        .font(.system(size: 17, weight: .regular))
                                }
                            }
                        Rectangle()
                            .frame(width: 150, height: 176)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 2)
                            .overlay {
                                VStack(spacing: 6) {
                                    Image("StudentProfile")
                                        .resizable()
                                        .frame(width: 81.7,height: 84)
                                    Text("김주환")
                                        .font(.system(size: 20, weight: .bold))
                                    Text("2학년 2반 8번")
                                        .font(.system(size: 17, weight: .regular))
                                }
                            }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    NameSearchView()
}
