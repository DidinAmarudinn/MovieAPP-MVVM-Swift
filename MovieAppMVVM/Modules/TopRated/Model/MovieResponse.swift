//
//  MovieResponse.swift
//  MovieAppMVVM
//
//  Created by didin amarudin on 22/04/22.
//

import Foundation

struct MovieResponse: Codable {

    var page: Int
    var results: [Movie]
    var totalPages: Int
    var totalResults: Int

    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decode(Int.self, forKey: .page)
        results = try values.decode([Movie].self, forKey: .results)
        totalPages = try values.decode(Int.self, forKey: .totalPages)
        totalResults = try values.decode(Int.self, forKey: .totalResults)
    }

}
