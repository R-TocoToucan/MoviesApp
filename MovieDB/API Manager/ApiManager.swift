//
//  ApiManager.swift
//  MovieDB
//
//  Created by River Camacho on 9/27/21.
//

import UIKit

//class ApiManager {
//
//    static let shared = ApiManager()
//
//    func getMovieListFromServer(url: String, completionHandler  : @escaping ((MovieListModel?)->()) ) {
//
//        let objUrlSession = URLSession.shared
//        objUrlSession.dataTask(with: URL.init(string: url)!) { data, response, error in
//
//                       guard let data = data else {return}
//
//                       // Jsondecoder convert data into model object directly using decode method
//                       let jsondecoder = JSONDecoder()
//                       let movieList = try! jsondecoder.decode(MovieListModel.self, from: data)
//
//                        completionHandler(movieList)
//            }.resume()
//
//    }
//
//
//
//}




class ApiManager {
    
    static let shared = ApiManager()
    
    var delegate: ApiManagerDelegate?
    
    func getMovieListFromServer(url: String) {
        
        let objUrlSession = URLSession.shared
        objUrlSession.dataTask(with: URL.init(string: url)!) { data, response, error in
                       guard let data = data else {return}
                       // Jsondecoder convert data into model object directly using decode method
                       let jsondecoder = JSONDecoder()
                       let movieList = try! jsondecoder.decode(MovieListModel.self, from: data)
                       self.delegate?.getMovies(movieListModel: movieList)
            }.resume()

    }
}

protocol ApiManagerDelegate {
    
    func getMovies(movieListModel: MovieListModel)
    
}
    
    
    
    


    

