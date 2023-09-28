//
//  GetRecolectores.swift
//  CaritasMty
//
//  Created by Alumno on 27/09/23.
//

import Foundation

func callRecolectores(userID: Int, token: String) -> [Recolector] {
    
    var lista: [Recolector] = []
    
    var request = URLRequest(url: URL(string: "http://10.22.216.78:10204/get-manager-collectors")!, timeoutInterval: Double.infinity)
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    request.httpMethod = "GET"

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        let jsonDecoder = JSONDecoder()

        if let data = data {
            do {
                let ticketList = try jsonDecoder.decode([Recolector].self, from: data)
                print(ticketList)
                lista = ticketList
                print(lista)
            } catch {
                print(error)
            }
        }

        group.leave()
    }

    task.resume()
    group.wait()

    return lista
}
