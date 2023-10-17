//
//  CompletionRate.swift
//  CaritasMty
//
//  Created by Alumno on 13/10/23.
//


import Foundation
struct AverageTickets: Codable, Identifiable{
    let fecha: String
    let id: Int
    let porcentaje: Int
    let recolectado: Int
    let total: Int
    
    init(fecha:String, id: Int, porcentaje: Int, recolectado: Int, total: Int) {
        self.fecha = fecha
        self.id = id
        self.porcentaje = porcentaje
        self.recolectado = recolectado
        self.total = total
    }
}


