//
//  TeacherHomeView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/10/24.
//

import SwiftUI

struct TeacherHomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("사용할 서비스를 선택해 주세요")
                        .foregroundColor(textColor)
                        .font(.system(size: 23, weight: .semibold))
                    Text("이용할 서비스를 선택해 주세요")
                        .foregroundColor(Color(hex: "A6ABAF"))
                        .font(.system(size: 15, weight: .light))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 47)
                
                Spacer()
                    .frame(height: 61)
                
                HStack(spacing: 30) {
                    NavigationLink(destination: StudentSearchView()) {
                        Rectangle()
                            .frame(width: 153, height: 159)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 4,x:2,y:2)
                            .overlay {
                                VStack(spacing: 0) {
                                    Image("blueStudent")
                                        .resizable()
                                        .frame(width: 93, height: 93)
                                    Text("긴급 공지")
                                        .foregroundColor(mainColor)
                                        .font(.system(size: 20, weight: .bold))
                                }
                            }
                    }
                    NavigationLink(destination: StudentSearchView()) {
                        Rectangle()
                            .frame(width: 153, height: 159)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 4,x:2,y:2)
                            .overlay {
                                VStack(spacing: 12) {
                                    Image("loudspeaker")
                                        .resizable()
                                        .frame(width: 70, height: 72)
                                    Text("긴급 공지")
                                        .foregroundColor(mainColor)
                                        .font(.system(size: 20, weight: .bold))
                                }
                            }
                    }
                }
                Spacer()
                    .frame(height: 314)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    TeacherHomeView()
}
