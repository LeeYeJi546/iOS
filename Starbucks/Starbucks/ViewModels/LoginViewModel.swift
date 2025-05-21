//
//  ViewModel.swift
//  assignment
//
//  Created by 이예지 on 3/26/25.
//

import SwiftUI

class LoginViewModel : ObservableObject {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("signupEmail") var storedEmail: String = ""
    @AppStorage("signupPassword") var storedPassword: String = ""
    
    @Published var id = ""
    @Published var pwd = ""
 
    func login() {
        guard !id.isEmpty, !pwd.isEmpty else {
                    print("로그인 정보를 입력해주세요.")
                    return
                }

        if id == storedEmail && pwd == storedPassword {
            isLoggedIn = true
            print("로그인 성공")
        } else {
            print("로그인 실패")
        }
    }
    
}



