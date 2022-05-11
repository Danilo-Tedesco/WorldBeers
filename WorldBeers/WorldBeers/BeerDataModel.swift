//
//  BeerDataModel.swift
//  WorldBeers
//
//  Created by Danilo Tedesco on 10/05/22.
//

import Foundation

class BeerDataModel: Equatable{
    static func == (lhs: BeerDataModel, rhs: BeerDataModel) -> Bool {
        return lhs.name == rhs.name && lhs.descriptionBeer == rhs.descriptionBeer
    }
    
    public var name: String?
    public var descriptionBeer: String?
    public var image_url: String?
    public var abv: Float?
    public var ibu: Int?
    public var first_brewed: String?
    public var food_pairing: [String] = []
    public var brewers_tips: String?
}

