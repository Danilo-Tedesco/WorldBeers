//
//  BeerDataViewModel.swift
//  WorldBeers
//
//  Created by Danilo Tedesco on 10/05/22.
//

import Foundation

class BeerDataViewModel: NSObject{
    
    public var beersDataModel: [BeerDataModel] = []{
        didSet{
            self.bindBeerViewModel()
        }
    }
    
    var bindBeerViewModel : (() -> ()) = {}
    
    override init(){
        super.init()
        RequestAPI.GetAllBeers { completed, beersData in
            self.beersDataModel = beersData
        }
    }
}
