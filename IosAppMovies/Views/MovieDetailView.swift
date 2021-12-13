//
//  MovieDetailsView.swift
//  Movies
//
//  Created by Daye Sow on 10/12/2021.
//

import SwiftUI

struct InfoMovieView: View {
    
    var movie : Binding<Movie>

   // @State var movie : Movie
//    @State var nameMovie = ""
//    @State var directorName = ""
//    @State var watched = false
//    @State var rateOfTheMovie = 0
    @EnvironmentObject var viewModel :  MovieViewmodel
    
    init(movie:Binding<Movie>){
        self.movie = movie
    }
    var body : some View {
        
        
        
        VStack {
            
                
            Text("Movie name: \(movie.wrappedValue.name)")
                        .font(.title)
                        .bold()
                       
                    
            HStack {
                Text("Director : \(movie.wrappedValue.director)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
              
               // if self.movie.isWatched {
                 //   Stepper("Rate of the movie", value: self.movie.rateMovie, in: 0...5).disabled(true)
        
                           RatingView(rating: self.movie.rateMovie)
                   //    }
                        //Als watch aan is toon dan hoeveel ik deze film op 10 geef
                        
                    }
            Toggle("Watched the movie", isOn: self.movie.isWatched).disabled(true)
            .padding()
        }
        .padding()
        .toolbar {
          ToolbarItemGroup(placement: .navigationBarTrailing){
  
              NavigationLink(destination: EditMovieView(id: movie.wrappedValue.id, name: movie.wrappedValue.name, director: movie.wrappedValue.director, isWatched: movie.wrappedValue.isWatched, rateMovie: movie.wrappedValue.rateMovie), label: {
                    Image(systemName: "square.and.pencil")
                })
              }
          }
                  .navigationTitle("Information Movie")
        
    }
    

}


//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
