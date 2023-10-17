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


struct DashboardManagerView: View {
    
    @State private var showChartPopUp = false
    
    var body: some View {
<<<<<<< Updated upstream
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
=======
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
                    Rectangle()
                         .frame(width: 150,height: 150)
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
               
                
            }
        }.transparentFullScreenCover(isPresented: $showChartPopUp) {
            ChartCompletionRatePopUp(isShowing: $showChartPopUp)
        }
>>>>>>> Stashed changes
    }
}

struct DashboardManagerView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardManagerView()
    }
}
