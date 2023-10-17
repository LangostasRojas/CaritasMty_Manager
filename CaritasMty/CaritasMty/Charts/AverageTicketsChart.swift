//
//  ChartPorMunicipio.swift
//  CaritasMty
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI
import Charts


struct AvarageTicketsChart: View {
    var Ingresos: [AverageTickets] = [AverageTickets(fecha: "Lunes", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Martes", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Domingo", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Miercoles", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Sabado", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Jueves", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Viernes", id: 1, porcentaje: 70, recolectado: 10, total: 20)]
    var body: some View {
        Chart(Ingresos) {
                BarMark(
                    x: .value("Municipio", $0.fecha),
                    y: .value("Ingresos", $0.porcentaje)
                ).offset(y:-50)
        }.onAppear(){
            if let Ingresos = AvarageTickets{
                
            }
        }
        .frame(width: 350,height: 350)
        .foregroundColor(Color("ColorAzulVerdePaleta"))
        .background(.black)
        .cornerRadius(20)
        .chartYScale(domain: [0, 200])
        .chartYAxis {
           AxisMarks() {
               let value = $0.as(Int.self)!
               AxisValueLabel {
                   Text("\(value)").foregroundColor(.white)
               }.offset(x:0,y:-45)
           }
        }
        .chartXAxis{
            AxisMarks(){
                let value = $0.as(String.self)!
                AxisValueLabel{
                    Text("\(value)").foregroundColor(.white)
                        .rotationEffect(.degrees(90))


                }.offset(y:-25)
            }
        }
        
        
        
    }
}

struct AverageTickets_Preview: PreviewProvider {
    static var previews: some View {
        AvarageTicketsChart()
    }
}

