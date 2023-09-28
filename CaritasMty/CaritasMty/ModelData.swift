//
//  ModelData.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 06/09/23.
//

import Foundation

var listaTickets = cargarDatos()

func cargarDatos() -> Array<Ticket>{
    var tickets = [
        Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta"),
        Ticket(id: 5, nombre: "Juancho", importe: 100, direccion:"Ciudad Gotica", estatus: "En ruta"),
        Ticket(id: 8, nombre: "Jose", importe: 200000.2,direccion:"Ciudad Gotica", estatus: "En ruta")
    ]
    return tickets
}

func cargarDatosManager() -> Array<Array<Ticket>>{
    var ticktsManager = [
    [
        Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta"),
        Ticket(id: 5, nombre: "Juancho", importe: 100, direccion:"Ciudad Gotica", estatus: "En ruta"),
        Ticket(id: 8, nombre: "Jose", importe: 200000.2,direccion:"Ciudad Gotica", estatus: "En ruta")
    ],
    [
        Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta"),
        Ticket(id: 5, nombre: "Juancho", importe: 100, direccion:"Ciudad Gotica", estatus: "En ruta"),
        Ticket(id: 8, nombre: "Jose", importe: 200000.2,direccion:"Ciudad Gotica", estatus: "En ruta")
    ],
    [
        Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta"),
        Ticket(id: 5, nombre: "Juancho", importe: 100, direccion:"Ciudad Gotica", estatus: "En ruta"),
        Ticket(id: 8, nombre: "Jose", importe: 200000.2,direccion:"Ciudad Gotica", estatus: "En ruta")
    ]
    ]
    return ticktsManager
}

func cargarDatos2() -> Array<Recolector>{
    var recolectores = [
        Recolector(idR: 1, nombreR: "Kraken", Tickets: [Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta"),Ticket(id: 5, nombre: "Juancho", importe: 100, direccion:"Ciudad Gotica", estatus: "En ruta"),
                                                        Ticket(id: 8, nombre: "Jose", importe: 200000.2,direccion:"Ciudad Gotica", estatus: "En ruta")], numTickets: 3),
        Recolector(idR: 2, nombreR: "Jair", Tickets: [Ticket(id: 5, nombre: "Juancho", importe: 100, direccion:"Ciudad Gotica", estatus: "En ruta")], numTickets: 1),
        Recolector(idR: 3, nombreR: "Daniel", Tickets: [Ticket(id: 8, nombre: "Jose", importe: 200000.2,direccion:"Ciudad Gotica", estatus: "En ruta")], numTickets: 1)
    ]
    return recolectores
}
