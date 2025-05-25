//
//  OtherView.swift
//  assignment
//
//  Created by 이예지 on 3/30/25.
//

import SwiftUI

struct OtherView: View {
    
    var body: some View {
        ZStack {
            Color(.white01)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Color(.white)
                        .frame(width: 440, height: 110)
                    HStack {
                        Spacer().frame(width:40)
                        Text("Other")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Button(action: {
                            print("로그아웃")
                        }) {
                            Image(.logout)
                                .frame(width: 35, height:35)
                        }
                        Spacer().frame(width:40)
                    }
                    .padding(.top, 30)
                    
                }
                Spacer()
                    .frame(height: 41)
                MainButton
                Pay
                Divider()
                    .frame(width: 350)
                Spacer()
                    .frame(height: 50)
                Support
                Spacer()
                    .frame(height: 41)
            }
        }
    }
    
    
    
    private struct IconButton: View {
        let image: String
        let title: String
        
        init(icon: String, title: String) {
            self.image = icon
            self.title = title
        }
        
        var body: some View {
            Button(action: {
                print(title)
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .frame(width: 102, height: 108)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray03.opacity(0.2), lineWidth: 1)
                        )
                    VStack(spacing: 10) {
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 38, height: 38)
                        
                        Text(title)
                            .font(.PretendardSemiBold14)
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
    private var MainButton: some View {
        VStack {
            Text("(작성한 닉네임)님\n환영합니다! 👋")
                .font(.PretendardSemiBold24)
                .multilineTextAlignment(.center)
                .lineSpacing(9)
                .lineLimit(nil)
            Spacer()
                .frame(height: 50)
            HStack(spacing: 10) {
                IconButton(
                    icon: "star",
                    title: "별 히스토리"
                )
                
                NavigationLink(destination: ReceiptView()) {
                    IconButton(
                    icon: "receipt",
                    title: "전자영수증"
                )
                }
                
                IconButton(
                    icon: "mymenu",
                    title: "나만의 메뉴"
                )
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding(.bottom, 50)
    }
    
    // MenuButton을 별도 구조체로 정의
    private struct MenuButton: View {
        let image: String
        let title: String
        
        init(picture: String, menuName: String) {
            self.image = picture
            self.title = menuName
        }
        
        var body: some View {
            Button(action: {
                print(title)
            }) {
                HStack(spacing: 4) {
                    Image(image)
                        .frame(width: 32, height: 32)
                    Text(title)
                        .font(.PretendardSemiBold14)
                        .foregroundColor(.black)
                }
            }
        }
    }
    
    
    private var Pay: some View {
        VStack(alignment:.leading, spacing: 20) {
            Text("Pay")
                .font(.PretendardSemiBold16)
                .foregroundStyle(.black)
            HStack(alignment: .top, spacing: 100) {
                VStack(alignment: .leading, spacing: 20) {
                    MenuButton(
                        picture: "card",
                        menuName:"스타벅스 카드 등록"
                    )
                    
                    MenuButton(
                        picture: "registration",
                        menuName:"쿠폰 등록"
                    )
                    
                }
                VStack(alignment: .leading, spacing: 20) {
                    MenuButton(
                        picture: "giftcon",
                        menuName:"카드 교환권 등록"
                    )
                    MenuButton(
                        picture: "history",
                        menuName:"쿠폰 히스토리"
                    )
                }
            }
        }
    }
    
    private var Support: some View {
        VStack(alignment:.leading, spacing: 20) {
            Text("고객지원")
                .font(.PretendardSemiBold16)
                .foregroundStyle(.black)
            HStack(alignment: .top, spacing: 120) {
                VStack(alignment: .leading, spacing: 20) {
                    MenuButton(
                        picture: "storecare",
                        menuName:"스토어 케어"
                    )
                    
                    NavigationLink(destination: StoreInfoView()) {
                        MenuButton(
                            picture: "location",
                            menuName:"매장 정보"
                        )
                    }
                    
                    MenuButton(
                        picture: "myreview",
                        menuName:"마이 스타벅스 리뷰"
                    )
                }
                VStack(alignment: .leading, spacing: 20) {
                    MenuButton(
                        picture: "complain",
                        menuName:"고객의 소리"
                    )
                    MenuButton(
                        picture: "return",
                        menuName:"반납기 정보"
                    )
                }
            }
        }
    }
}




    

#Preview {
    NavigationView {
        OtherView()
    }
}
