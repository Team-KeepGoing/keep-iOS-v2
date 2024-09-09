//
//  SignUpViewModel.swift
//  KEEP_v2
//
//  Created by bibiga on 9/9/24.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var signUpData = SignUpData(name: "", email: "", password: "", isTeacher: false)
}
