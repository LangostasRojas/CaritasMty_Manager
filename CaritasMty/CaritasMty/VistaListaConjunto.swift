//
//  TicketA.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

var datosManager: Array<Recolector> = []


struct VistaListaConjunto: View {
    @State var listaTemp: Array<Recolector> = []
    @State var sectionStates: [Bool] = []
    //@State var ReloadScroll: Bool =

        var body: some View {
        NavigationStack{
            ZStack{
                Color("BgColor").ignoresSafeArea()
                
                VStack{
                    HStack{
                        Text("Recolectores")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .padding(.leading, 40.0)
                        Spacer()
                        
                    }
                    .padding(.top, 20.0)
                    Rectangle()
                        .fill(Color("ColorAzulVerdePaleta"))
                        .frame(width: 250,height: 7)
                        .cornerRadius(20)
                        .offset(x:-34,y:-25)
                    ScrollViewReader { reader in
                        ScrollView {
                           LazyVStack(spacing: 10) {
                               
                               ForEach(0..<listaTemp.count, id:\.self) { recolectorItem in
                                   SectionView(recolector: listaTemp[recolectorItem].nombreR, isExpanded: $sectionStates[recolectorItem],recolectoritem: recolectorItem)
                               }
                               
                               
                           }
                        }.onAppear(){
                            reader.scrollTo(0)
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
                
            }.onAppear(){
                
                //No tocar :)
                if let listaTicketsManagers2 = listaTicketsManagers2 {
                    datosManager = listaTicketsManagers2
                    listaTemp = listaTicketsManagers2
                    sectionStates = Array(repeating: false, count: listaTicketsManagers2.count)

                }
                
                
      
                
            }
            
        }
    }
    
    struct VistaListaTicket_Previews: PreviewProvider {
        static var previews: some View {
            VistaListaConjunto()
        }
        
    }
}

struct SectionView: View {
    let recolector: String
    @Binding var isExpanded: Bool
    let recolectoritem: Int

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
            }) {
                HStack {
                    Text("\(recolector)")
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
                    ForEach(0..<datosManager[recolectoritem].numTickets) { ticket in
                        NavigationLink(destination: VistaDetailed(ticket: datosManager[recolectoritem].Tickets[ticket], showCollectors: false, selectedCollector: 3)) {
                            ListaIndividual(ticket: datosManager[recolectoritem].Tickets[ticket])
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
