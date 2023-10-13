//
//  Reporte.swift
//  CaritasMty
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI

struct Reporte: View {
    @State var lista: Array<Recibo> = []
    
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
                ScrollView{
                    LazyVStack(spacing: 10){
                            ForEach(lista) { reciboItem in
                                    ReciboIndividual(recibo: reciboItem)
                            }
                                .buttonStyle(.plain)
                                .padding(0)
                        }
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
