//  DashboardManagerView.swift
//  CaritasMty
//
//  Created by Alumno on 11/10/23.


import SwiftUI

extension View {
    func transparentFullScreenCover<Content: View>(isPresented: Binding<Bool>, content: @escaping () -> Content) -> some View {
        modifier(TransparentFullScreenModifier(isPresented: isPresented, fullScreenContent: content))
    }
}

private struct TransparentFullScreenModifier<FullScreenContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    let fullScreenContent: () -> (FullScreenContent)

    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                ZStack {
                    fullScreenContent()
                }
                .background(FullScreenCoverBackgroundRemovalView())
            }
    }
}

private struct FullScreenCoverBackgroundRemovalView: UIViewRepresentable {
    private class BackgroundRemovalView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            superview?.superview?.backgroundColor = .clear
        }
    }

    func makeUIView(context: Context) -> UIView {
        return BackgroundRemovalView()
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}


struct ChartCompletionRatePopUp: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all)

            VStack {
                ChartCompletionRate(isComplete: true)
                Button("Cerrar") {
                    isShowing.toggle()
                }
                .padding()
                .foregroundColor(.white).font(.body).bold().frame(width: 100.0, height: 40.0)
                .background(Color("ColorAzulVerdePaleta"))
                .cornerRadius(30)
                .shadow(color:.black,radius: 2,y:2)
            }
            .background(Color("ColorDash"))
            .cornerRadius(10)
            .padding()
            
        }
        .opacity(isShowing ? 1 : 0)
    }
}

struct ChartMPopUp: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all)

            VStack {
                ChartPorMunicipio(isComplete: true)
                Button("Cerrar") {
                    isShowing.toggle()
                }
                .padding()
                .foregroundColor(.white).font(.body).bold().frame(width: 100.0, height: 40.0)
                .background(Color("ColorAzulVerdePaleta"))
                .cornerRadius(30)
                .shadow(color:.black,radius: 2,y:2)
            }
            .background(Color("ColorDash"))
            .cornerRadius(10)
            .padding()
            
        }
        .opacity(isShowing ? 1 : 0)
    }
}

struct ChartAveragePopUp: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all)

            VStack {
                AvarageTicketsChart(isComplete: true)
                Button("Cerrar") {
                    isShowing.toggle()
                }
                .padding()
                .foregroundColor(.white).font(.body).bold().frame(width: 100.0, height: 40.0)
                .background(Color("ColorAzulVerdePaleta"))
                .cornerRadius(30)
                .shadow(color:.black,radius: 2,y:2)
            }
            .background(Color("ColorDash"))
            .cornerRadius(10)
            .padding()
            
        }
        .opacity(isShowing ? 1 : 0)
    }
}
struct ChartExpectedPopup: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all)

            VStack {
                ExpectedDonationsView(isComplete: true)
                Button("Cerrar") {
                    isShowing.toggle()
                }
                .padding()
                .foregroundColor(.white).font(.body).bold().frame(width: 100.0, height: 40.0)
                .background(Color("ColorAzulVerdePaleta"))
                .cornerRadius(30)
                .shadow(color:.black,radius: 2,y:2)
            }
            .background(Color("ColorDash"))
            .cornerRadius(10)
            .padding()
            
        }
        .opacity(isShowing ? 1 : 0)
    }
}

struct ChartCollectedPopUp: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            Color.clear.edgesIgnoringSafeArea(.all)

            VStack {
                CollectedTicketsChart(isComplete: true)
                Button("Cerrar") {
                    isShowing.toggle()
                }
                .padding()
                .foregroundColor(.white).font(.body).bold().frame(width: 100.0, height: 40.0)
                .background(Color("ColorAzulVerdePaleta"))
                .cornerRadius(30)
                .shadow(color:.black,radius: 2,y:2)
            }
            .background(Color("ColorDash"))
            .cornerRadius(10)
            .padding()
            
        }
        .opacity(isShowing ? 1 : 0)
    }
}

struct DashboardManagerView: View {
    
    @State private var showChartPopUp = false
    @State private var showChartMPopUp = false
    @State private var showChartCollectedPopUp = false
    @State private var showChartAveragePopUp = false
    @State private var showChartExpectedPopUp = false

    @State private var grafica: Int = 0
    var donations: ExpectedDonations = ExpectedDonations(donacionesEsperadas: 120)
    
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
                    Button(action: {
                        showChartPopUp.toggle()
                    }) {
                        
                     
                        ChartCompletionRate(isComplete: false)
                            .frame(width: 200, height: 150)
                            .padding(.trailing, 10)
                    }
                   
                    Button(action: {
                        
                        showChartMPopUp.toggle()
                    }) {
                        
            
                        ChartPorMunicipio(isComplete: false)
                            .frame(width: 200, height: 150)
                            .padding(.trailing, 10)
                    }
                }
                .padding(.bottom,5 )
                
                HStack{
                    
                    Button(action: {
                        
                        showChartAveragePopUp.toggle()
                    }) {
                        
            
                        AvarageTicketsChart(isComplete: false)
                            .frame(width: 200, height: 150)
                            .padding(.trailing, 10)
                    }
                    
                    Button(action: {
                        
                        showChartCollectedPopUp.toggle()
                    }) {
                        
            
                        CollectedTicketsChart(isComplete: false)
                            .frame(width: 200, height: 150)
                            .padding(.trailing, 10)
                    }
                    
                }
                
                Text("Tickets Promedio Por mes")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                Button(action: {
                    
                    showChartExpectedPopUp.toggle()
                }) {
                    
        
                    ExpectedDonationsView(isComplete: false)
                        .frame(width: 300, height: 50)
                        .padding(.trailing, 10)
                }
                
               
                
            }
        }.transparentFullScreenCover(isPresented: $showChartPopUp) {

                ChartCompletionRatePopUp(isShowing: $showChartPopUp)

        }.transparentFullScreenCover(isPresented: $showChartMPopUp) {
            
            ChartMPopUp(isShowing: $showChartMPopUp)

    }.transparentFullScreenCover(isPresented: $showChartAveragePopUp) {
        
        ChartAveragePopUp(isShowing: $showChartAveragePopUp)

}.transparentFullScreenCover(isPresented: $showChartCollectedPopUp) {
    
    ChartCollectedPopUp(isShowing: $showChartCollectedPopUp)

}.transparentFullScreenCover(isPresented: $showChartExpectedPopUp) {
    
    ChartExpectedPopup(isShowing: $showChartExpectedPopUp)

}

    }
}

struct DashboardManagerView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardManagerView()
    }
}
