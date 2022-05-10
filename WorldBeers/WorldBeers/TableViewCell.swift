//
//  TableViewCell.swift
//  WorldBeers
//
//  Created by Danilo Tedesco on 11/05/22.
//
import UIKit

class TableViewCell : UITableViewCell {

    @IBOutlet weak var imageBeerView: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var labelIBU: UILabel!
    @IBOutlet weak var labelABV: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with beerData: BeerDataModel) {
        let url = URL(string: beerData.image_url ?? "")
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.imageBeerView.image = UIImage(data: data!)
            }
        }
        
        self.labelTitle.text = beerData.name ?? ""
        
        self.textViewDescription.text = beerData.description ?? ""
        
        self.labelABV.text = TableViewCell.GetABVString(beerData: beerData)
        
        self.labelIBU.text = TableViewCell.GetIBUString(beerData: beerData)
    }
    
    static func GetABVString(beerData: BeerDataModel)->String{
        guard (beerData.abv != nil) else{
            return "N/A"
        }
            
        return beerData.abv?.description ?? "N/A"
    }
    
    static func GetIBUString(beerData: BeerDataModel)->String{
        guard (beerData.ibu != nil) else{
            return "N/A"
        }
        return beerData.ibu?.description ?? "N/A"
    }
}
