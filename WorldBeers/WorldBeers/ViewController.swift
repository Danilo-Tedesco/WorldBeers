//
//  ViewController.swift
//  WorldBeers
//
//  Created by Danilo Tedesco on 10/05/22.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var beerViewModel: BeerDataViewModel!
    
    var filteredData: [BeerDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 200
        
        //Instanzio il ViewModel
        self.beerViewModel = BeerDataViewModel()
        
        //Binding degli elementi in tabella
        self.beerViewModel.bindBeerViewModel = {
            self.filteredData = self.beerViewModel.beersDataModel
            self.tableView.reloadData()
        }
    }
        
    func pushToDetailViewController(index: Int){
        if let viewController = DetailViewController.instantiateViewController() {
            viewController.beerDataModel = beerViewModel
            viewController.beerIndex = index
              if let navigator = navigationController {
                  navigator.pushViewController(viewController, animated: true)
              }
          }
    }
}

// MARK: - TableView Data Source

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

// MARK: - TableView Delegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushToDetailViewController(index: indexPath.row)
    }
}

// MARK: - SearchBar Delegate

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = self.beerViewModel.beersDataModel

        if searchText.isEmpty == false {
            filteredData = self.beerViewModel.filterNameAndDescription(searchText: searchText)
        }
        
        tableView.reloadData()
    }
}
