//
//  VistaTicket.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

//
//  VistasDetailed.swift
//  CaritasMty
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI
import MapKit

struct VistaDetailed: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var ticket : Ticket
    @State var localEnd: Location
    @State private var cargodatos: Bool = false
    @State var showCollectors: Bool
    @State var selectedCollector: Int
    @State var listCollectorOption: Array<RecolectorOption> = []

    var body: some View {
        
        ZStack{
        
            Color("BgColor")
                .ignoresSafeArea()
            
            VStack{
            
                
                
                HStack{ 
                    Text("Ticket - \(ticket.id)")
                        .foregroundColor(.white)
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                        .padding(.leading, 40.0)
                    Spacer()
                }
               
                    
                Rectangle()
                    .fill(Color("ColorAzulVerdePaleta"))
                    .frame(width: 170,height: 7)
                    .cornerRadius(20)
                    .offset(x:-64,y:-25).onAppear(){
                        if let repartidor = repartidor{
                            localEnd = callLocation(ticketID: ticket.id, token: repartidor.accessToken)
                            print("Se cargaron los datos de lcoalizacion")
                            cargodatos = true
                        } else {
                            cargodatos = true
                        }
                    }
                
//                Image("Mapa")
//                    .resizable(resizingMode: .stretch)
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 250)
                if(cargodatos){
                    MiniMapView(coordinatesend: CLLocationCoordinate2D(latitude: localEnd.lat, longitude: localEnd.lng), region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: localEnd.lat, longitude: localEnd.lng), latitudinalMeters: 2000, longitudinalMeters: 2000)).frame(height: 200).padding(.horizontal, 20).cornerRadius(10)
                }else{
                    ProgressView()
                }
                
                
                HStack{
                    Group{
                    Text("Nombre: ")
                        .padding(.bottom,5)
                        .fontWeight(.bold)
                    Text(ticket.nombre)
                        .padding(.bottom,5.0)
                    }.padding(.leading, 70.0).foregroundColor(.white)
                        Spacer()
                }
                
                Image("Mapa")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                
                if (!showCollectors) {
                    VStack{
                        Group{
                            Text("Dirección")
                                .padding(.bottom,5.0)
                                .fontWeight(.bold)
                            Text(ticket.direccion)
                           
                        }
                        .font(.system(size: 20))
                        .padding(.horizontal,20.00)
                        Text("$ \(String(format: "%.2f", ticket.importe))").bold()
                            .font(.system(size: 36))
                            .padding(.vertical,5.0)
                        if(ticket.estatus == "Recolectado"){
                            HStack{}.padding(.bottom, 200.0)}
                            
                        if(ticket.estatus == "No recolectado"){
                            
                            Text("No recolectado")
                                .foregroundColor(Color.white)
                                .padding(.bottom,5.0)
                                .fontWeight(.bold)
                            
                        }
                        if(ticket.estatus == "Sin Empezar"){
                            Button(action: {
                                showCollectors = true
                            }, label: {
                                Text("Reasginar")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                
                                    .frame(width: 220.0, height: 60.0)
                                    .background(Color("ColorAzulVerdePaleta"))
                                    .cornerRadius(30)
                                    .shadow(color:.black,radius: 2,y:2)
                            })
                            .padding(.top, 10)
                        }
                    }
                    .foregroundColor(.white)
                }
                else {
                    VStack {
                        Text("Comentarios")
                            .foregroundColor(.white)
                            .font(.system(size: 34))
                            .fontWeight(.bold)
                            .padding(.top,20)
                        
                        Picker(selection: $selectedCollector, label: Text("Elegir")) {
                            ForEach(listCollectorOption) {
                                option in
                                Text(option.nombre)
                                    .font(.title)
                                    .tag(option.id)
                                    .foregroundColor(.white)
                            }
                        }.pickerStyle(.wheel)
                        
                    
                        Button(action: {
                            
                            
                            if let repartidor = repartidor {
                                changeCollector(ticketID: ticket.id, collectorId: selectedCollector, token: repartidor.accessToken) {
                                    (success, error) in
                                    
                                    if(success){
//                                        if let listat = listaTicketsR{
                                            self.presentationMode.wrappedValue.dismiss()
//                                        }
                                    }
                                    else{
                                        print("Error")
                                    }
                                }
                            }
                        }, label: {
                            Text("Confirmar")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                            
                                .frame(width: 220.0, height: 60.0)
                                .background(Color("ColorAzulVerdePaleta"))
                                .cornerRadius(30)
                                .shadow(color:.black,radius: 2,y:2)
                        })
                        .padding(.top, 10)
                    }
                    .padding(.horizontal, 30.0)
                }
            }
        }
        .onAppear(){
            
            if let usuario = repartidor {
                listCollectorOption = getRecolectorOptions(token: usuario.accessToken)
            }
            
        }
    }
}

struct VistaTicket_Previews: PreviewProvider {
    static var previews: some View {
        VistaTicket(ticket: listaTickets[0], localEnd: Location(lat: 0.0, lng: 0.0))
        // VistaDetailed(ticket: listaTickets[0], showCollectors: false, selectedCollector: 3)
    }
}
