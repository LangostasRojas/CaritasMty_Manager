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
        VStack{
            Table(lista) {
                TableColumn("Recibo") {recibo in
                    Text("\(recibo.id)")
                }
                TableColumn("Donante") {recibo2 in
                    Text("\(recibo2.donante)")
                 }
                TableColumn("Cantidad") {recibo in
                    Text("\(recibo.cantidad)")
                 }
                TableColumn("Cobrado") {recibo in
                    Text(recibo.cobrado ? "Si" : "No")
                 }
                TableColumn("OBSERVACIONES", value: \.observaciones)
            }
        }.onAppear(){
            lista = getReporte(token: repartidor?.accessToken ?? "")
            print(lista)
            }
        }
    }



struct Reporte_Previews: PreviewProvider {
    static var previews: some View {
        Reporte()
    }
}
