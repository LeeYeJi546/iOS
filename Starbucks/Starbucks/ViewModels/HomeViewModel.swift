//
//  HomeViewModel.swift
//  3rd_assignment
//
//  Created by 이예지 on 4/4/25.
//

import Foundation
class HomeViewModel: ObservableObject {
    
    @Published var CoffeeList: [CoffeeModel] = [
        CoffeeModel(imageName:"coffee1", titleText:"에스프레소 콘 파나"),
        CoffeeModel(imageName:"coffee2", titleText:"에스프레소 마끼아또"),
        CoffeeModel(imageName:"coffee3", titleText:"아이스 카페 아메리카노"),
        CoffeeModel(imageName:"coffee4", titleText:"카페 아메리카노"),
        CoffeeModel(imageName:"coffee5", titleText:"아이스 카라멜 마끼아또"),
        CoffeeModel(imageName:"coffee5", titleText:"카라멜 마끼아또")
    ]
    
    @Published var coffeeDetailList: [Coffee] = [
                Coffee(titleText: "에스프레소 콘 파나",
                       nameEng: "Espresso Con Panna",
                       description: "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료",
                       price: 4100,
                       temperatureOptions: [.hotOnly],
                       imageName: "coffeedetail1"),
                Coffee(titleText: "에스프레소 마끼아또",
                       nameEng: "Espresso Macchiato",
                       description: "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로서, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료",
                       price: 3900,
                       temperatureOptions: [.icedOnly],
                       imageName: "coffeedetail2"),
                Coffee(titleText: "아이스 카페 아메리카노",
                       nameEng: "Iced Caffe Americano",
                       description: "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피",
                       price: 4700,
                       temperatureOptions: [.hot, .iced],
                       imageName: "coffeedetail3"),
                Coffee(titleText: "카페 아메리카노",
                       nameEng: "Caffe Americano",
                       description: "진한 에스프레소와 뜨거운 물을 섞어 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽게 잘 느낄 수 있는 커피",
                       price: 4700,
                       temperatureOptions: [.hot, .iced],
                       imageName: "coffeedetail4"),
                Coffee(titleText: "아이스 카라멜 마끼아또",
                       nameEng: "Iced Caramel Macchiato",
                       description: "향긋한 바닐라 시럽과 시원한 우유에 어름을 넣고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                       price: 6100,
                       temperatureOptions: [.hot, .iced],
                       imageName: "coffeedetail5"),
                Coffee(titleText: "카라멜 마끼아또",
                       nameEng: "Caramel Macchiato",
                       description: "향긋한 바닐라 시럽과 따뜻한 스팀 밀크 위에 풍성한 우유 거품을 얹고 점을 찍듯이 에스프레소를 부은 후 벌집 모양으로 카라멜 드리즐을 올린 달콤한 커피 음료",
                       price: 6100,
                       temperatureOptions: [.hot, .iced],
                       imageName: "coffeedetail6"),
    ]
    
    @Published var WhatsNewList: [whatsnewModel] = [
        whatsnewModel(newTitle: "25년 3월 일회용컵 없는 날 캠페인", newImage: "new1", newBody: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요."),
        whatsnewModel(newTitle: "스타벅스 ooo점을 찾습니다", newImage: "new2", newBody: "스타벅스 커뮤니티 스토어 파트너를 웅영할 기관을 공모합니다."),
        whatsnewModel(newTitle: "2월 8일, 리저브 스프링 신규 커피", newImage: "new3", newBody: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요.")
               
    ]

    @Published var DessertList: [DessertModel] = [
        DessertModel(imageName:"dessert1", titleText:"너티 크루아상"),
        DessertModel(imageName:"dessert2", titleText:"매콤 소시지 불고기"),
        DessertModel(imageName:"dessert3", titleText:"미니 리프 파이"),
        DessertModel(imageName:"dessert4", titleText:"뺑 오 쇼콜라"),
        DessertModel(imageName:"dessert5", titleText:"소시지&올리브 파이")
    ]
}
