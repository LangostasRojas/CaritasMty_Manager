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
                        .frame(width: 175,height: 150)
                        .cornerRadius(20)
                        .foregroundColor(Color("ColorDash"))
                    Rectangle()
                         .frame(width: 175,height: 150)
                         .cornerRadius(20)
                         .foregroundColor(Color("ColorDash"))
                }
                .padding(.bottom,5 )
                HStack{
                   Rectangle()
                        .frame(width: 175,height: 150)
                        .cornerRadius(20)
                        .foregroundColor(Color("ColorDash"))
                    Rectangle()
                         .frame(width: 175,height: 150)
                         .cornerRadius(20)
                         .foregroundColor(Color("ColorDash"))
                }
                Rectangle()
                    .frame(width: 350, height: 250)
                    .cornerRadius(30)
                    .padding(.top,20)
                    .foregroundColor(Color("ColorDash"))
                
            }
        }
    }
}

struct DashboardManagerView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardManagerView()
    }
}
