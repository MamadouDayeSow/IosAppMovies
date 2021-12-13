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
    
    @State  var nameMovie = ""
    @State var directorName = ""
    @State private var watched = false
    @State private var rateOfTheMovie = 0
    var id:UUID = UUID()
    
    
    init(id:UUID,name : String, director : String, isWatched : Bool, rateMovie : Int){
       
        self.id = id
        
        _nameMovie = State(initialValue: name)
        _directorName = State(initialValue: director)
        _watched = State(initialValue: isWatched)
        _rateOfTheMovie = State(initialValue: rateMovie)
        
    }
    
    var body : some View {
        
       
        
        Form{
            Section(header : Text("Movie information")){
                TextField("Name movie", text : $nameMovie).foregroundColor(isNameCorrect() ? .green : .red)
                TextField("Director movie", text : $directorName).foregroundColor(doStringContainsNumber() ? .red : .green)
                Toggle("Watched the movie", isOn: $watched)
                
              
            }
            Section(header: Text("Rating")){
                if watched {
                    Stepper("Rate of the movie", value: $rateOfTheMovie, in: 0...5)
                    RatingView(rating: $rateOfTheMovie)
                }
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
        viewModel.updateMovie(id : id, name: nameMovie, director: directorName, isWatched: watched, rateMovie: rateOfTheMovie)
        presentationMode.wrappedValue.dismiss()
    }
    
    func isNameCorrect() -> Bool{
        if nameMovie.isEmpty {
           return false
        }
        return true
    }
    
    // Copy paste internet
    func doStringContainsNumber() -> Bool{

            let numberRegEx  = ".*[0-9]+.*"
            let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
            let containsNumber = testCase.evaluate(with: directorName)

            return containsNumber
            }
    
}

//
//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditMovieView()
//    }
//}
