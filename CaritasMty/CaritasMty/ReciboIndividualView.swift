//
//  ReciboIndividual.swift
//  CaritasMty
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct ReciboIndividual: View {
    var recibo : Recibo
    var body: some View {
        ZStack{
            Color("BgColor").ignoresSafeArea()
            HStack{
                VStack(alignment:.leading){
                    HStack{
                        Text("Recibo:").font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom,5)
                            .bold()
                        Spacer()
                        Text("\(recibo.id)").foregroundColor(.white).padding(.trailing, 30.0).font(.system(size: 24))
                    }
                    .padding(.leading, 30.0)
                    HStack{
                        Text("Donante:")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom,5)
                            .bold()
                        Spacer()
                        Text("\(recibo.donante)").foregroundColor(.white).padding(.trailing, 30.0).font(.system(size: 24))
                    }.padding(.leading, 30.0)
                    HStack{
                        Text("Cantidad:").font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom,5)
                            .bold()
                        Spacer()
                        Text("$ \(String(format: "%.2f", recibo.cantidad))").foregroundColor(.white).padding(.trailing, 30.0).font(.system(size: 24))
                    }.padding(.leading, 30.0)
                    HStack{
                        Text("Cobrado:").font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom,5)
                            .bold()
                        Spacer()
                        Text(recibo.cobrado ? "Si":"No").foregroundColor(.white).padding(.trailing, 30.0).font(.system(size: 24))
                    }.padding(.leading, 30.0)
                    if(recibo.observaciones != ""){
                        
                        Text("Observaciones:")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.leading, 30.0)
                            .padding(.bottom, 5)
                        Text(recibo.observaciones).foregroundColor(.white).padding(.trailing, 30.0).font(.system(size: 24))
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.leading, 30.0)
                            .padding(.bottom, 5)
                    }
                    Divider().frame(width: 300, height: 1.4)
                        .overlay(Color("ColorAzulVerdePaleta"))
                        .padding(.leading, 30.0)
                    
                }
            }.padding()
                .background(Color("BgColor"))
            
        }
    }
    
}
