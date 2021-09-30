//
//  imgExtension.swift
//  MovieDB
//
//  Created by River Camacho on 9/28/21.
//

import UIKit

extension UIImageView {
    
    //Write a function
    //Being a developer means always writing new functions/methods
    // Get images function - with parameter URLString of type String. This parameter takes in the backdrop_path data
    func getImagesFromServerURL(_ URLString: String) {
        
        //The URL from constant file + the data being grabbed
        let imageURL = Constant.IMAGE_BASE_URL.rawValue + URLString
        //Using if/let to unwrap the data being grabbed
        //
        if let url = URL(string: imageURL) {
            //Set URLSession class closure
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
        
    }
    
    
    

}
