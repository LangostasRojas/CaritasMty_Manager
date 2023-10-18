//
//  ChartPorMunicipio.swift
//  CaritasMty
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI
import Charts


struct AvarageTicketsChart: View {
    @State private var isComplete: Bool
    @State private var Ingresos: [AverageTickets] = [AverageTickets(fecha: "Lunes", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Martes", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Domingo", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Miercoles", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Sabado", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Jueves", id: 1, porcentaje: 70, recolectado: 10, total: 20),AverageTickets(fecha: "Viernes", id: 1, porcentaje: 70, recolectado: 10, total: 20)]
    @State private var height: CGFloat = 400.0
    @State private var width: CGFloat = 400.0
    
    init(isComplete: Bool) {
        self._isComplete = State(initialValue: isComplete)
    }
    
    var body: some View {
        
        VStack{
            
            HStack{
                if isComplete{
                    
                    Text("Tickets Promedio")
                        .foregroundColor(.white)
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                        .padding(.leading, 40.0)
                    
                    
                    
                    Spacer()
                }
                
            }
            if isComplete{
                
                Rectangle()
                    .fill(Color("ColorAzulVerdePaleta"))
                    .frame(width: 170,height: 7)
                    .cornerRadius(20)
                    .offset(x:-64,y:-25)
                
            }
            
            
            Chart(Ingresos) {
                BarMark(
                    x: .value("Municipio", $0.fecha),
                    y: .value("Ingresos", $0.porcentaje)
                ).offset(y:-50)
            }.onAppear(){
                if let AvarageTickets = AvarageTickets{
                    
                    Ingresos = AvarageTickets
                    
                }
                
                if !isComplete{
                    
                    height = 150
                    width = 150
                    
                    
                }
            }
            .frame(width: width,height: height)
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
                
                if isComplete{
                    
                    AxisMarks(){
                        let value = $0.as(String.self)!
                        AxisValueLabel{
                            Text("\(value)").foregroundColor(.white)
                                .rotationEffect(.degrees(90))
                            
                            
                        }.offset(y:-25)
                    }
                }
            }
            
        }.background(Color("ColorDash"))
        
    }
}

struct AverageTickets_Preview: PreviewProvider {
    static var previews: some View {
        AvarageTicketsChart(isComplete: true)
    }
}

