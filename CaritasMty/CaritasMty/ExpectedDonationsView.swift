//
//  SwiftUIView.swift
//  CaritasMty
//
//  Created by Alumno on 17/10/23.
//

import SwiftUI

struct ExpectedDonationsView: View {
        @State private var isComplete: Bool
        @State private var Ingresos: ExpectedDonations = ExpectedDonations(donacionesEsperadas: 120)
    @State private var height: CGFloat = 400.0
    @State private var width: CGFloat = 400.0
        
        init(isComplete: Bool) {
            self._isComplete = State(initialValue: isComplete)
        }
        
        var body: some View {
            
            VStack{
                
                HStack{
                    if isComplete{
                        
                        Text("Donaciones Esperadas")
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
                
                ZStack{
                    
                    Rectangle()
                        .frame(width: width,height: height)
                        .foregroundColor(Color(.black))
                        .cornerRadius(10)
                    Rectangle()
                        .frame(width: width + 20 ,height:height + 20)
                        .foregroundColor(Color("ColorAzulVerdePaleta"))
                        .cornerRadius(75)


                    Text("\(Ingresos.donacionesEsperadas)").onAppear(){
                        if let  expDonations = expDonations{
                            
                            Ingresos = expDonations
                            
                        }
                        
                        if !isComplete{
                            
                            height = 50
                            width = 150
                            
                            
                        }
                    }
                    .frame(width: width,height: height)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .font(.system(size: 40))
                    
                    
                }
                
                
                
            }.background(Color("ColorDash"))
            
        }
    


}

struct ExpectedDonationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExpectedDonationsView(isComplete: false)
    }
}
