//
//  MunicipioDonaciones.swift
//  CaritasMty
//
//  Created by Alumno on 12/10/23.
//

import Foundation
struct MunicipiosDonaciones: Codable, Identifiable{
    let id: Int
    let ingresos: Float
    let municipio: String
    
    
    init(id: Int, ingresos: Float,municipio: String) {
        self.id = id
        self.ingresos = ingresos
        self.municipio = municipio
    }
}

