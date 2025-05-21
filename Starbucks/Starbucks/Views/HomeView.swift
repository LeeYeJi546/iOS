//
//  HomeView.swift
//  3rd_assignment
//
//  Created by 이예지 on 4/4/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedCoffee: CoffeeModel? = nil
    @State private var selectedDessert: DessertModel? = nil
    @State private var showPopup = false
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                firstbanner
                Image(.bear)
                coffeescroll
                Image(.blooming)
                Image(.buddypass)
                whatsnew
                Image(.hyundai)
                Image(.byul)
                Image(.delivery)
                dessertscroll
                Image(.barifav)
                Image(.smileclub)
            }
        }
        .onAppear {
                    // 뷰가 나타날 때 광고 팝업을 표시
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        showPopup = true
                    }
                }
    }
    
    private var firstbanner: some View {
        ZStack {
            Image(.rabbit)
            VStack(alignment: .leading) {
                Text("골든 미모사 그린 티와 함께\n행복한 새해의 축배를 들어요!")
                    .font(.PretendardSemiBold24)
                    .lineSpacing(6)
                HStack {
                    VStack(alignment: .leading) {
                        Text("11★ until next Reward")
                            .foregroundStyle(Color.brown02)
                            .font(.PretendardSemiBold16)
                        ZStack(alignment: .leading) {
                            Image(.rewardbar1)
                            Image(.rewardbar2)
                        }
                    }
                    Spacer()
                        .frame(width: 30)
                    Text("1")
                        .font(.PretendardSemiBold38)
                    Text("/")
                        .font(.PretendardLight38)
                        .foregroundStyle(Color.gray01)
                    Image(.twelve)
                }
            }
        }
    }
    
    private var coffeescroll : some View {
        
        VStack() {
            HStack {
                Text("(설정한 닉네임)님을 위한 추천 메뉴")
                    .font(.PretendardRegular24)
                Spacer()
                    .frame(width: 40)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 36) {
                                ForEach(viewModel.coffeeDetailList) { coffee in
                                    NavigationLink(destination: CoffeeDetailInfo(coffee: coffee)) {
                                        CircleImageCard(model: coffee)
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
    
    private var whatsnew : some View {
        VStack() {
            Text("What's New")
                .font(.PretendardRegular24)
            ScrollView {
                HStack(spacing: 36) {
                    ForEach(viewModel.WhatsNewList) { item in
                        RectangleImageCard(model: item)
                    }
                }
            }
        }
    }
    
    private var dessertscroll : some View {
        
        VStack() {
            HStack {
                Text("하루가 달콤해지는 디저트")
                    .font(.PretendardSemiBold24)
                Spacer()
                    .frame(width: 130)
            }
            ScrollView {
                HStack(spacing: 36) {
                    ForEach(viewModel.DessertList) { dessert in
                        Button {
                            selectedDessert = dessert
                        } label: {
                            CircleImageCard(model:dessert)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
