//
//  Change Collector.swift
//  CaritasMty
//
//  Created by Alumno on 13/10/23.
//

import Foundation

func changeCollector(ticketID: Int, collectorId: Int, token: String, completion: @escaping (Bool, Error?) -> Void) {
    var choice = true
    
    let parameters = "{\"ticketId\": \(ticketID), \"collectorId\": \(collectorId)}"
    if let postData = parameters.data(using: .utf8) {
        var request = URLRequest(url: URL(string: "http://10.14.255.66:10206/change-ticket-collector")!)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PUT"
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request){
            data, response, error in
            if let error = error{
                DispatchQueue.main.async {
                    completion(false, error)
                }
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(false, NSError(domain: "Invalid Response", code: 500))
                }
                return
            }
            if httpResponse.statusCode == 200 {
                do {
                    DispatchQueue.main.async {
                        completion(true, nil)
                    }
                }
                catch {
                    DispatchQueue.main.async {
                        completion(false, error)
                    }
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(false, NSError(domain: "Server Error", code: httpResponse.statusCode))
                }
            }
        }.resume()
        return
    }
}
