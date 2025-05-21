//
//  CircleImageCard.swift
//  3rd_assignment
//
//  Created by 이예지 on 4/4/25.
//

import SwiftUI

struct RectangleImageCard: View {
    let model: whatsnewModel

    var body: some View {
        VStack(spacing: 10) {
            Image(model.newImage)
                .resizable()
                .frame(width: 242, height: 160)
            HStack {
                Text(model.newTitle)
                    .font(.PretendardSemiBold16)
                    .lineLimit(1)
                Spacer()
            }
            Text(model.newBody)
                .font(.PretendardRegular13)
                .frame(width: 242, height: 36, alignment: .leading)
        }
        .frame(width: 242, height: 249)
    }
}
