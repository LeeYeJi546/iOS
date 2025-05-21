//
//  CoffeedetailInfo.swift
//  3rd_assignment
//
//  Created by 이예지 on 4/6/25.
//

import SwiftUI

struct CoffeeDetailInfo: View {
    let coffee: Coffee
    @State private var isHotSelected: Bool = false
    
    // 초기화 시 temperatureOptions에 따라 기본 온도 옵션 설정
    init(coffee: Coffee) {
        self.coffee = coffee
        
        // temperatureOptions 기반으로 초기 온도 설정
        if coffee.temperatureOptions.contains(.hotOnly) {
            _isHotSelected = State(initialValue: true)
        } else if coffee.temperatureOptions.contains(.icedOnly) {
            _isHotSelected = State(initialValue: false)
        } else if coffee.temperatureOptions.contains(.hot) && coffee.temperatureOptions.contains(.iced) {
            // 둘 다 가능한 경우 기본값은 false (ICED)
            _isHotSelected = State(initialValue: false)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // 1. 이미지
                Image(coffee.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor(red: 0.13, green: 0.33, blue: 0.25, alpha: 1.0)))
                
                VStack(alignment: .leading, spacing: 16) {
                    // 2. 메뉴 이름
                    HStack {
                        Text(coffee.titleText)
                            .font(.PretendardSemiBold24)
                        Image(.new)
                    }
                    
                    // 3. 영문 이름
                    Text(coffee.nameEng)
                        .font(.PretendardSemiBold14)
                        .foregroundStyle(Color.gray)
                    
                    // 4. 메뉴 설명
                    Text(coffee.description)
                        .font(.PretendardSemiBold14)
                        .foregroundStyle(Color.secondary)
                        .padding(.top, 4)
                    
                    // 5. 가격
                    Text("\(coffee.price)원")
                        .font(.PretendardSemiBold24)
                        .padding(.top, 8)
                    
                    // 6. HOT/ICED 선택 버튼 (온도 옵션에 따라 다르게 표시)
                    if coffee.temperatureOptions.contains(.hot) && coffee.temperatureOptions.contains(.iced) {
                        // HOT/ICED 모두 가능한 경우
                        temperatureToggle
                    } else if coffee.temperatureOptions.contains(.hotOnly) {
                        // HOT만 가능한 경우
                        Text(CoffeeTemperature.hotOnly.rawValue)
                            .font(.PretendardBold15)
                            .foregroundStyle(Color.red)
                            .padding(.vertical, 8)
                    } else if coffee.temperatureOptions.contains(.icedOnly) {
                        // ICED만 가능한 경우
                        Text(CoffeeTemperature.icedOnly.rawValue)
                            .font(.PretendardBold15)
                            .foregroundStyle(Color.blue)
                            .padding(.vertical, 8)
                    }
                    
                    // 7. 주문하기 버튼
                    Button(action: {
                        print("주문하기")
                    }) {
                        Image(.order2)
                    }
                    .padding(.top, 24)
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // HOT/ICED 토글 버튼
    private var temperatureToggle: some View {
        HStack {
            Capsule()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 44)
                .overlay(
                    HStack {
                        Capsule()
                            .fill(isHotSelected ? Color.clear : Color.white)
                            .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 36)
                            .shadow(color: isHotSelected ? .clear : .gray.opacity(0.3), radius: 2)
                            .overlay(
                                Text(CoffeeTemperature.iced.rawValue)
                                    .font(.PretendardSemiBold16)
                                    .fontWeight(isHotSelected ? .regular : .semibold)
                                    .foregroundStyle(isHotSelected ? Color.gray : Color.blue)
                            )
                            .onTapGesture {
                                isHotSelected = false
                            }
                        
                        Capsule()
                            .fill(isHotSelected ? Color.white : Color.clear)
                            .frame(width: UIScreen.main.bounds.width / 2 - 40, height: 36)
                            .shadow(color: isHotSelected ? .gray.opacity(0.3) : .clear, radius: 2)
                            .overlay(
                                Text(CoffeeTemperature.hot.rawValue)
                                    .font(.PretendardSemiBold18)
                                    .fontWeight(isHotSelected ? .semibold : .regular)
                                    .foregroundStyle(isHotSelected ? Color.red : Color.gray)
                            )
                            .onTapGesture {
                                isHotSelected = true
                            }
                    }
                )
        }
        .padding(.top, 16)
    }
}

#Preview {
    NavigationView {
        CoffeeDetailInfo(coffee: Coffee(
            titleText: "아이스 카라멜 마끼아또",
            nameEng: "Iced Caramel Macchiato",
            description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
            price: 6100,
            temperatureOptions: [.hot, .iced],
            imageName: "coffeedetail5"
        ))
    }
}
