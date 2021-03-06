//
//  MovieModel.swift
//  IosAppMovies
//
//  Created by Daye Sow on 13/12/2021.
//



import Foundation
import SwiftUI

struct Movie :  Codable{
    
    var results : [Result]
    
//    var id = UUID()
//    var name : String
//    var director : String
//    var isWatched : Bool
//    var rateMovie : Int
//    //var movie : [MovieInfo]
//
//    init(name : String, director : String,isWatched : Bool, rateMovie: Int){
//
//        self.name = name
//        self.director = director
//        self.isWatched = isWatched
//        self.rateMovie = rateMovie
//    }
//
//    mutating func editMovie(name : String, director : String,isWatched : Bool, rateMovie: Int){
//        self.name = name
//        self.director = director
//        self.isWatched = isWatched
//        self.rateMovie = rateMovie
//    }
    
//    func updateCompletion() -> Movie {
//        return Movie(id : id, name : name,director:director)
//    }
}

struct Result : Identifiable,Codable {
 
    var id : Int = UUID().uuidString.hash
    //var name : String
    var director : String? = ""
    var isWatched : Bool? = false
    var rateMovie : Int? = 0
    var title : String
    
        init(title : String, director : String,isWatched : Bool, rateMovie: Int){
            self.id = UUID().uuidString.hash
            self.title = title
            self.director = director
            self.isWatched = isWatched
            self.rateMovie = rateMovie
        }
    
    mutating func editMovie(title : String, director : String,isWatched : Bool, rateMovie: Int){
        self.title = title
        self.director = director
        self.isWatched = isWatched
        self.rateMovie = rateMovie
    }
}

