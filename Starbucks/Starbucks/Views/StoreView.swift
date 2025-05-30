//
//  StoreView.swift
//  Starbucks
//
//  Created by 이예지 on 5/21/25.
//

import SwiftUI
import MapKit

struct StoreView: View {
    
    enum StoreSegmentType: Int, CaseIterable, Identifiable {
        case near
        case often
        
        var id: Int { self.rawValue }
        
        var title: String {
            switch self {
            case .near: return "가까운 매장"
            case .often: return "자주 가는 매장"
            }
        }
    }
    
    enum StoreInfo: String, Codable {
        case RS = "rs"
        case DT = "dt"
    }
    
    @State private var selectedStoreSegment: StoreSegmentType = .near
    
    @State var store: String = ""
    
    @State private var showmap = false
    
    @Bindable private var locationManager = LocationManager.shared
    @Bindable private var viewModel: MapViewModel = .init()

    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Text("매장 설정")
                        .font(.PretendardMedium16)
                    Spacer()
                    Button(action: {
                        showmap.toggle()
                    }) {
                        Image(showmap ? "list" : "map")
                    }
                }
                .padding(.bottom, 24)
                
                TextField("검색",text: $store)
                    .padding(7)
                    .background(Color(.gray08))
                    .font(.PretendardSemiBold13)
                    .cornerRadius(8)
                
                
                storeSegment
                if showmap {
                    storeMap
                }
                else {
                    storeList
                }
            }
        }
        .safeAreaPadding(.horizontal, 20)
    }
    
    
    private var storeSegment: some View {
        VStack {
            HStack {
                storeCustomSegment(
                    selection: $selectedStoreSegment,
                    options: StoreSegmentType.allCases,
                    titles: [.near: "가까운 매장", .often: "자주 가는 매장"]
                )
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .frame(width: 200, height: 40)
                Spacer()
                    .frame(width: 194)
            }
            Divider()
            
        }
    }
    struct storeCustomSegment<T: Identifiable & Hashable>: View where T: RawRepresentable, T.RawValue == Int {
        @Binding var selection: T
        let options: [T]
        let titles: [T: String]
        
        var body: some View {
            VStack {
                // 세그먼트 버튼들
                HStack(spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            withAnimation(.spring()) {
                                selection = option
                            }
                        }) {
                            Text(titles[option] ?? "")
                                .font(.PretendardSemiBold13)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(selection == option ? Color("black03") : Color("gray03"))
                        }
                    }
                }
            }
        }
    }
    
    private var storeList: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("store")
                        .resizable()
                        .frame(width: 83, height: 83)
                    VStack {
                        if let storeinfo = viewModel.storelist {
                            Text("\(storeinfo.Sotre_nm)")
                                .font(.PretendardSemiBold13)
                                .foregroundStyle(Color.black03)
                            Text("\(storeinfo.Address)")
                                .font(.PretendardMedium10)
                                .foregroundStyle(Color.gray02)
                            
                        }
                    }
                }
            }
        }
    }
    
    private var storeMap: some View {
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
    }
}

    

#Preview {
    StoreView()
}
