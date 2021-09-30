//
//  DetailsVC.swift
//  MovieDB
//
//  Created by River Camacho on 9/30/21.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var detailImgView: UIImageView!
    
    @IBOutlet weak var detailMovieTitle: UILabel!
    
    @IBOutlet weak var detailPopularity: UILabel!
    
    @IBOutlet weak var detailReleaseDate: UILabel!
    
    @IBOutlet weak var detailID: UILabel!
    
    @IBOutlet weak var detailOverview: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        detailOverview.sizeToFit()
        detailImgView.getImagesFromServerURL(movie?.backdrop_path ?? "")
        detailMovieTitle.text = movie?.title ?? ""
        detailPopularity.text = "P: \(movie?.popularity ?? 0)"
        detailReleaseDate.text = "R: \(movie?.release_date ?? "")"
        detailID.text = "I: \(movie?.id ?? 0)"
        detailOverview.text = movie?.overview ?? ""
        
        
        
        

    }
    


}
