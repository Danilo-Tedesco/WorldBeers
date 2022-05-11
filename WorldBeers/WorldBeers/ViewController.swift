//
//  ViewController.swift
//  WorldBeers
//
//  Created by Danilo Tedesco on 10/05/22.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var beerViewModel: BeerDataViewModel!
    
    var filteredData: [BeerDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 200
        
        self.beerViewModel = BeerDataViewModel()
        self.beerViewModel.bindBeerViewModel = {
            DispatchQueue.main.async{
                self.filteredData = self.beerViewModel.beersDataModel
                
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = self.beerViewModel.beersDataModel


        if searchText.isEmpty == false {
            filteredData = self.beerViewModel.filterNameAndDescription(searchText: searchText)
        }
        
        tableView.reloadData()
         
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.setup(with: filteredData[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            viewController.beerDataModel = beerViewModel.beersDataModel[indexPath.row]
              if let navigator = navigationController {
                  navigator.pushViewController(viewController, animated: true)
              }
          }
    }
}

