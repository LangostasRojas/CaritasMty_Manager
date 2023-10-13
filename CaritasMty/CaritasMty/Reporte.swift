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
            Text("Aqui va algo estilo card como ticket que enseña información del recibo y se hace click para detalle que tiene toda la info.")
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
