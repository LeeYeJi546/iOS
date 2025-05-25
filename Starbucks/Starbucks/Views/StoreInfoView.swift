//
//  StoreInfoView.swift
//  Starbucks
//
//  Created by 이예지 on 5/23/25.
//

import SwiftUI
import MapKit

struct StoreInfoView: View {
    
    enum FindSegmentType: Int, CaseIterable, Identifiable {
        case findStore
        case findStreet
        
        var id: Int { self.rawValue }
        
        var title: String {
            switch self {
            case .findStore: return "매장 찾기"
            case .findStreet: return "길찾기"
            }
        }
    }
    
    @State private var selectedFindSegment: FindSegmentType = .findStore
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                    .frame(width: 30)
                Image(systemName: "chevron.left")
                Spacer()
                    .frame(width: 130)
                Text("매장 찾기")
                    .font(.PretendardMedium16)
                Spacer()
                    .frame(width: 160)
            }
        }
        findSegment
        MapView
    }
    
    
    private var findSegment: some View {
        VStack {
            HStack {
                findCustomSegment(
                    selection: $selectedFindSegment,
                    options: FindSegmentType.allCases,
                    titles: [.findStore: "매장 찾기", .findStreet: "길찾기"]
                )
                .padding(.top, 10)
                .frame(width: 350, height: 58)
            }
        }
    }
    
    struct findCustomSegment<T: Identifiable & Hashable>: View where T: RawRepresentable, T.RawValue == Int {
        @Binding var selection: T
        let options: [T]
        let titles: [T: String]
        
        var body: some View {
            VStack(spacing:5) {
                // 세그먼트 버튼들
                HStack {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            withAnimation(.spring()) {
                                selection = option
                            }
                        }) {
                            Text(titles[option] ?? "")
                                .font(.PretendardSemiBold24)
                                .frame(maxWidth: .infinity)
                                .foregroundColor( Color("black03"))
                        }
                    }
                }
                GeometryReader { geometry in
                    let segmentWidth = geometry.size.width / CGFloat(options.count)
                    let indicatorPosition = CGFloat(selection.rawValue) * segmentWidth
                    
                    RoundedRectangle(cornerSize: .init(width: 16, height: 16))
                        .fill(Color("brown02"))
                        .frame(width: 125, height: 5)
                        .offset(x: indicatorPosition)
                        .offset(x: 25)
                        .animation(.spring(), value: selection)
                }
            }
        }
    }
    
    private var MapView : some View {
        Map(initialPosition: .region(region))
    }
}

#Preview {
    StoreInfoView()
}
