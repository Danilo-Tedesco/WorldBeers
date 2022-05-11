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
            DispatchQueue.main.async{
                self.bindBeerViewModel()
            }
        }
    }
    
    var bindBeerViewModel : (() -> ()) = {}
    
    override init(){
        super.init()
        RequestAPI.GetAllBeers { completed, beersData in
            self.beersDataModel = beersData
        }
    }
    
    public func filterNameAndDescription(searchText: String) ->[BeerDataModel]{
        var dataFiltered : [BeerDataModel] = []
        
        dataFiltered = self.beersDataModel.filter{
            let lowerSearchText = searchText.lowercased()
            
            if $0.name != nil && $0.descriptionBeer != nil{
                let lowerName = $0.name!.lowercased()
                let lowerDescription = $0.descriptionBeer!.lowercased()
                return lowerName.contains(lowerSearchText) || lowerDescription.contains(lowerSearchText)
            }
            if $0.name != nil{
                let lowerName = $0.name!.lowercased()
                return lowerName.contains(lowerSearchText)
            }
            return false
        }
        return dataFiltered
    }
    
    public func getFoodPairingString(index: Int)->String{
        var textFood_pairing = ""
        guard self.beersDataModel[index].food_pairing != [] else {
            return ""
        }
        
        var count: Int = 0
        for food_pair in self.beersDataModel[index].food_pairing {
            count += 1
            textFood_pairing += food_pair + ";"
            if(count != self.beersDataModel[index].food_pairing.count){
                textFood_pairing += "\n"
            }
        }
        return textFood_pairing
    }
}
