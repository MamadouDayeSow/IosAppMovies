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
    
    
    @Published var movies : [Result] = []

    
    
    init() {
      //fetchweather()
        fetchData()
//        getJSON(urlString: "https://api.themoviedb.org/3/movie/popular?api_key=16f4b15461a4070a5b66226e9b61aa64&language=en-US&page=1") { (followers:Movie?) in
//            if let followers = followers {
//                for result in followers.results {
//                    print(result.title )
//                }
//            }
//        }
    }
    func fetchData() {
            getJSON(urlString: "https://api.themoviedb.org/3/movie/popular?api_key=16f4b15461a4070a5b66226e9b61aa64&language=en-US&page=1") { (followers:Movie?) in
                DispatchQueue.main.async {
                    self.movies = followers?.results ?? []
                    
                }
            }
        }
  
    func getJSON<T: Decodable>(urlString: String, completion: @escaping (T?) -> Void) {
        guard let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = data else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(T.self, from: data) else {
                completion(nil)
                return
            }
            completion(decodedData)
        }.resume()
    }
    
    
    
//    func fetchweather() {
//
//       guard let url = URL(string:  "https://api.themoviedb.org/3/movie/popular?api_key=16f4b15461a4070a5b66226e9b61aa64&language=en-US&page=1")
//        else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) {data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            //Convert data to model
//
//            do {
//                let model = try JSONDecoder.decode(<#T##self: JSONDecoder##JSONDecoder#>)
//            }
//        }
//        task.resume()
//    }
//    func fillWithMovies() {
//       let newMovies = [
//        Movie(name: "Inception", director: "Mamadou Sow",isWatched: true,rateMovie: 1),
//        Movie(name: "The house of hill", director: "Timon De Maegdt",isWatched: false,rateMovie: 2),
//        Movie(name: "Champions League", director: "Mo Khouder",isWatched: false,rateMovie: 3),
//        Movie(name: "My name is Sarah", director: "Flore Vl",isWatched: false,rateMovie: 4),
//        Movie(name: "Stranger things", director: "Jelle Veireman",isWatched: false,rateMovie: 1)
//        ]
//        movies.append(contentsOf : newMovies)
//    }
    
    func addMovie(title : String, director : String, isWatched : Bool, rateMovie : Int) {
        movies.append(Result(title: title,director: director,isWatched: isWatched,rateMovie: rateMovie))
        
    }
    func updateMovie(id:Int,title : String, director : String, isWatched : Bool, rateMovie : Int) {
        if let m  = movies.firstIndex(where: {$0.id == id}) {
            
            movies[m].editMovie(title: title, director: director, isWatched: isWatched, rateMovie: rateMovie)
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

