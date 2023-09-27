//
//  HomeManager.swift
//  CaritasMty
//
//  Created by Alumno on 27/09/23.
//

import SwiftUI

struct HomeManager: View {
    var body: some View {
        VStack{
            ZStack{
                Color("BgColor").ignoresSafeArea()
                VStack{
                    Circle()
                        .fill(.gray)
                        .frame(width:200)
                        .padding(.bottom,20)
                    
                }
            }
        }
    }
}

struct HomeManager_Previews: PreviewProvider {
    static var previews: some View {
        HomeManager()
    }
}
