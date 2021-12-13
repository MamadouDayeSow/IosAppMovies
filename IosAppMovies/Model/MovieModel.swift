//
//  MovieModel.swift
//  IosAppMovies
//
//  Created by Daye Sow on 13/12/2021.
//



import Foundation
import SwiftUI

struct Movie : Identifiable{
    var id = UUID()
    var name : String
    var director : String
    var isWatched : Bool
    var rateMovie : Int
    
    init(name : String, director : String,isWatched : Bool, rateMovie: Int){
        
        self.name = name
        self.director = director
        self.isWatched = isWatched
        self.rateMovie = rateMovie
    }
    
    mutating func editMovie(name : String, director : String,isWatched : Bool, rateMovie: Int){
        self.name = name
        self.director = director
        self.isWatched = isWatched
        self.rateMovie = rateMovie
    }
    
//    func updateCompletion() -> Movie {
//        return Movie(id : id, name : name,director:director)
//    }
}

