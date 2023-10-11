//
//  Home.swift
//  CaritasMty
//
//  Created by Alumno on 11/10/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack{
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
                        
                        if let usuario = repartidor {
                            
                            Text("\(usuario.name)")
                                .font(.system(size:37))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(width: 200)
                                .padding(.bottom,30)
                            
                        }
                        
                        //                        NavigationLink("Tickets",destination: VistaListaConjunto())
                        //                            .frame(width: 150)
                        //                            .font(.title2)
                        //                            .bold()
                        //                            .foregroundColor(.white)
                        //                            .padding(.vertical,15)
                        //                            .padding(.horizontal,70)
                        //                            .background(Color("ColorAzulVerdePaleta"))
                        //                            .cornerRadius(50)
                        //                            .shadow(color:.black,radius: 2,y:2)
                        //                            .padding(.bottom,30)
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
                        NavigationLink("Recolectores",destination: VistaListaConjunto())
                            .frame(width: 150)
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical,15)
                            .padding(.horizontal,70)
                            .background(Color("ColorAzulVerdePaleta"))
                            .cornerRadius(50)
                            .shadow(color:.black,radius: 2,y:2)
                            .padding(.bottom,30)
                        
                        
                    }
                    
                    
                    
                    
                }
                
            }
            
        }
        
//        .onAppear(){
//
//            if let repartidor = repartidor {
//                usuario = repartidor
//            }
//
//        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
