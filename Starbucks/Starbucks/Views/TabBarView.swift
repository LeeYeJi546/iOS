//
//  TabView.swift
//  assignment
//
//  Created by 이예지 on 3/30/25.
//

import SwiftUI


struct TabBarView: View {
    var body: some View {
        TabView {
            Tab("Home", image: "home") {
                HomeView()
            }


            Tab("Pay", image: "pay")
                {
            }


            Tab("Order", image: "order") {
                mainOrderView()
            }


            Tab("Shop", image: "shop") {
                ShopView()
            }


            Tab("Other", image: "other") {
                OtherView()
            }
            
        }
        .tint(.green02)
        .onAppear() {
                    UITabBar.appearance().barTintColor = .white
                }
    }
}

#Preview {
    TabBarView()
}
