//
//  TicketRow.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct ListaIndividual: View {
    var colorDeTicket : String = ""
    var ticket : Ticket

    
    var body: some View {
        ZStack{
            Color("BgColor").ignoresSafeArea()
            HStack{
                
                Image("Mapa").resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .padding(.trailing)
                
                VStack(alignment: .leading){
                    Text("\(ticket.nombre)")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                        .bold()
                    Text("$ \(String(format: "%.2f", ticket.importe))")
                        .font(.title)
                        .foregroundColor(.white)
                    
                }
                Spacer()
                
                Circle()
                    .frame(width: 20.0)
                    .foregroundColor(Color(switchStatus(for:ticket.estatus)))
                    
                    
                
                
                
                
            }.padding()
                .background(Color("BgColor"))
            
        }
    }
    

    
}
private func switchStatus(for status: String) -> String {
    var colorTicket = ""
    switch status{
        case "Sin Empezar":
            colorTicket = "Pendiente"
        case "En Ruta":
            colorTicket = "EnCurso"
        case "Recolectado":
            colorTicket = "Completado"
        case "No recolectado":
        colorTicket = "Rechazado"
        default: break
       
    }
        return colorTicket
}


struct JugadorRow_Previews: PreviewProvider {
    static var previews: some View {
        ListaIndividual(ticket: listaTickets[0])
    }
}
