//
//  MovieListModel.swift
//  MovieListModel
//
//  Created by River Camacho on 9/24/21.
//

import Foundation
import UIKit

struct MovieListModel: Codable {
    var results : [Movie]?
}

struct Movie: Codable {
    var backdrop_path: String?
    var id: Int?
    var original_title: String?
    var popularity: Double?
    var release_date: String?
    var title: String?
    var overview: String?
}
