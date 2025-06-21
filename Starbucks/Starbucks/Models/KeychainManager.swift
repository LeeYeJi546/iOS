//
//  KeychainManager.swift
//  Starbucks
//
//  Created by 이예지 on 6/21/25.
//

import Foundation
import Security

class KeychainService {
    static let shared = KeychainService()
    
    private let service = "com.starbucks.assignment"
    
    private init() {}
    
    /// Keychain에 사용자의 비밀번호를 저장.
    /// 이미 동일한 계정과 서비스 조합의 항목이 존재할 때, 기존 항목을 삭제하고 새로 저장.
    @discardableResult
    func savePasswordToKeychain(account: String, service: String, password: String) -> OSStatus {
        // 1. 저장할 데이터를 Data 타입으로 변환
        guard let passwordData = password.data(using: .utf8) else {
            return errSecParam // 잘못된 데이터
        }
        // 2. Keychain Item 딕셔너리 구성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service,
            kSecValueData as String: passwordData,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
        ]
        // 3. 이미 같은 항목이 있다면 삭제
        SecItemDelete(query as CFDictionary)
        // 4. 새 항목 추가
        let status = SecItemAdd(query as CFDictionary, nil)
        return status
    }
    
    /// Keychain에서 저장된 데이터를 불러옴
    @discardableResult
    func load(account: String, service: String) -> String? {
        // 1. 검색 쿼리 구성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        // 2. 검색 결과 저장 변수
        var item: CFTypeRef?
        // 3. Keychain에서 항목 검색
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        // 4. 상태 확인 및 결과 처리
        guard status == errSecSuccess else {
            print("Keychain load 실패 - status: \(status)")
            return nil
        }
        // 5. Data → String 변환
        guard let data = item as? Data,
              let result = String(data: data, encoding: .utf8) else {
            print("Keychain load 실패 - 데이터 디코딩 실패")
            return nil
        }
        return result
    }
    

    @discardableResult
    func delete(account: String, service: String) -> OSStatus {
        // 1. 삭제할 항목을 식별할 쿼리 구성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecAttrService as String: service
        ]
        // 2. 항목 삭제 시도
        let status = SecItemDelete(query as CFDictionary)
        // 3. 상태 확인 및 로그 출력
        if status == errSecSuccess {
            print("Keychain 삭제 성공 - [\(service) : \(account)]")
        } else if status == errSecItemNotFound {
            print("Keychain 항목 없음 - [\(service) : \(account)]")
        } else {
            print("Keychain 삭제 실패 - status: \(status)")
        }
        return status
    }
    
    
    /// 사용자 로그인 정보를 키체인에 저장
    func saveUserCredentials(email: String, password: String) -> Bool {
        let status = savePasswordToKeychain(account: email, service: service, password: password)
        return status == errSecSuccess
    }
    
    /// 사용자 비밀번호를 키체인에서 불러오기
    func loadUserPassword(email: String) -> String? {
        return load(account: email, service: service)
    }
    
    /// 사용자 로그인 정보를 키체인에서 삭제
    func deleteUserCredentials(email: String) -> Bool {
        let status = delete(account: email, service: service)
        return status == errSecSuccess
    }
}
