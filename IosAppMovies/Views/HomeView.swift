//
//  HomeView.swift
//  IosAppMovies
//
//  Created by Daye Sow on 13/12/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        TabView {
        MovieListView()
            .tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            
            AddMovieView()
            .tabItem{
                Image(systemName: "plus")
                Text("Add movie")
            }
        }
        
       
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(MovieViewmodel())
    }
}
