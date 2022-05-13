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
        //Rendo questa cella non riusabile
        self.accessibilityIdentifier = ""
        
        let url = URL(string: beerData.image_url ?? "")
        if (url != nil) {
            self.imageBeerView.load(url: url!, placeholder: nil)
        }        
        self.labelTitle.text = beerData.name ?? ""
        
        self.textViewDescription.text = beerData.descriptionBeer ?? ""
        
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

extension UIImageView {
    /// Loads image from web asynchronosly and caches it, in case you have to load url
    /// again, it will be loaded from cache if available
    func load(url: URL, placeholder: UIImage?, cache: URLCache? = nil) {
        let cache = cache ?? URLCache.shared
        let request = URLRequest(url: url)
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            DispatchQueue.main.async {
                self.image = image
            }
        } else {
            self.image = placeholder
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }).resume()
        }
    }
}
