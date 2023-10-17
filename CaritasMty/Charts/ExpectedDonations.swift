//
//  GetExpectedDonations.swift
//  CaritasMty
//
//  Created by Alumno on 16/10/23.
//

import Foundation


struct ExpectedDonations: Codable{
    let donacionesEsperadas: Int

    init(donacionesEsperadas: Int) {
        self.donacionesEsperadas = donacionesEsperadas
    }
}

