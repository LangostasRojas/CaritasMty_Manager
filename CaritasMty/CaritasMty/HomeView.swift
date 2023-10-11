//
//  HomeView.swift
//  CaritasMty
//
//  Created by Alumno on 04/09/23.
//

import SwiftUI

struct HomeView: View {
//    @State var usuario: Array<User> = []
    var body: some View {
        TabView{
            Home()
                .tabItem {
                    Label("Inicial", systemImage: "figure.basketball")
                }
            VistaListaConjunto()
                .tabItem {
                    Label("Cool 😈", systemImage: "basketball.circle")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
        
    }
}

