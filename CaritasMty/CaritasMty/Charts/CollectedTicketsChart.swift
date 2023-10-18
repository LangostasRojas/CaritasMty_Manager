import SwiftUI
import Charts



struct CollectedTicketsChart: View {
    
    @State private var listaCollected: [CollectedDonaciones] = []
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
                    
                    Text("Tickets Promedio por mes")
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
            
            if listaCollected.count == 0{
                
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.white)).scaleEffect(1.5, anchor: .center)
                
            }else{
                
                Chart(listaCollected){
                        
                    
                    
                    PointMark(
                        x: .value("Recolectado", $0.recolectado),
                        y: .value("Total", $0.total)
                    ).foregroundStyle(by: .value("Mes", $0.mes))
                    
                    
                    
                    
                }
                
                .frame(width: width, height: height)
                    .foregroundColor(Color("ColorDash"))
                    .background(Color(.white))
                    
              

            }

        }.background(Color("ColorDash")).onAppear(){
            
            if let CollectedTickets = CollectedTickets{
                
                listaCollected = CollectedTickets
                
            }
            
            if !isComplete{
                
                height = 150
                width = 150
                
                
            }
            
            
        }
    }
}

struct CollectedTicketsChart_Previews: PreviewProvider {
    static var previews: some View {
        CollectedTicketsChart(isComplete: true)
    }
}
