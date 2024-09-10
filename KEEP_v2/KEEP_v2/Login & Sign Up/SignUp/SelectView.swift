//
//  SelectView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/5/24.
//

import SwiftUI

struct SelectView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var selectedButton: Int? = nil
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 61) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("유형을 선택해 주세요")
                            .font(.system(size: 23, weight: .semibold))
                            .foregroundColor(textColor)
                        Text("유형에 따라 다른 서비스를 제공합니다.")
                            .font(.system(size: 15, weight: .light))
                            .foregroundColor(Color(hex: "#A6ABAF"))
                    }
                    .padding(.leading, 20)
                    
                    HStack(spacing: 30) {
                        Button {
                            selectedButton = (selectedButton == 1) ? nil : 1
                        } label: {
                            Rectangle()
                                .foregroundColor(selectedButton == 1 ? mainColor : Color.white)
                                .frame(width: 153, height: 159)
                                .cornerRadius(15)
                                .shadow(radius: 4)
                                .overlay {
                                    VStack(spacing: 0) {
                                        Image(selectedButton == 1 ? "whiteStudent" : "blueStudent")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 93)
                                        Text("학생")
                                            .foregroundColor(selectedButton == 1 ? Color.white : mainColor)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                }
                        }
                        Button {
                            selectedButton = (selectedButton == 2) ? nil : 2
                        } label: {
                            Rectangle()
                                .foregroundColor(selectedButton == 2 ? mainColor : Color.white)
                                .frame(width: 153, height: 159)
                                .cornerRadius(15)
                                .shadow(radius: 4)
                                .overlay {
                                    VStack(spacing: 12) {
                                        Image(selectedButton == 2 ? "whiteTeacher" : "blueTeacher")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 81)
                                        Text("교사")
                                            .foregroundColor(selectedButton == 2 ? Color.white : mainColor)
                                            .font(.system(size: 20, weight: .bold))
                                    }
                                    .padding(.top, 10)
                                }
                        }
                    }
                }
                
                Spacer()
                
                NavigationLink(destination: FirstView(viewModel: viewModel)) {
                    Rectangle()
                        .frame(width: 354, height: 62)
                        .cornerRadius(15)
                        .foregroundColor(mainColor)
                        .overlay {
                            Text("다음")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                        }
                }
                .padding(.bottom, 66)
                .disabled(selectedButton == nil)
                .simultaneousGesture(TapGesture().onEnded {
                    viewModel.signUpData.isTeacher = (selectedButton == 2)
                })
            }
        }
    }
}

#Preview {
    SelectView(viewModel: SignUpViewModel())
}
