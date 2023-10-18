//
//  EstructurasKPI.swift
//  CaritasMty
//
//  Created by Alumno on 17/10/23.
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

struct CollectedDonaciones: Codable, Identifiable{
    let id: Int
    let mes: String
    let recolectado: Int
    let total: Int
    
    init(id: Int, mes: String,recolectado: Int,total: Int) {
        self.id = id
        self.mes = mes
        self.recolectado = recolectado
        self.total = total
    }
}

struct AverageTickets: Codable, Identifiable{
    let fecha: String
    let id: Int
    let porcentaje: Int
    let recolectado: Int
    let total: Int
    
    
    init(fecha: String, id: Int,  porcentaje: Int, recolectado:Int,total: Int) {
        self.fecha = fecha
        self.id = id
        self.porcentaje = porcentaje
        self.recolectado = recolectado
        self.total = total
    }
}



struct ExpectedDonations: Codable{
    let donacionesEsperadas: Int

    init(donacionesEsperadas: Int) {
        self.donacionesEsperadas = donacionesEsperadas
    }
}
