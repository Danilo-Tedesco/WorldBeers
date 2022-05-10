//
//  ViewController.swift
//  WorldBeers
//
//  Created by Danilo Tedesco on 10/05/22.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RequestAPI.GetAllBeers { completed, jsonString in
            print(jsonString)
        }
    }


}

