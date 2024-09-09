//
//  FirstView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/5/24.
//

import SwiftUI

struct FirstView: View {
    @State private var name: String = ""
    var body: some View {
        Spacer()
        VStack(alignment:.leading, spacing:17) {
            VStack(alignment: .leading) {
                Text("회원가입을 위해")
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(textColor)
                Text("이름을 입력해 주세요")
                    .font(.system(size: 23, weight: .semibold))
                    .foregroundColor(textColor)
            }
            VStack(alignment: .leading) {
                Text("올바른 이름을 입력해 주세요.")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(Color(hex: "#A6ABAF"))
                Text("ex) 홍길동")
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(Color(hex: "#A6ABAF"))
            }
            .padding(.bottom,20)
            VStack {
                TextField("이름을 입력해 주세요", text: $name)
                    .frame(width:299)
                    .foregroundColor(mainColor)
                Rectangle()
                    .frame(width:299, height:2)
                    .foregroundColor(mainColor)
            }
        }
        Spacer()
            .frame(height:322)
        Button {
            
        } label: {
            Rectangle()
                .frame(width:354, height:62)
                .cornerRadius(15)
                .foregroundColor(mainColor)
                .overlay {
                    Text("다음")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                }
        }
        .padding(.bottom, 66)
    }
}

#Preview {
    FirstView()
}
