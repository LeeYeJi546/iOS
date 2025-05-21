//
//  Protocol.swift
//  4st_assignment
//
//  Created by 이예지 on 5/7/25.
//

import UIKit

protocol ImageHandling: AnyObject {
    func addImage(_ image: UIImage)
    func getImages() -> [UIImage]
    var recognizedText: String { get set }
}
