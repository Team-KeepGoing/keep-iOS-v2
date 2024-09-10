//
//  StartView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/5/24.
//

import SwiftUI

struct StartView: View {
    @State private var isActive = false
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationStack {
            Spacer()
            
            Image("keeplogo")
                .resizable()
                .scaledToFit()
                .frame(width:187,height: 84)
                .padding(.bottom, 256)
            
            
            VStack(spacing: 13) {
                NavigationLink(destination: SelectView(viewModel: viewModel)) {
                    Rectangle()
                        .frame(width: 354, height: 62)
                        .cornerRadius(15)
                        .foregroundColor(mainColor)
                        .overlay {
                            Text("시작하기")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                        }
                }
                .simultaneousGesture(TapGesture().onEnded {
                    isActive = true
                })
                HStack {
                    Text("이미 계정이 있으신가요?")
                        .foregroundColor(textColor)
                        .font(.system(size: 16, weight: .regular))
                    NavigationLink(destination: LoginView()) {
                        Text("로그인하기")
                            .foregroundColor(mainColor)
                            .font(.system(size: 16, weight: .bold))
                    }
                }
            }
            .padding(.bottom, 32)
        }
    }
}

#Preview {
    StartView()
}
