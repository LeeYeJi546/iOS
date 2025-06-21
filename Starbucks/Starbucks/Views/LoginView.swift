//
//  LoginView.swift
//  assignment
//
//  Created by 이예지 on 3/26/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel: LoginViewModel
    @FocusState private var isIDFocused: Bool
    @FocusState private var isPWDFocused: Bool
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Spacer().frame(height: 90)
                
                mainTopGroup
                
                Spacer()
                
                mainCenterGroup
                
                Spacer()
                
                mainBottomGroup
            }
            .frame(maxWidth: 430)
            .padding(.horizontal, 16)
            
        }
    }
        
        
        private var mainTopGroup: some View {
            VStack (alignment:.leading, spacing: 28){
                Image(.logo)
                    .resizable()
                    .frame(width:97, height:95)
                
                Text("안녕하세요.\n스타벅스입니다.")
                    .font(.PretendardBold24)
                    .kerning(2)
                
                Text("회원 서비스 이용을 위해 로그인해주세요")
                    .font(.PretendardMedium16)
                    .foregroundStyle(Color.gray01)
                    .frame(maxWidth:402,alignment:.leading)
            }
        }
        
        private var mainCenterGroup: some View {
            VStack(alignment:.leading) {
                TextField("아이디", text:$loginViewModel.id)
                    .font(.PretendardLight14)
                    .focused($isIDFocused)
                
                Divider()
                    .background(isIDFocused ? Color.green01 : Color.gray07)
                
                Spacer()
                    .frame(height: 47)
                
                SecureField("비밀번호", text:$loginViewModel.pwd)
                    .font(.PretendardLight14)
                    .focused($isPWDFocused)
                
                Divider()
                    .background(isPWDFocused ? Color.green01 : Color.gray07)
                
                Spacer()
                    .frame(height: 47)
                Button(action: {
                    loginViewModel.login()
                }) {
                    Image(.login)
                        .resizable()
                        .frame(maxWidth: .infinity, minHeight: 46)
                    
                }
            }
            .frame(maxWidth:402,maxHeight:180)
        }
        
        private var mainBottomGroup: some View {
            VStack(spacing: 19) {
                NavigationLink(destination: SignupView()){
                    Text("이메일로 회원가입하기")
                        .foregroundColor(.gray05)
                        .font(.PretendardRegular12)
                        .underline()
                }
                Button(action: {
                    print("카카오로 로그인하는 중•••")
                }) {
                    Image(.kakao)
                        .resizable()
                        .frame(width: 306, height: 45)
                }
                Button(action: {
                    print("Apple로 로그인하는 중•••")
                }) {
                    Image(.apple)
                        .resizable()
                        .frame(width: 306, height: 45)
                    
                    
                }
            }
        }
    }
        
 #Preview {
     LoginView()
 }
 
