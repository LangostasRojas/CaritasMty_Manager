//
//  HomeView.swift
//  CaritasMty
//
//  Created by Alumno on 04/09/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showingPop = false
    @Environment(\.presentationMode) var presentationMode
//    @State var usuario: Array<User> = []
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                   
                    Color("BgColor")
                        .ignoresSafeArea()
                
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {
                                self.showingPop = true
                            }){
                                Image(systemName: "rectangle.portrait.and.arrow.forward").font(.system(size: 25)).padding(.trailing, 30.0).foregroundColor(.white).padding(.top,10)

                            }.alert(isPresented: $showingPop) {

                                Alert(title: Text("Cerras sesion"), message: Text("¿Estas seguro de que quieres cerrar sesión?"), primaryButton: .destructive(Text("Si")){

                                    presentationMode.wrappedValue.dismiss()

                                }, secondaryButton: .cancel()

                                )

                            }
                        }

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
                            
                            Text("\(usuario.name) \(usuario.lastName)")
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

NavigationLink("Dashboard",destination: DashboardManagerView())
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
NavigationLink("Reporte",destination: Reporte())
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
        
    }
}

