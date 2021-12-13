//
//  IosAppMoviesApp.swift
//  IosAppMovies
//
//  Created by Daye Sow on 13/12/2021.
//

import SwiftUI

@main
struct IosAppMoviesApp: App {
    
    @StateObject var movieViewmodel : MovieViewmodel = MovieViewmodel()
    var body: some Scene {
        WindowGroup {
            MovieView()
                .environmentObject(movieViewmodel)
        }
    }
}
