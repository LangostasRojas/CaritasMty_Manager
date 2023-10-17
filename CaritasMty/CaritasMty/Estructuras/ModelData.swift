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
        Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta",estatusPago: 0)
//        Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta",estatusPago: 0,comentario: ""),
//        Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta",estatusPago: 0,comentario: ""),
    ]
    return tickets
}

func cargarDatos2() -> Array<Recolector>{
    var recolectores = [
        Recolector(idR: 1, nombreR: "Kraken", Tickets: [
            Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta",estatusPago: 0) ], numTickets: 1)]
            //Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta",estatusPago: 0,comentario: ""),
            //Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta",estatusPago: 0,comentario: "")]

//        Recolector(idR: 2, nombreR: "Jair", Tickets: [        Ticket(id: 4, nombre: "Minja", importe: 40400, direccion:"Ciudad Gotica", estatus: "En ruta",estatusPago: 0,comentario: ""),
//,
//        Recolector(idR: 3, nombreR: "Daniel", Tickets: [Ticket(id: 8, nombre: "Jose", importe: 200000.2,direccion:"Ciudad Gotica", estatus: "En ruta",comentario: "")], numTickets: 1)
    return recolectores
}
