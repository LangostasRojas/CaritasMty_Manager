//
//  Recolector.swift
//  CaritasMty
//
//  Created by Alumno on 27/09/23.
//

import Foundation

struct Recolector: Codable, Identifiable {
    var id: Int
    var nombreR: String
    var Tickets: [Ticket]
    var numTickets: Int

    enum CodingKeys: String, CodingKey {
        case id = "recolectorId"
        case nombreR = "nombre"
        case Tickets = "tickets"
        case numTickets = "numTickets"
        
    }

    init(idR: Int, nombreR: String, Tickets:[Ticket], numTickets: Int) {
        self.id = idR
        self.nombreR = nombreR
        self.Tickets = Tickets
        self.numTickets = numTickets
    }
}

