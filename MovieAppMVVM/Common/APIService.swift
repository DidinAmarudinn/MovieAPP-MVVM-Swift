//
//  APIService.swift
//  MovieAppMVVM
//
//  Created by didin amarudin on 22/04/22.
//
let baseURL = "https://api.themoviedb.org/3/movie"
let apiKey = "4d0ccd6514e075265a88c931f89cc2a3"
let baseImageURL = "https://image.tmdb.org/t/p/w500/"
import Foundation
class APIService{
    func getRequest(url : String,completion:@escaping (_ jsonData:Data? , _ error:Error?, _ statuscode : Int? )->()){
        if InternetConnectionChecker.isConnectedToNetwork(){
            let request = URLRequest(url: URL.init(string: url)!)
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    guard let httpResponse = response as? HTTPURLResponse else{return}
                    if let error = error {
                        completion(nil,error,httpResponse.statusCode)
                        return
                    }
                    guard let responseData = data else {
                        return
                    }
                    if httpResponse.statusCode == 200{
                        completion(responseData,nil,httpResponse.statusCode)
                    }else{
                        completion(responseData,nil,httpResponse.statusCode)
                    }
                }
            }
            task.resume()
        }
        else{
          showAlertView(title: internetIssue, messsage: connectToInternet)
        }
    }
}
