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
    
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedFindSegment: FindSegmentType = .findStore
    
    @Bindable private var locationManager = LocationManager.shared
    @Bindable private var viewModel: MapViewModel = .init()
    @Namespace var mapScope
        
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                    .frame(width: 30)
                Button (action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .frame(width: 9, height: 15)
                }
                Spacer()
                    .frame(width: 120)
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
        ZStack(alignment: .bottomTrailing) {
            Map(position: $viewModel.cameraPosition) {
                ForEach(viewModel.makers, id: \.id, content: { marker in
                    Annotation(marker.title, coordinate: marker.coordinate, content: {
                        Image(systemName: "mappin.circle.fill")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(Color.red)
                    })
                })
                
                UserAnnotation(anchor: .center)
            }
            Button(action: {
                withAnimation {
                    viewModel.cameraPosition = .userLocation(fallback: .automatic)
                }
            }) {
                Image(.presentlocation)
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            .offset(x: -30, y: -10)
        }
        .mapScope(mapScope)
    }
}

#Preview {
    StoreInfoView()
}
