//
//  MovieDetailsView.swift
//  Movies
//
//  Created by Daye Sow on 10/12/2021.
//

import SwiftUI

func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}

struct InfoMovieView: View {
    
    var movie : Binding<Result>

   // @State var movie : Movie
//    @State var nameMovie = ""
//    @State var directorName = ""
//    @State var watched = false
//    @State var rateOfTheMovie = 0
    @EnvironmentObject var viewModel :  MovieViewmodel
    
    init(movie:Binding<Result>){
        self.movie = movie
    }
    var body : some View {
        
        
        Form{
            Section(header : Text("General information")){
                
                Text("Director : \(movie.wrappedValue.director ?? "")")
                Toggle("Watched the movie", isOn: self.movie.isWatched ?? false).disabled(true)
                
                }
            Section(header: Text("Rating")){
                
                    
                RatingView(rating: self.movie.rateMovie ?? 0)
                }
            }
        .padding()
        .toolbar {
          ToolbarItemGroup(placement: .navigationBarTrailing){
  
              NavigationLink(destination: EditMovieView(id: movie.wrappedValue.id, title: movie.wrappedValue.title, director: movie.wrappedValue.director ?? "", isWatched: movie.wrappedValue.isWatched ?? false, rateMovie: movie.wrappedValue.rateMovie ?? 0 ), label: {
                    Image(systemName: "square.and.pencil")
                })
              }
          }
                  .navigationTitle("\(movie.wrappedValue.title)")
        
            }
        }
        
//        VStack {
//
//
//            Text("\(movie.wrappedValue.name)")
//                        .font(.title2)
//                        .bold()
//                        .multilineTextAlignment(.center)
//                        .padding(.horizontal)
//
//
//            HStack{
//                Text("Director : \(movie.wrappedValue.director)")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//
//               // if self.movie.isWatched {
//                 //   Stepper("Rate of the movie", value: self.movie.rateMovie, in: 0...5).disabled(true)
//
//                RatingView(rating: self.movie.rateMovie)
//
//                   //    }
//                        //Als watch aan is toon dan hoeveel ik deze film op 10 geef
//
//                    }
//
//            Toggle("Watched the movie", isOn: self.movie.isWatched).disabled(true)
//            .padding()
//        }
       
//    }
    

//}


//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
