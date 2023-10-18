import SwiftUI

struct CompletionRateChart: Decodable {
    let porcentaje: Double
    let recolectado: Int
    let total: Int
}
public extension Color {
    static let lightText = Color(UIColor.lightText)
    static let darkText = Color(UIColor.darkText)

    static let label = Color(UIColor.label)
    static let secondaryLabel = Color(.white)
    static let tertiaryLabel = Color(UIColor.tertiaryLabel)
    static let quaternaryLabel = Color(UIColor.quaternaryLabel)

    static let systemBackground = Color(UIColor.systemBackground)
    static let secondarySystemBackground = Color(UIColor.secondarySystemBackground)
    static let tertiarySystemBackground = Color(UIColor.tertiarySystemBackground)

    // There are more..
}

struct ChartCompletionRate: View {
    
    @State private var porcentaje: [(Double, Color)] = []
    @State private var showChart: Bool = false
    @State private var isComplete: Bool
        
      
        init(isComplete: Bool) {
            self._isComplete = State(initialValue: isComplete)
        }
    
    var body: some View {
        
        VStack {
            HStack{
                if isComplete{
                    
                    Text("Porcentaje de compleción")
                        .foregroundColor(.white)
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                        .padding(.leading, 40.0)
                    
                }
                
                Spacer()
            }
            
            if isComplete{
                
                Rectangle()
                    .fill(Color("ColorAzulVerdePaleta"))
                    .frame(width: 170,height: 7)
                    .cornerRadius(20)
                    .offset(x:-64,y:-25)
                
            }
            
            if showChart {
                
                PieChartView(slices:porcentaje, isDonut: true, hasGap: true)
                
            } else {
                
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.white)).scaleEffect(1.5, anchor: .center)
            }
            
            
            
                if (porcentaje.count == 2) && (isComplete)  {
                                    
                    VStack{
                        HStack{
                            Rectangle()
                                .frame(width: 20,height: 20)
                                .cornerRadius(20)
                                .foregroundColor(.green)
                            Text("Completado: \(Int(porcentaje[0].0))")
                                .font(.title2)
                                .fontWeight(.bold).foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.top, 10.0)
                        HStack{
                            Rectangle()
                                .frame(width: 20,height: 20)
                                .cornerRadius(20)
                                .foregroundColor(.red)
                            Text("No completado: \(Int(porcentaje[1].0))").font(.title2).fontWeight(.bold).foregroundColor(.white)
                            Spacer()
                        }.padding(.top, 10.0)
                        
                        
                    }
        
            }
                
            
            
        }.background(Color("ColorDash")).onAppear() {
            
            if let repartidor = repartidor {
                
                getData(token: repartidor.accessToken)
                
            }
            
            
        }
    }
    
    func getData(token: String) {
        
        var request = URLRequest(url: URL(string: "https://equipo02.tc2007b.tec.mx:10206/get-completion-rate")!, timeoutInterval: Double.infinity)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        let group = DispatchGroup()
        group.enter()
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                do {
                    let completionRate = try JSONDecoder().decode(CompletionRateChart.self, from: data)
                    let greenPercentage = completionRate.porcentaje
                    let redPercentage = 100 - greenPercentage
                    
                    porcentaje = [(Double(greenPercentage), .green), (Double(redPercentage), .red)]
                    
                    showChart = true
                } catch {
                    print(error)
                }
            }
            
            group.leave()
        }
        
        task.resume()
        group.wait()
    }
}

struct ChartCompletionRate_Previews: PreviewProvider {
    static var previews: some View {
        ChartCompletionRate(isComplete: true)
    }
}

