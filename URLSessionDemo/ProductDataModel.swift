//
//  ProductDataModel.swift
//  URLSessionDemo
//
//  Created by Kumaran on 11/07/23.
//

import Foundation

struct Product: Codable {
    
    var id: Int?
    var title: String?
    var description: String?
    var price: Int?
    var discountPercentage: Double?
    var rating: Double?
    var stock: Int?
    var brand: String?
    var category: String?
    var thumbnail: String?
    var images: [String]?
    
    init(id: Int?, title: String?, description: String?, price: Int?, discountPercentage: Double?, rating: Double?, stock: Int?, brand: String?, category: String?, thumbnail: String?, images: [String]?) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.discountPercentage = discountPercentage
        self.rating = rating
        self.stock = stock
        self.brand = brand
        self.category = category
        self.thumbnail = thumbnail
        self.images = images
    }
}
