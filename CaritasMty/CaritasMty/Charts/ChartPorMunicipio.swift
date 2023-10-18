import SwiftUI
import Charts


struct ChartPorMunicipio: View {
    @State private var Ingresos: [MunicipiosDonaciones] = []
    @State private var isComplete: Bool
    @State private var height: CGFloat = 400.0
    @State private var width: CGFloat = 400.0
        
      
        init(isComplete: Bool) {
            self._isComplete = State(initialValue: isComplete)
        }
    var body: some View {
        
        VStack{
            
            HStack{
                if isComplete{
                    
                    Text("Porcentaje de compleción")
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
                        x: .value("Municipio", $0.municipio),
                        y: .value("Ingresos", $0.ingresos)
                    )
                }.onAppear(){
                    
                    if !isComplete{
                        
                        height = 150.0
                        width = 150.0
                        
                    }
                    
                    if let IngresosPorMunicpio = IngresosPorMunicpio{
                        
                        Ingresos = IngresosPorMunicpio
                        
                    }
                }
                .frame(width: width,height: height)
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
                    
                    if isComplete{
                        AxisMarks(){
                            let value = $0.as(String.self)!
                            AxisValueLabel{
                                Text("\(value)").foregroundColor(.white).rotationEffect(.degrees(90))
                                
                            }
                        }
                    }
                }
  
                
            
            }.background(Color("ColorDash"))
            
        
    }
}

struct ChartPorMunicipio_Previews: PreviewProvider {
    static var previews: some View {
        ChartPorMunicipio(isComplete: true)
    }
}
