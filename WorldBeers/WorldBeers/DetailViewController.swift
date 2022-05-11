//
//  DetailViewController.swift
//  WorldBeers
//
//  Created by Danilo Tedesco on 11/05/22.
//

import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var labelFirst_brewed: UILabel!
    
    @IBOutlet weak var textViewFood_pairing: UITextView!
    
    @IBOutlet weak var textViewBrewers_tips: UITextView!
    
    public var beerDataModel: BeerDataViewModel!
    
    public var beerIndex: Int!
    
    static func instantiateViewController()->DetailViewController?{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = beerDataModel.beersDataModel[beerIndex].name
        
        labelFirst_brewed.text = beerDataModel.beersDataModel[beerIndex].first_brewed
        textViewBrewers_tips.text = beerDataModel.beersDataModel[beerIndex].brewers_tips
        textViewFood_pairing.text = beerDataModel.getFoodPairingString(index: beerIndex)
    }
    
}
