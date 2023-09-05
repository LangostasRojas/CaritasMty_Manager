//
//  HomeView.swift
//  CaritasMty
//
//  Created by Alumno on 04/09/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {

        VStack{
            ZStack{
                
                Color("BgColor")
                        .ignoresSafeArea()
                
                VStack{
                    Circle()
                        .fill(.gray)
                        .frame(width: 200)
                        .padding(.bottom,20)
                    Text("Bienvenid@")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Rectangle()
                        .fill(Color("ColorAzulVerdePaleta"))
                        .frame(width: 150,height: 5)
                        .cornerRadius(20)
                    Text("Nombre del Manager ")
                        .font(.system(size:37))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 200)
                        .padding(.bottom,30)
                    Button(action: {
                        
                    }, label: {
                        Text("Tickets")
                            .frame(width: 150)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical,15)
                            .padding(.horizontal,70)
                            .background(Color("ColorAzulVerdePaleta"))
                            .cornerRadius(50)
                            .shadow(color:.black,radius: 2,y:2)
                    })
                    .padding(.bottom,30)
                    Button(action: {
                        
                    }, label: {
                        Text("Repartidores")
                            .frame(width: 150)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical,15)
                            .padding(.horizontal,70)
                            .background(Color("ColorAzulVerdePaleta"))
                            .cornerRadius(50)
                            .shadow(color:.black,radius: 2,y:2)
                    })
                    .padding(.bottom,30)
                        
                }
                
                TabView {
                     
                }
               
                    
                
            }
            
        }
       
    }
    
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

