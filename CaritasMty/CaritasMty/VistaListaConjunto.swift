//
//  TicketA.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI
var datosManager = cargarDatosManager()

struct TicketA: View {
    @State private var sectionStates: [Bool] = Array(repeating: false, count: datosManager.count)

    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("BgColor").ignoresSafeArea()
                
                VStack{
                    HStack{
                        Text("Tickets")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .padding(.leading, 40.0)
                        Spacer()
                        
                    }
                    .padding(.top, 20.0)
                    Rectangle()
                        .fill(Color("ColorAzulVerdePaleta"))
                        .frame(width: 170,height: 7)
                        .cornerRadius(20)
                        .offset(x:-83,y:-25)
                    ScrollView {
                               LazyVStack(spacing: 10) {
                                   ForEach(0..<datosManager.count, id: \.self) { recolector in
                                       SectionView(recolector: recolector, isExpanded: $sectionStates[recolector])
                                   }
                               }
                    }
                    
                    
                    
                    //                    List(listaTickets){ ticketItem in
                    //                        NavigationLink(destination:VistaTicket(ticket: ticketItem) ){
                    //                            TicketRow(ticket: ticketItem)
                    //                        }.buttonStyle(.plain)
                    //                            .padding(0)
                    //
                    //                    }.scrollContentBackground(.hidden)
                    //                        .listStyle(.plain)
                    //                        .listRowSeparator(.hidden)
                    //                        .padding(0)
                    
                    
                }
                
            }
            
        }
    }
    
    struct TicketA_Previews: PreviewProvider {
        static var previews: some View {
            TicketA()
        }
    }
}

struct SectionView: View {
    let recolector: Int
    @Binding var isExpanded: Bool

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
            }) {
                HStack {
                    Text("Recolector \(recolector + 1)")
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading,30)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                        .foregroundColor(Color("ColorAzulVerdePaleta"))
                        .padding(.trailing,30)

                    
                }
                .padding(.horizontal)
                .padding(.vertical,10)
                
                
            }
            Rectangle()
                .fill(Color("ColorAzulVerdePaleta"))
                .frame(width: 170,height: 3)
                .cornerRadius(20)
                .padding(.vertical,13)
            

            if isExpanded {
                ForEach(0..<datosManager[recolector].count, id: \.self) { ticketIndi in
                    NavigationLink(destination: VistaTicket(ticket: datosManager[recolector][ticketIndi])) {
                        ListaIndividual(ticket: datosManager[recolector][ticketIndi])
                    }
                    
                }
                Rectangle()
                    .fill(Color("ColorAzulVerdePaleta"))
                    .frame(width: 170,height: 7)
                    .cornerRadius(20)
                    .padding(.bottom,40)
            }
        }
        .cornerRadius(8)
        .padding(.vertical, 3)
    }
}
