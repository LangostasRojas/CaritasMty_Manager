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
                    Label("Inicio", systemImage: "house")
                }.foregroundColor(.white)
            VistaListaConjunto()
                .tabItem {
                    Label("Recolectores", systemImage: "list.bullet")
                }
        }.accentColor(.white)
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
        
    }
}

