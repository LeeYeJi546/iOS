//
//  Signup.swift
//  assignment
//
//  Created by 이예지 on 3/30/25.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel = SignupViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @FocusState private var isNNFocused: Bool
    @FocusState private var isEMFocused: Bool
    @FocusState private var isNBFocused: Bool

    
    
    var body: some View {
        VStack (alignment:.leading) {
            Spacer().frame(height: 210)
            
            TextField("닉네임", text:$viewModel.user.nickname)
                    .font(.PretendardLight14)
                    .focused($isNNFocused)
                        
            Divider()
                .background(isNNFocused ? Color.green01 : Color.gray07)
                    
            Spacer()
                .frame(height: 47)
                        
            TextField("이메일", text:$viewModel.user.email)
                    .font(.PretendardLight14)
                    .focused($isEMFocused)
                    
            Divider()
                .background(isEMFocused ? Color.green01 : Color.gray07)

            Spacer()
                .frame(height: 47)
            
            TextField("비밀번호", text:$viewModel.user.password)
                .font(.PretendardLight14)
                .focused($isNBFocused)
            
            Divider()
                .background(isNBFocused ? Color.green01 : Color.gray07)
            
            Spacer()
                .frame(height: 300)
            
            Button(action: {
                viewModel.updateUser()
                if viewModel.isLoggedIn {
                    dismiss()
                }
            }) {
                Image(.signup)
                    .resizable()
                    .frame(maxWidth: .infinity, minHeight: 54)
                    
                    }
                }
                .frame(maxWidth:402,maxHeight:180)
                .padding(.horizontal, 16)
        
                .navigationTitle("가입하기")
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "chevron.left")
                                        .renderingMode(.template)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                        .padding(.horizontal, 19)
            }
        }

#Preview {
    SignupView()
}
