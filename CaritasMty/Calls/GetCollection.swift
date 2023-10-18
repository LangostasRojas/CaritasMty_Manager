
import Foundation

func callCollected(token: String) -> [CollectedDonaciones] {
    
    var lista: [CollectedDonaciones] = []
    
    var request = URLRequest(url: URL(string: "https://equipo02.tc2007b.tec.mx:10206/get-collected-tickets-month")!, timeoutInterval: Double.infinity)
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    request.httpMethod = "GET"

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        let jsonDecoder = JSONDecoder()

        if let data = data {
            do {
                let ticketList = try jsonDecoder.decode([CollectedDonaciones].self, from: data)
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