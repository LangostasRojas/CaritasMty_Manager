//
//  Ticket.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import Foundation


struct Ticket: Codable, Identifiable {
    var id: Int
    var nombre: String
    var importe: Float
    var direccion: String
    var estatus: String

    enum CodingKeys: String, CodingKey {
        case id = "idTicket"
        case nombre = "nombre"
        case importe = "importe"
        case direccion = "direccion"
        case estatus = "estatus"
    }

    init(id: Int, nombre: String, importe: Float, direccion: String, estatus: String) {
        self.id = id
        self.nombre = nombre
        self.importe = importe
        self.direccion = direccion
        self.estatus = estatus
    }
}

