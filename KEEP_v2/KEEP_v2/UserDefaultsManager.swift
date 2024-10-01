//
//  UserDefaultsManager.swift
//  KEEP_v2
//
//  Created by bibiga on 9/10/24.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let userTokenKey = "userToken"
    
    func saveToken(token: String) {
        UserDefaults.standard.set(token, forKey: userTokenKey)
        print("토큰이 성공적으로 저장되었습니다.")
    }
    
    func loadToken() -> String? {
        return UserDefaults.standard.string(forKey: userTokenKey)
    }
    
    func deleteToken() {
        UserDefaults.standard.removeObject(forKey: "userToken")
    }
}
