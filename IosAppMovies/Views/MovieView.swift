//
//  MovieView.swift
//  IosAppMovies
//
//  Created by Daye Sow on 13/12/2021.
//

//
//  ContentView.swift
//  Movies
//
//  Created by Daye Sow on 08/12/2021.
//

import SwiftUI


struct MovieView: View {
    
    @EnvironmentObject var viewModel :  MovieViewmodel
    
    var body: some View {
        
        
        
        ZStack {
            
            NavigationView {
                
                
               
                    VStack {
                        
                        
                        MovieListView()
                       
                            .navigationTitle("🎬 My Watchlist")
                            .navigationBarItems(
                            leading: EditButton(),
                            trailing: NavigationLink("Add",destination : AddMovieView()))
                            
                    }
                
                    
            }
            
        }
       
        
        
        //.accentColor(Color(.label))
    }
}



struct MovieListView : View {
    @Environment(\.editMode) private var editMode
    @EnvironmentObject var viewModel :  MovieViewmodel
    var body: some View {
//        ZStack(alignment: .bottomTrailing) {
//            ScrollView{
                
                List {
                    ForEach(viewModel.movies, id: \.id) { movie in
                        var itemChangable = movie
                        let itemBinding = Binding<Movie>(
                            get : {itemChangable},
                            set : {it in itemChangable = it}
                        )
                        NavigationLink(
                            destination: InfoMovieView(movie: itemBinding), label: {
                                HStack{
                                    
                                    Text(movie.name)
                                        
                                    Spacer()
                                    
                                    if self.editMode?.wrappedValue != .active {
                                        RatingView(rating: itemBinding.rateMovie)
                                    }
                                   
                                        
                                        
                                      
                                    
                                        
                                   
            //                        VStack(alignment : .trailing){
            //                            Text(movie.director)
            //
            //                        }
                                    
                                }.padding(5)
                            })
                      
                    }
                    .onDelete(perform: viewModel.deleteMovie)
                    .onMove(perform: viewModel.moveMovie)
                }
         //   }
//            Menu("Menu".uppercased()){
//                Button("Remove first", action: {viewModel.removeFirstMovie()})
//                Button("Remove last", action: {viewModel.removeLasttMovie()})
//                Button("Shuffle", action: {viewModel.shuffleMovies()})
//                Button("Reverse", action: {viewModel.reverseMovies()})
//            }
        }
  //  }
}

struct RatingView : View {
   
    
    
    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View{
        
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
            .preferredColorScheme(.light)
            .environmentObject(MovieViewmodel())
        
        
        
    }
}

#if canImport(UIKit)
extension View {
    
    func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
