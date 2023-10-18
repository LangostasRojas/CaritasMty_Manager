//
//  LoginView.swift
//  CaritasMty
//
//  Created by Alumno on 04/09/23.
//

import SwiftUI



struct Login: View {

    @State var username: String = ""
    @State var password: String = ""

    @State var boolalerta: Bool = false
    
    @State var lista: Array<Recolector> = []
    @State var shouldNav: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    Image("Image")
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    Image("logo")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom,400)
                    
                    VStack{
                        
                        Spacer().frame(height: 350)
                        
                        TextField("", text: $username, prompt: Text("Ingresa tu usuario").foregroundColor(.white))
                            .padding()
                            .frame(width: 350, height: 55)
                            .background(.clear)
                            .tint(.white)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("ColorAzulVerdePaleta"), lineWidth: 3))
                            .autocorrectionDisabled(true).autocapitalization(.none)
                        
                        
                        Spacer().frame(height: 50)
                        
                      
                        
                        SecureField("Ingresa tu password", text: $password, prompt: Text("Ingresa tu contraseña").foregroundColor(.white))
                            .padding()
                            .frame(width: 350, height: 55)
                            .background(.clear)
                            .tint(.white)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("ColorAzulVerdePaleta"), lineWidth: 3))
                            .autocorrectionDisabled(true)
                        

                        
                        if boolalerta{
                            ZStack{
                                Rectangle()
                                    .foregroundColor(Color("ColorError"))
                                    .frame(width: 350,height: 40)
                                    .cornerRadius(20)
                                Text("Usuario o contraseña incorrecto").foregroundColor(.white).font(.system(size: 20)).bold().multilineTextAlignment(.center)
                                    
                            }
                        }
                       
                           
                        
                        
                        BotonUni(textoboton: "Iniciar Sesión",colorboton: "ColorAzulVerdePaleta",widthboton: 280, heightboton: 60){

                            login(usernamelog: "\(username)", passwordlog: "\(password)") {
                             (user, error) in
                             if let user = user {
                                 
                    
                                 repartidor = user
                                 if user.role != "manager" {
                                     boolalerta = true
                                     shouldNav = false
                                 } else{
                                     listaTicketsR = callTickets(userID: user.userId, token: user.accessToken)
                                     
                                     listaTicketsManagers2 = callRecolectores(userID: user.userId, token: user.accessToken)
                                     
                                     IngresosPorMunicpio = getIncomeZona(userID: user.userId, token: user.accessToken)
                                     AvarageTickets = getAvarageTickets(userID: user.userId, token: user.accessToken)
                                     expDonations = getExpectedDonations(userID: user.userId, token: user.accessToken)
                                     
                                     CollectedTickets = callCollected(token: user.accessToken)
                                    print(CollectedTickets)
                                     
                                     if let unwrappedListaTicketsR = listaTicketsR {
                                         print("Se cargo la listaTicketsR")
                                     } else {
                                         print("listaTicketsR is nil")
                                     }
                                     if let unwrappedExpectedDonations = expDonations {
                                         print("Se cargo la listaTicketsR")
                                     } else {
                                         print("listaTicketsR is nil")
                                     }
                                     if let unwrappedListaTicketsAverage = AvarageTickets {
                                         print("Se cargo la listaTicketsR")
                                     } else {
                                         print("listaTicketsR is nil")
                                     }
                                     if let unwrappedListaTicketsCollected = CollectedTickets {
                                         print("Se cargo la CollectedTickets")
                                         print(unwrappedListaTicketsCollected)
                                     } else {
                                         print("CollectedTickets is nil")
                                     }
                                     
                                     if let unwrappedListaTicketsManagers2 = listaTicketsManagers2 {
                                         print("Se cargo la unrwappedListaTicket")
                                     } else {
                                         print("unwrappedListaTicketsManagers2 is nil")
                                     }
                                     if let unwrappedListaIncomezONA = IngresosPorMunicpio {
                                         print("Se cargo la Municipios")
                                         print("\(unwrappedListaIncomezONA)")
                                     } else {
                                         print("Se cargo la lista muni")
                                     }
                                     
                                     
                                     shouldNav = true
                                 }
                                 
                             } else if let error = error {

                                 boolalerta = true
                                 shouldNav = false
                             }
                             }
                        }.background(
                            NavigationLink(destination:
                                            HomeView().navigationBarBackButtonHidden(true), isActive: $shouldNav){
                                
                            }).padding(80)
                        
//                        NavigationLink(destination: TicketA().navigationBarBackButtonHidden(true)){
//                            Text("Inicia Sesión")
//                                .font(.title)
//                                .bold()
//                                .foregroundColor(.white)
//
//                                .frame(width: 280.0, height: 60.0)
//                                .background(Color("ColorAzulVerdePaleta"))
//                                .cornerRadius(30)
//                                .shadow(color:.black,radius: 2,y:2)
//                                .padding(80.0)
//
//                        }
                        
                        /*
                         Button(action: {
                         // 1. Van a llamr su funcion de ModelData que regrese usua y pass
                         //Con lo datos que REGRESA esa funcion van a hacer el if -else
                         // De ahi van a redireccionar
                         
                         /*login(usernamelog: "\(username)", passwordlog: "\(password)") {
                          (user, error) in
                          if let user = user {
                          TicketA()
                          print("Logged in user: \(user.userName)")
                          } else if let error = error {
                          TicketA()
                          print("Error logging in: \(error.localizedDescription)")
                          }
                          }*/
                         }, label: {
                         Text("Iniciar Sesión")
                         .font(.title)
                         .bold()
                         .foregroundColor(.white)
                         
                         .frame(width: 280.0, height: 60.0)
                         .background(Color("ColorAzulVerdePaleta"))
                         .cornerRadius(30)
                         .shadow(color:.black,radius: 2,y:2)
                         })
                         .padding(80) */
                    }
                }
            }
            
        }
    }
}
                        
                        
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
