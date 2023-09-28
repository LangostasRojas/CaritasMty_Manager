//
//  TicketRow.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct ListaIndividual: View {
    var colorDeTicket : String = "NoCompletado"
    var ticket : Ticket
    var body: some View {
        ZStack{
            Color("BgColor").ignoresSafeArea()
            HStack{
                
                Image("Mapa").resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .padding(.trailing)
                    .padding(.leading, 40)
                
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
                    .foregroundColor(Color(colorDeTicket))
                    .padding(.trailing,30)
                    
                    
                
                
                
                
            }.padding()
                .background(Color("BgColor"))
                .padding(.vertical,15)
            
        }
    }
    
}

struct JugadorRow_Previews: PreviewProvider {
    static var previews: some View {
        ListaIndividual(ticket: listaTickets[0])
    }
}
