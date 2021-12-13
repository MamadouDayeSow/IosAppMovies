//
//  MovieViewModel.swift
//  IosAppMovies
//
//  Created by Daye Sow on 13/12/2021.
//
//
//  MovieViewmodel.swift
//  Movies
//
//  Created by Daye Sow on 08/12/2021.
//

import Foundation

class MovieViewmodel : ObservableObject{
    
    
    @Published var movies : [Movie] = []

    
    
    init() {
        fillWithMovies()
    }
    func fillWithMovies() {
       let newMovies = [
        Movie(name: "Inception", director: "Mamadou Sow",isWatched: true,rateMovie: 1),
        Movie(name: "The house of hill", director: "Timon De Maegdt",isWatched: false,rateMovie: 2),
        Movie(name: "Champions League", director: "Mo Khouder",isWatched: false,rateMovie: 3),
        Movie(name: "My name is Sarah", director: "Flore Vl",isWatched: false,rateMovie: 4),
        Movie(name: "Stranger things", director: "Jelle Veireman",isWatched: false,rateMovie: 1)
        ]
        movies.append(contentsOf : newMovies)
    }
    
    func addMovie(name : String, director : String, isWatched : Bool, rateMovie : Int) {
        movies.append(Movie(name: name, director: director,isWatched: isWatched,rateMovie: rateMovie))
        
    }
    func updateMovie(id:UUID,name : String, director : String, isWatched : Bool, rateMovie : Int) {
        if let m  = movies.firstIndex(where: {$0.id == id}) {
            
            movies[m].editMovie(name: name, director: director, isWatched: isWatched, rateMovie: rateMovie)
        }
        
       
    }
    
    
    func deleteMovie(indexSet : IndexSet){
        movies.remove(atOffsets: indexSet)
    }
    func moveMovie(indices: IndexSet, newOffset : Int) {
        movies.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func shuffleMovies(){
        movies.shuffle()
    }
    
    func removeFirstMovie(){
        movies.removeFirst()
    }
    
    func removeLasttMovie(){
        movies.removeLast()
    }
    
    func reverseMovies(){
        movies.reverse()
    }
}

