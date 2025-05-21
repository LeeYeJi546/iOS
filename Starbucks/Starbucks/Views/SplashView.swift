//
//  SplashView.swift
//  assignment
//
//  Created by 이예지 on 3/26/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
            .frame(width: 440, height:956)
            .foregroundStyle(Color.green01)
            
            Image(.logo)
                .frame(width:168, height:168)
        }
    }
}


#Preview {
    SplashView()
}

