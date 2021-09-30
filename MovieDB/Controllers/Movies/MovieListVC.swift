//
//  MovieListVC.swift
//  MovieListVC
//
//  Created by River Camacho on 9/24/21.
//

import UIKit

class MovieListVC: UIViewController, ApiManagerDelegate {
    //Outlet for Movie Table View
    @IBOutlet weak var movieTblView: UITableView!
    //Create Model Object
    var allMovies: MovieListModel?
    //Create Object of initilizied ApiManager
    let objApiManager = ApiManager.shared
    //Fetch data from server using protocol stub
    func getMovies(movieListModel: MovieListModel) {
        allMovies = movieListModel
        DispatchQueue.main.async {
            self.movieTblView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        objApiManager.delegate = self
        objApiManager.getMovieListFromServer(url: Constant.MOVIE_LIST_URL.rawValue)
        
        self.navigationItem.title = "Movies"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        let searchBar = UISearchController()
        self.navigationItem.searchController = searchBar
        searchBar.searchBar.placeholder = "Search"
        searchBar.searchResultsUpdater = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
extension MovieListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMovies?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieTVC
        //Fetch Movie for each row
        let movie = allMovies?.results?[indexPath.row]
        //Set data from MovieTVC file
        if let movie = movie {
            movieCell?.setUpCell(objMovie: movie)
        }
        return movieCell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
        let movie = allMovies?.results?[indexPath.row]
        
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        if let vc = st.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC {
            vc.movie = movie
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
extension MovieListVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            //Get Movie Data
            let searchableMovies = allMovies?.results
            //Set var = new array of initilized Movie struct
            var searchedMovies = [Movie]()
            //Set const = all items in Movie model
            let movies = allMovies?.results?.count ?? 0
            //Set a default value to work with
            let count = 0
            //Loop through movies
            for movie in 0..<movies{
                //Unwrap Title of Movie
                if let title = searchableMovies?[movie].title{
                    //Check if users input contains any charachters in movie title
                    if title.contains(searchText){
                        //If users input contains character append the movie title to new array
                        searchedMovies.append(searchableMovies?[movie] ?? Movie())
                    }
                    //Set movie data to equal new array
                    allMovies?.results = searchedMovies
                    //Load tableview with new array
                    DispatchQueue.main.async{
                        self.movieTblView.reloadData()
                    }
                }
            }
            if searchText.count == count {
                ApiManager.shared.getMovieListFromServer(url: Constant.MOVIE_LIST_URL.rawValue)
                DispatchQueue.main.async {
                    self.movieTblView.reloadData()
                }
            }
        }
    }
}
            
//
//
//
//
//        }
//    }
//
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        //Get Movie Data
//        let searchableMovies = allMovies?.results
//        //Set var = new array of initilized Movie struct
//        var searchedMovies = [Movie]()
//        //Set const = all items in Movie model
//        let movies = allMovies?.results?.count ?? 0
//        //Set a default value to work with
//        let count = 0
//        //Loop through movies
//        for movie in 0..<movies{
//            //Unwrap Title of Movie
//            if let title = searchableMovies?[movie].title{
//                //Check if users input contains any charachters in movie title
//                if title.contains(searchText){
//                    //If users input contains character append the movie title to new array
//                    searchedMovies.append(searchableMovies?[movie] ?? Movie())
//                }
//                //Set movie data to equal new array
//                allMovies?.results = searchedMovies
//                //Load tableview with new array
//                DispatchQueue.main.async{
//                    self.movieTblView.reloadData()
//                }
//            }
//        }
//        if searchText.count == count {
//            ApiManager.shared.getMovieListFromServer(url: Constant.MOVIE_LIST_URL.rawValue)
//            DispatchQueue.main.async {
//                self.movieTblView.reloadData()
//            }
//        }
//    }
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//
//    }
//
//    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//        return true
//    }
//
//    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        return true
//    }
//}








