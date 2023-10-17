//
//  RecolectorOption.swift
//  CaritasMty
//
//  Created by Alumno on 13/10/23.
//

import Foundation

struct RecolectorOption: Codable, Identifiable {
    let id: Int
    let nombre: String
    
    init(id: Int, nombre: String) {
        self.id = id
        self.nombre = nombre
    }
}
