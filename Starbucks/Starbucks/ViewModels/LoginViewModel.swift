//
//  ViewModel.swift
//  assignment
//
//  Created by 이예지 on 3/26/25.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    // 키체인 서비스 추가
    private let keychainService = KeychainService.shared
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("signupEmail") var storedEmail: String = ""
    @AppStorage("signupPassword") var storedPassword: String = ""
    @AppStorage("signupNickname") var storedNickname: String = ""  // 닉네임도 추가
    @AppStorage("lastLoggedInEmail") var lastLoggedInEmail: String = ""  // 마지막 로그인 이메일
    
    @Published var id = ""
    @Published var pwd = ""
    
    // 앱 시작시 자동 로그인 체크
    init() {
        checkAutoLogin()
    }
    
    // 자동 로그인 체크 함수
    func checkAutoLogin() {
        // 마지막에 로그인한 이메일이 있는지 확인
        guard !lastLoggedInEmail.isEmpty else {
            print("저장된 로그인 정보가 없습니다.")
            return
        }
        
        // 키체인에서 비밀번호 불러오기
        if let savedPassword = keychainService.loadUserPassword(email: lastLoggedInEmail) {
            print("키체인에서 로그인 정보 발견!")
            
            // 자동 로그인 진행
            performAutoLogin(email: lastLoggedInEmail, password: savedPassword)
        } else {
            print("키체인에 저장된 비밀번호가 없습니다.")
        }
    }
    
    // 자동 로그인 실행
    private func performAutoLogin(email: String, password: String) {
        // 기존 AppStorage와 비교해서 검증 (실제로는 서버 API 호출)
        if email == storedEmail && password == storedPassword {
            isLoggedIn = true
            lastLoggedInEmail = email
            print("자동 로그인 성공! 홈 화면으로 이동")
        } else {
            print("자동 로그인 실패 - 정보가 일치하지 않음")
            // 키체인 데이터는 유지하고 AppStorage만 초기화
            lastLoggedInEmail = ""
        }
    }
    
    // 기존 로그인 함수 (키체인 사용하도록 수정)
    func login() {
        guard !id.isEmpty, !pwd.isEmpty else {
            print("로그인 정보를 입력해주세요.")
            return
        }
        
        // 기존 AppStorage와 비교 (실제로는 서버 API 호출)
        if id == storedEmail && pwd == storedPassword {
            // 로그인 성공시 키체인에 저장
            let success = keychainService.saveUserCredentials(email: id, password: pwd)
            
            if success {
                isLoggedIn = true
                lastLoggedInEmail = id
                print("로그인 성공! 키체인에 저장 완료")
            } else {
                print("키체인 저장 실패")
            }
        } else {
            print("로그인 실패 - 아이디 또는 비밀번호가 틀렸습니다.")
        }
    }
    
    // 로그아웃 함수 (키체인은 유지, 로그인 상태만 해제)
    func logout() {
        // 키체인 데이터는 유지 (자동 로그인을 위해)
        // 로그인 상태만 해제
        isLoggedIn = false
        id = ""
        pwd = ""
        
        print("로그아웃 완료 - 키체인 데이터는 유지됨 (자동 로그인용)")
    }
}
