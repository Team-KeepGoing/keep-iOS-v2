//
//  LendLateWaringView.swift
//  KEEP_v2
//
//  Created by 김주환 on 10/5/24.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct LendLateWaringView: View {
    @Binding var isShowing: Bool
    var bookName: String
    var authorName: String
    var rentDate: String
    var returnDate: String
    var imageUrl: String?
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .fill(Color.white)
                .frame(width: 308, height: 396)
                .cornerRadius(23)
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    if let url = imageUrl, let imageURL = URL(string: url) {
                        WebImage(url: imageURL)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 117, height: 188)
                            .padding(.trailing, 19)
                            .clipped()
                    } else {
                        Image("bookPlaceholder")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 117, height: 188)
                            .padding(.trailing, 19)
                            .clipped()
                    }
                    VStack(alignment: .leading, spacing: 15) {
                        VStack(alignment: .leading, spacing: 7) {
                            Text(bookName)
                                .font(.system(size: 20, weight: .semibold))
                            Text(authorName)
                                .font(.system(size: 13, weight: .medium))
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            Text("대출일")
                                .font(.system(size: 13, weight: .regular))
                            Text(rentDate)
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.blue)
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            Text("반납 예정일")
                                .font(.system(size: 13, weight: .regular))
                            Text(returnDate)
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.red)
                        }
                    }
                }
                VStack(alignment: .leading) {
                    Text("회원님이 대출하신 도서")
                        .font(.system(size: 15, weight: .regular))
                    HStack(spacing: 4) {
                        Text("반납 예정일이")
                            .font(.system(size: 15, weight: .regular))
                        Text("하루")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.red)
                        Text("남았습니다.")
                            .font(.system(size: 15, weight: .regular))
                    }
                }
                Button {
                    isShowing = false
                } label: {
                    Rectangle()
                        .fill(Color(hex: "#F2F3F5")) // fill 사용
                        .frame(width: 260, height: 45)
                        .cornerRadius(15)
                        .overlay {
                            Text("닫기")
                                .font(.system(size: 19, weight: .semibold))
                                .foregroundColor(.black)
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    LendLateWaringView(isShowing: .constant(true), bookName: "인간실격",
                       authorName: "디자이 오사무",
                       rentDate: "2024.03.28",
                       returnDate: "2024.04.04")
}

