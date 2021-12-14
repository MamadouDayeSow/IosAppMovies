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
            MovieView()
            .tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            
          
            SettingsView()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }.background(.red)
        
       
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.light).environmentObject(MovieViewmodel()).previewInterfaceOrientation(.portrait)
    }
}
