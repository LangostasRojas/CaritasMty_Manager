//
//  MunicipioDonaciones.swift
//  CaritasMty
//
//  Created by Alumno on 12/10/23.
//

import Foundation
struct MunicipiosDonaciones: Codable, Identifiable{
    let fecha: String
    let id: Int
    let porcentaje: Int
    let total: Int
    
    
    init(fecha: String, id: Int, porcentaje: Int, total: Int) {
        self.fecha = fecha
        self.id = id
        self.porcentaje = porcentaje
        self.total = total
    }
}

