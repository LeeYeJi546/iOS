//
//  ShopViewModel.swift
//  4th_assignment
//
//  Created by 이예지 on 4/10/25.
//

import Foundation

class OrderViewModel: ObservableObject {
    
    @Published var OrderList: [OdModel] = [
        OdModel(imageName:"order1", korText:"추천", engText:"Recommend"),
        OdModel(imageName:"order2 1", korText:"아이스 카페 아메리카노", engText:"Reserve Espresso"),
        OdModel(imageName:"order3", korText:"카페 아메리카노", engText:"Reserve Drip"),
        OdModel(imageName:"order4", korText:"카푸치노", engText:"Dcaf Coffee"),
        OdModel(imageName:"order5", korText:"아이스 카푸치노", engText:"Espresso"),
        OdModel(imageName:"order6", korText:"카라멜 마키아또", engText:"Blonde Coffee"),
        OdModel(imageName:"order7", korText:"아이스 카라멜 마키아또", engText:"Cold Brew"),
        OdModel(imageName:"order8", korText:"아포가토/기타", engText:"Others"),
        OdModel(imageName:"order9", korText:"럼 샷 코르타도", engText:"Brewed Coffee"),
        OdModel(imageName:"order10", korText:"라벤터 카페 브레베", engText:"Teavana"),
        OdModel(imageName:"order11", korText:"병음료", engText:"RTD")



        

    ]
    
    
}

