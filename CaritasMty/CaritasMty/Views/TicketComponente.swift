//
//  TicketComponente.swift
//  CaritasMty
//
//  Created by Alumno on 27/09/23.
//

import SwiftUI

struct TicketComponente: View {
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
                Image(systemName: "chevron.right")
                    .foregroundColor(Color("ColorAzulVerdePaleta"))
                    .padding(.trailing, 15.0)
                    .bold()
                    
                    
                
                
                
                
            }.padding()
                .background(Color("BgColor"))
            
        }
    }
    
}

struct JugadorRow_Previews: PreviewProvider {
    static var previews: some View {
        TicketComponente(ticket: listaTickets[0])
    }
}
