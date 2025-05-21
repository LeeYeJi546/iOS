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
            }


            Tab("Shop", image: "shop") {
            }


            Tab("Other", image: "other") {
                OtherView()
            }
            
        }
        .tint(.green02)
    }
}

#Preview {
    TabBarView()
}
