//
//  PopupView.swift
//  assignment
//
//  Created by 이예지 on 3/30/25.
//

import SwiftUI

struct PopupView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Image(.popup)
                .aspectRatio(contentMode: .fit)
            
            Spacer().frame(height:50)
            
                Button(action: {
                    print("자세히 보기")
                }) {
                    Image(.detail)
                        .resizable()
                        .frame(width: 370, height:50)
                }
            HStack{
                Spacer().frame(width: 280)
                Button(action: {
                    isPresented = false
                }) {
                    Text("X 닫기")
                        .font(.PretendardLight14)
                        .foregroundStyle(Color.black01)
                }
            }
            Spacer().frame(height:60)
        }
    }
}

#Preview {
    PopupView(isPresented: .constant(true))
}
