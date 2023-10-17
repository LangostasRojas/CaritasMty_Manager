//
//  DashboardManagerView.swift
//  CaritasMty
//
//  Created by Alumno on 11/10/23.
//

import SwiftUI

struct DashboardManagerView: View {
    var body: some View {
        ZStack {
            Color("BgColor")
                        .ignoresSafeArea()
                    
            VStack{
                HStack{
                    Text("Dashboard")
                        .foregroundColor(.white)
                        .font(.system(size: 34))
                        .fontWeight(.bold)
                        .padding(.leading, 40.0)
                    Spacer()
                }
               
                    
                Rectangle()
                    .fill(Color("ColorAzulVerdePaleta"))
                    .frame(width: 170,height: 7)
                    .cornerRadius(20)
                    .offset(x:-64,y:-25)
                HStack{
                   Rectangle()
                        .frame(width: 200,height: 150)
                        .cornerRadius(20)
                        .foregroundColor(.yellow)
                        .padding(.trailing,10)
                    Rectangle()
                         .frame(width: 150,height: 150)
                         .cornerRadius(20)
                         .foregroundColor(Color("ColorDash"))
                }
                .padding(.bottom,5 )
                HStack{
                    AvarageTicketsChart()
                }
                
            }
        }
    }
}

struct DashboardManagerView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardManagerView()
    }
}
