//
//  GetRecolectorOption.swift
//  CaritasMty
//
//  Created by Alumno on 13/10/23.
//

import Foundation

func getRecolectorOptions(token: String) -> [RecolectorOption] {
    var list: [RecolectorOption] = []
    
    var request = URLRequest(url: URL(string: "https://equipo02.tc2007b.tec.mx:10206/get-list-collectors")!, timeoutInterval: Double.infinity)

    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        let jsonDecoder = JSONDecoder()

        if let data = data {
            do {
                let collectorlist = try jsonDecoder.decode([RecolectorOption].self, from: data)
                list = collectorlist
            } catch {
                print(error)
            }
        }

        group.leave()
    }

    task.resume()
    group.wait()
    
    print(list)
    return list
}
