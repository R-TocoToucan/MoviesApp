//
//  MovieTVC.swift
//  MovieTVC
//
//  Created by River Camacho on 9/24/21.
//

import UIKit

class MovieTVC: UITableViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var moviePopularity: UILabel!
    
    @IBOutlet weak var movieRating: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(objMovie: Movie) {
        movieTitle?.text = objMovie.title
        moviePopularity?.text =  "Popularity: \(objMovie.popularity ?? 0)"
        movieRating?.text = "ID: \(objMovie.id ?? 0)"
        releaseDate?.text = "Released: \(objMovie.release_date ?? "")"
        movieImage?.getImagesFromServerURL(objMovie.backdrop_path ?? "")

        
    }

}
