//
//  OrderView.swift
//  5st_assignment
//
//  Created by 이예지 on 4/30/25.
//

import SwiftUI


struct mainOrderView: View {
    
    @ObservedObject var viewModel: OrderViewModel = .init()
    
    enum TopSegmentType: Int, CaseIterable, Identifiable {
        case fullMenu
        case myMenu
        case wholecake
        
        var id: Int { self.rawValue }
        
        var title: String {
            switch self {
            case .fullMenu: return "전체메뉴"
            case .myMenu: return "나만의 메뉴"
            case .wholecake: return "홀케이크 예약"
            }
        }
    }
    
    enum BottomSegmentType: Int, CaseIterable, Identifiable {
        case drink
        case food
        case product
        
        var id: Int { self.rawValue }
        
        var title: String {
            switch self {
            case .drink: return "음료"
            case .food: return "푸드"
            case .product: return "상품"
            }
        }
    }
    
    // 선택된 세그먼트 상태 추가
    @State private var selectedTopSegment: TopSegmentType = .fullMenu
    @State private var selectedBottomSegment: BottomSegmentType = .drink
    
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Order")
                    .font(.PretendardBold24)
                    .padding(.leading, 23)
                    .padding(.top, 19)
                Spacer()
                    .frame(maxWidth: .infinity)
            }
            topSegment
            bottomSegment
            bottomCoffeeMenu
            SheetButton
        }
    }
    //상단 세그먼트
    private var topSegment: some View {
        HStack {
            topCustomSegment(
                selection: $selectedTopSegment,
                options: TopSegmentType.allCases,
                titles: [.fullMenu: "전체메뉴", .myMenu: "나만의 메뉴", .wholecake: "홀케이크 예약"],
                spacingAfterIndex: 1
            )
            .padding(.horizontal, 20)
            .padding(.top, 10)
        }
    }
    
    private var bottomSegment: some View {
        VStack {
            HStack {
                Spacer()
                    .frame(width: 10)
                bottomCustomSegment(
                    selection: $selectedBottomSegment,
                    options: BottomSegmentType.allCases,
                    titles: [.drink: "음료", .food: "푸드", .product: "상품"]
                )
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .frame(width: 200, height: 40)
                Spacer()
            }
            Divider()
        }
    }
    
    
    struct topCustomSegment<T: Identifiable & Hashable>: View where T: RawRepresentable, T.RawValue == Int {
        @Binding var selection: T
        let options: [T]
        let titles: [T: String]
        let spacingAfterIndex: Int
        
        var body: some View {
            VStack(spacing: 0) {
                // 세그먼트 버튼들
                HStack(spacing: 0) {
                    ForEach(Array(options.indices), id: \.self) { index in
                        let option = options[index]
                        Button(action: {
                            withAnimation(.spring()) {
                                selection = option
                            }
                        }) {
                            Text(titles[option] ?? "")
                                .font(.PretendardBold16)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(selection == option ? Color.black : Color("gray04"))
                        }
                        
                        //나만의 메뉴랑 홀케이크 예약 사이 간격 추가
                        if index == spacingAfterIndex {
                            Spacer()
                                .frame(width: 60)
                        }
                    }
                }
                
                // 인디케이터 바
                GeometryReader { geometry in
                    let segmentWidth = geometry.size.width / CGFloat(options.count)
                    let indicatorPosition = CGFloat(selection.rawValue) * segmentWidth
                    
                    Rectangle()
                        .fill(Color("green01"))
                        .frame(width: segmentWidth, height: 2)
                        .offset(x: indicatorPosition)
                        .animation(.spring(), value: selection)
                }
                .frame(height: 2)
                .shadow(radius: 3, x: 0, y: 2)
            }
        }
    }
    
    struct bottomCustomSegment<T: Identifiable & Hashable>: View where T: RawRepresentable, T.RawValue == Int {
        @Binding var selection: T
        let options: [T]
        let titles: [T: String]
        
        var body: some View {
            VStack(spacing: 0) {
                // 세그먼트 버튼들
                HStack(spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            withAnimation(.spring()) {
                                selection = option
                            }
                        }) {
                            Text(titles[option] ?? "")
                                .font(.PretendardSemiBold16)
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(selection == option ? Color("black01") : Color("gray04"))
                        }
                        Image("new")
                            .padding(.bottom, 8)
                            .padding(.trailing, 9)
                    }
                }
            }
        }
    }
    
    private var bottomCoffeeMenu: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(viewModel.OrderList) { OD in
                    bottomCoffeeMenuCard(model: OD)
                }
            }
        }
    }
    
    private var SheetButton: some View {
        Button(action: {
            isShowingSheet.toggle()
        }) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.black02)
                    .frame(width: .infinity, height: 54)
                VStack {
                    HStack {
                        Text("주문할 매장을 선택해주세요")
                            .font(.PretendardSemiBold16)
                            .foregroundStyle(Color.white)
                            .padding(.leading, 20)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundStyle(Color.white)
                            .frame(width:20, height: 20)
                            .padding(.trailing, 20)
                    }
                    Rectangle()
                        .fill(Color.gray06)
                        .frame(width: .infinity, height: 1)
                        .padding([.leading, .trailing], 20)
                        
                }
            }
                
        }
        .sheet(isPresented: $isShowingSheet) {
            StoreView()
            }
        }
    }

#Preview {
    mainOrderView()
}
