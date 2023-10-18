//
//  GetTicket.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 07/09/23.
//

import Foundation


func callTickets(userID: Int,token: String) -> [Ticket] {
    
    var lista: [Ticket] = []
    
    var request = URLRequest(url: URL(string: "https://equipo02.tc2007b.tec.mx:10206/get-recolector-tickets?userId=\(userID)")!, timeoutInterval: Double.infinity)
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    request.httpMethod = "GET"

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        let jsonDecoder = JSONDecoder()

        if let data = data {
            do {
                let ticketList = try jsonDecoder.decode([Ticket].self, from: data)
                lista = ticketList
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

func getIncomeZona(userID: Int,token: String) -> [MunicipiosDonaciones] {
    
    var lista: [MunicipiosDonaciones] = []
    
    var request = URLRequest(url: URL(string: "https://equipo02.tc2007b.tec.mx:10206/get-zone-donations")!, timeoutInterval: Double.infinity)
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    request.httpMethod = "GET"

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        let jsonDecoder = JSONDecoder()

        if let data = data {
            do {
                let ticketList = try jsonDecoder.decode([MunicipiosDonaciones].self, from: data)
                lista = ticketList
            } catch {
                print(error)
            }
        }

        group.leave()
    }

    task.resume()
    group.wait()
    print(lista)
    return lista
}


func getAvarageTickets(userID: Int,token: String) -> [AverageTickets] {
    
    var lista: [AverageTickets] = []
    
    var request = URLRequest(url: URL(string: "https://equipo02.tc2007b.tec.mx:10206/get-average-tickets")!, timeoutInterval: Double.infinity)
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    request.httpMethod = "GET"

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        let jsonDecoder = JSONDecoder()

        if let data = data {
            do {
                let ticketList = try jsonDecoder.decode([AverageTickets].self, from: data)
                lista = ticketList
            } catch {
                print(error)
            }
        }

        group.leave()
    }

    task.resume()
    group.wait()
    print(lista)
    return lista
}
func getExpectedDonations(userID: Int,token: String) -> ExpectedDonations {
    
    var ExpDonations: ExpectedDonations = ExpectedDonations(donacionesEsperadas: 0)
    
    var request = URLRequest(url: URL(string: "https://equipo02.tc2007b.tec.mx:10206/get-expected-donations")!, timeoutInterval: Double.infinity)
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    request.httpMethod = "GET"

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        let jsonDecoder = JSONDecoder()

        if let data = data {
            do {
                let expDonData = try jsonDecoder.decode(ExpectedDonations.self, from: data)
                ExpDonations = expDonData
            } catch {
                print(error)
            }
        }

        group.leave()
    }

    task.resume()
    group.wait()
    return ExpDonations
}
func completeTicket(ticketID: Int, token: String, completion: @escaping (Bool) -> Void) {
    var choice = true
    
    let parameters = "{\"ticketId\": \(ticketID)}"
    if let postData = parameters.data(using: .utf8) {
        var request = URLRequest(url: URL(string: "https://equipo02.tc2007b.tec.mx:10206/marcar-completado")!)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                choice = false
            }
            
            completion(choice)
        }
        
        task.resume()
    } else {
        choice = false
        completion(choice)
    }
}
