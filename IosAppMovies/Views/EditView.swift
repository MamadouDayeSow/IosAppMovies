//
//  EditView.swift
//  IosAppMovies
//
//  Created by Daye Sow on 13/12/2021.
//

//
//  EditMovieView.swift
//  Movies
//
//  Created by Daye Sow on 10/12/2021.
//

import SwiftUI


struct EditMovieView: View {
    
    @EnvironmentObject var viewModel :  MovieViewmodel
    @Environment(\.presentationMode) var presentationMode
    @State var movie : Movie
    @State private var nameMovie = ""
    @State private var directorName = ""
    @State private var watched = false
    @State private var rateOfTheMovie = 0
    
    
    var body : some View {
        
       
        
        Form{
            Section(header : Text("Movie information")){
                TextField("Name movie", text : self.$nameMovie)
                TextField("Director movie", text : self.$directorName)
                Toggle("Watched the movie", isOn: self.$watched)
                Stepper("Rate of the movie", value: self.$rateOfTheMovie, in: 0...5)
                Text("You gave this film a \(rateOfTheMovie) on 5")
            }
        }
        .accentColor(.green)
        .navigationTitle("Edit Movie ")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button{
                    hideKeyBoard()
                }   label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
                
                NavigationLink(destination: MovieListView(), label: {
                    Button(action: {editMovie()}
                           , label: {
                        Text("Save")
                    })
                })
            }
            
        }
        
    }
    
    func editMovie() {
//        viewModel.addMovie(name: nameMovie, director: directorName)
//        presentationMode.wrappedValue.dismiss()
        if var m  = viewModel.movies.first(where: {$0.id == movie.id}) {
            
            m.name = movie.name
            m.director = movie.director
            m.isWatched = movie.isWatched
            m.rateMovie = movie.rateMovie
        }
//        movie.name = nameMovie
//        movie.director = directorName
//        movie.isWatched = watched
//        movie.rateMovie = rateOfTheMovie
        //viewModel.updateMovie(movie: movie)
        presentationMode.wrappedValue.dismiss()
    }
    
    
}


struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
