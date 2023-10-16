//
//  CompletionRate.swift
//  CaritasMty
//
//  Created by Alumno on 13/10/23.
//


import Foundation
struct CompletionRate: Codable, Identifiable{
    let id: Int
    let porcentaje: Int
    let recolectado: Int
    let total: Int
    
    init(porcentaje: Int, recolectado: Int, total: Int) {
        self.id = 1
        self.porcentaje = porcentaje
        self.recolectado = recolectado
        self.total = total
    }
}


