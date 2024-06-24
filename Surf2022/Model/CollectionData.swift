//
//  CollectionData.swift
//  Surf2022
//
//  Created by Алексей on 24.06.2024.
//

import Foundation

struct CollectionData {
    let image: String
    let title: String = K.MockData.mockTitle
    let description: String = K.MockData.mockDescription
    let isLiked: Bool
    let date: Date = .now
}

extension CollectionData {
    static func getCollection() -> [CollectionData] {
        [
            CollectionData(image: K.MockData.MockImage.img1.rawValue, isLiked: true),
            CollectionData(image: K.MockData.MockImage.img2.rawValue, isLiked: false),
            CollectionData(image: K.MockData.MockImage.img3.rawValue, isLiked: true),
            CollectionData(image: K.MockData.MockImage.img4.rawValue, isLiked: false),
            CollectionData(image: K.MockData.MockImage.img5.rawValue, isLiked: true),
            CollectionData(image: K.MockData.MockImage.img6.rawValue, isLiked: false),
            CollectionData(image: K.MockData.MockImage.img7.rawValue, isLiked: true),
            CollectionData(image: K.MockData.MockImage.img8.rawValue, isLiked: false),
            CollectionData(image: K.MockData.MockImage.img9.rawValue, isLiked: true),
            CollectionData(image: K.MockData.MockImage.img10.rawValue, isLiked: false),
        ].shuffled()
    }
}
