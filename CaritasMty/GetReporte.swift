//
//  GetReporte.swift
//  CaritasMty
//
//  Created by Alumno on 12/10/23.
//

import Foundation

func getReporte(token: String) -> [Recibo] {
    
    var lista: [Recibo] = []
    
    var request = URLRequest(url: URL(string: "http://10.14.255.66:10206/get-report-information")!, timeoutInterval: Double.infinity)
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    request.httpMethod = "GET"

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        let jsonDecoder = JSONDecoder()

        if let data = data {
            do {
                let reporteList = try jsonDecoder.decode([Recibo].self, from: data)
                lista = reporteList
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
