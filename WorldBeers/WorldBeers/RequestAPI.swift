//
//  RequestAPI.swift
//  WorldBeers
//
//  Created by Danilo Tedesco on 10/05/22.
//

import UIKit

typealias BoolCompletion = ((Bool, [BeerDataModel]) -> Void)

class RequestAPI{
    
    static let url = URL(string: "https://api.punkapi.com/v2/beers")!
    
    public static func GetAllBeers(handler: BoolCompletion?){
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error GET \(error)")
                handler?(false, [])
                return
            }

            if let response = response as? HTTPURLResponse {
                print("HTTP status code: \(response.statusCode)")
            }

            do
            {
                var beersModel : [BeerDataModel] = []
                let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                if let dictionary = object as? [[String: Any]] {
                    dictionary.forEach {
                        let beerData = BeerDataModel()
                        let beerValue = $0
                        beerValue.forEach{
                            let key = $0
                            switch(key){
                            case "name":
                                beerData.name = $1 as? String
                                break
                            case "description":
                                beerData.descriptionBeer = $1 as? String
                                break
                            case "image_url":
                                beerData.image_url = $1 as? String
                                break
                            case "abv":
                                beerData.abv = $1 as? Float
                                break
                            case "ibu":
                                beerData.ibu = $1 as? Int
                                break
                            case "first_brewed":
                                beerData.first_brewed = $1 as? String
                                break
                            case "food_pairing":
                                beerData.food_pairing = $1 as? [String] ?? []
                                break
                            case "brewers_tips":
                                beerData.brewers_tips = $1 as? String
                                break
                            default:
                                break
                            }
                        }
                        beersModel.append(beerData)
                    }
                    handler?(true, beersModel)
                }
                else{
                    handler?(false, [])
                }
            } catch let error as NSError {
                print(error.localizedDescription)
                handler?(false, [])
            }
        }
        task.resume()
    }
}

