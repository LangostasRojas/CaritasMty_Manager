

import Foundation

struct Recibo: Codable, Identifiable {
    var id: Int
    var donante: Int
    var cantidad: Float
    var cobrado: Bool
    var observaciones: String

    enum CodingKeys: String, CodingKey {
        case id = "idRecibo"
        case donante = "idDonante"
        case cantidad = "importe"
        case cobrado = "estatusPago"
        case observaciones = "comentario"
    }

    init(id: Int, donante: Int, cantidad: Float, cobrado: Bool, observaciones: String) {
        self.id = id
        self.donante = donante
        self.cantidad = cantidad
        self.cobrado = cobrado
        self.observaciones = observaciones
    }
}

