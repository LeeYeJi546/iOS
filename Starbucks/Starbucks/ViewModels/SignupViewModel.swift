//
//  SignupViewModel.swift
//  assignment
//
//  Created by 이예지 on 3/30/25.
//
import Foundation
import SwiftUI

class SignupViewModel : ObservableObject {
    @Published var user: SignupModel = SignupModel(nickname: "", email: "", password: "")
    
    @AppStorage("signupNickname") var storedNickname: String = ""
    @AppStorage("signupEmail") var storedEmail: String = ""
    @AppStorage("signupPassword") var storedPassword: String = ""
    
    
    func updateUser() {
        guard user.nickname.count > 0, user.email.count > 0, user.password.count > 0 else {
                            print("입력값이 부족합니다. 저장하지 않음")
                            return
                        }
        
        storedNickname = user.nickname
        storedEmail = user.email
        storedPassword = user.password
    }
}
