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
                let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                if let dictionary = object as? [[String: Any]] {
                    dictionary.forEach {
                        var beer = BeerDataModel()
                        if let beerValue = $0 as? [String: Any]{
                            beerValue.forEach{
                                if let key = $0 as? String{
                                    if(key == "name"){
                                        beer.name = $1 as? String
                                    }
                                    if(key == "description")
                                }
                            }
                        }
                                        
                    }
                    //print(dictionary)
                }
                else{
                    handler?(false, [:])
                }
            } catch let error as NSError {
                print(error.localizedDescription)
                handler?(false, [:])
            }
        }
        task.resume()
    }
}

