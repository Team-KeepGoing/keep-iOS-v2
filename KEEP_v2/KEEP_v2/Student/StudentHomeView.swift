//
//  StudentHomeView.swift
//  KEEP_v2
//
//  Created by bibiga on 9/10/24.
//

import SwiftUI

struct StudentHomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex:"F9FAFC")
                    .edgesIgnoringSafeArea(.all)
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    StudentHomeView()
}
