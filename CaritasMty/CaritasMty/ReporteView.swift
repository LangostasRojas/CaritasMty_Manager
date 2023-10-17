//
//  Reporte.swift
//  CaritasMty
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI

struct Reporte: View {
    @State var lista: Array<Recibo> = []
    @State private var selectedFliter: Int = 1
    
    var body: some View {
        ZStack{
            Color("BgColor").ignoresSafeArea()
            VStack{
                HStack{
                    Text("Reporte")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding(.leading, 40.0)
                    Spacer()
                }.padding(.top, 20.0)
                Rectangle()
                    .fill(Color("ColorAzulVerdePaleta"))
                    .frame(width: 170,height: 7)
                    .cornerRadius(20)
                    .offset(x:-70,y:-25)
                Picker(selection: $selectedFliter, label:Text("Picker")){
                    Text("Todos").tag(1)
                    Text("Recolectados").tag(2)
                    Text("Pendientes").tag(3)
                }.pickerStyle(.segmented).padding([.leading, .bottom, .trailing], 8.0)//.colorMultiply(Color("ColorAzulVerdePaleta"))
                    
                ScrollView{
                    LazyVStack(spacing: 10){
                        if (selectedFliter == 1){
                            ForEach(lista) { reciboItem in
                                ReciboIndividual(recibo: reciboItem)
                            }
                            .buttonStyle(.plain)
                            .padding(0)
                        }
                        else if (selectedFliter == 2){
                            ForEach(lista) { reciboItem in
                                if (reciboItem.cobrado){
                                    ReciboIndividual(recibo: reciboItem)
                                }
                            }
                            .buttonStyle(.plain)
                            .padding(0)
                        }
                        else {
                            ForEach(lista) { reciboItem in
                                if (!reciboItem.cobrado){
                                    ReciboIndividual(recibo: reciboItem)
                                }
                            }
                            .buttonStyle(.plain)
                            .padding(0)
                        }
                    }
                }.refreshable {
                    lista = getReporte(token: repartidor?.accessToken ?? "")
                }

            }.onAppear(){
                lista = getReporte(token: repartidor?.accessToken ?? "")
            }
        }
    }
}



struct Reporte_Previews: PreviewProvider {
    static var previews: some View {
        Reporte()
    }
}
