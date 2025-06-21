//
//  SignupViewModel.swift
//  assignment
//
//  Created by 이예지 on 3/30/25.
//


import Foundation
import SwiftUI

class SignupViewModel: ObservableObject {
    @Published var user: SignupModel = SignupModel(nickname: "", email: "", password: "")
    
    private let keychainService = KeychainService.shared
    
    @AppStorage("signupNickname") var storedNickname: String = ""
    @AppStorage("signupEmail") var storedEmail: String = ""
    @AppStorage("signupPassword") var storedPassword: String = ""
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("lastLoggedInEmail") var lastLoggedInEmail: String = ""
    
    func updateUser() {
        guard user.nickname.count > 0, user.email.count > 0, user.password.count > 0 else {
            print("입력값이 부족합니다. 저장하지 않음")
            return
        }
        
        storedNickname = user.nickname
        storedEmail = user.email
        storedPassword = user.password
        
        let success = keychainService.saveUserCredentials(email: user.email, password: user.password)
        
        if success {
            isLoggedIn = true
            lastLoggedInEmail = user.email
            
            print("회원가입 성공!")
            print("AppStorage 저장 완료")
            print("키체인 저장 완료")
            print("자동 로그인 완료")
        } else {
            print("키체인 저장 실패")
        }
    }
}
