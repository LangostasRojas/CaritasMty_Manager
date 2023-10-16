//
//  ChartPorMunicipio.swift
//  CaritasMty
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI
import Charts


struct ChartPorMunicipio: View {
     var Ingresos: [MunicipiosDonaciones] = []
    var body: some View {
        Chart(IngresosPorMunicpio!) {
                BarMark(
                    x: .value("Municipio", $0.municipio),
                    y: .value("Ingresos", $0.ingresos)
                )
        }.onAppear(){
            if let Ingresos = IngresosPorMunicpio{
                
            }
        }
        .frame(width: 300,height: 200)
        .foregroundColor(Color("ColorAzulVerdePaleta"))
        .background(.black)
        .cornerRadius(20)
        .chartYScale(domain: [0, 50000])
        .chartYAxis {
           AxisMarks() {
               let value = $0.as(Int.self)!
               AxisValueLabel {
                   Text("\(value)").foregroundColor(.white)
               }
           }
        }
        .chartXAxis{
            AxisMarks(){
                let value = $0.as(String.self)!
                AxisValueLabel{
                    Text("\(value)").foregroundColor(.white)

                }
            }
        }
        
        
        
    }
}

struct ChartPorMunicipio_Previews: PreviewProvider {
    static var previews: some View {
        ChartPorMunicipio()
    }
}
