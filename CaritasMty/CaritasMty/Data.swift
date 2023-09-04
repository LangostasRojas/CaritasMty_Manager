//
//  ModelData.swift
//  ApiApp
//
//  Created by Alumno on 01/09/23.
//

import Foundation

//var request = URLRequest(url: url)
//request.httpMethod = "POST"
//request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//let parameters: [String: Any] = ["key1": "value1", "key2": "value2"] // replace with your parameters
//
//do {
//    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//} catch let error {
//    print(error.localizedDescription)
//}

func login(username: String, password: String){
    
    
    guard let url = URL(string:"http://10.22.211.207:10201/sign-in") else{
        return
    }
    
    let body: [String: Any] = [
        "username": "\(username)",
        "password": "\(password)"
    ]
    
    let jsonData = try? JSONSerialization.data(withJSONObject: body)
    
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.httpBody = jsonData
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    
    
    URLSession.shared.dataTask(with: request){
        data, _, error in
        if let error = error{
            print("Error: \(error)")
        } else if let data = data {
            if let responseString = String(data: data, encoding: .utf8){
                DispatchQueue.main.async {
                }
            }
            
        }
    }.resume()
        
    return
}



