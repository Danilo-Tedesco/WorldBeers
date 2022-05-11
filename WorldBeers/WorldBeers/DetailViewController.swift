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
    
    public var beerDataModel: BeerDataModel!
    
    static func instantiateViewController()->DetailViewController?{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = beerDataModel.name
        
        labelFirst_brewed.text = beerDataModel.first_brewed
        textViewBrewers_tips.text = beerDataModel.brewers_tips
        setTextViewFood_pairing()
    }
    
    func setTextViewFood_pairing(){
        guard beerDataModel.food_pairing != [] else {
            return
        }
        textViewFood_pairing.text = ""
        for food_pair in beerDataModel.food_pairing {
            textViewFood_pairing.text += food_pair + ";\n"
        }
        
    }
}
