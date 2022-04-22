//
//  TopRatedViewModel.swift
//  MovieAppMVVM
//
//  Created by didin amarudin on 22/04/22.
//

import Foundation
import UIKit
class TopRatedViewModel {
    let movies: Box<[Movie]> = Box([]) // no image initaly
    var error = Box("")
    func getTopRatedMovie() {
        print("oke")
        let url = "\(baseURL)/top_rated?api_key=\(apiKey)&language=en-EN&page=1"
       
        APIService.init().getRequest(url: url) { jsonData, error, statuscode in
            if let error = error{
                self.error.value = error.localizedDescription
                return
            }
            if let statuscode = statuscode {
                if statuscode == 200 {
                    let jsonDecoder = JSONDecoder()
                    let movieResponse = try? jsonDecoder.decode(MovieResponse.self, from: jsonData!)
                    self.movies.value = movieResponse?.results ?? []
                } else {
                    self.error.value = "Internal Server Error"
                }
            }
        }
    }
}



