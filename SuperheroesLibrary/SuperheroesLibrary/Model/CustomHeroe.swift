//
//  CustomHeroe.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//
//  Modelo para la creación de héroes
//  Se usa @Model para indicar a SwiftData que esta clase almacenará y gestionará datos de forma persistente
//  Identifiable: para identificar cada héroe de forma única.
//  Hashable: para comparar héroes y evitar duplicados al crear uno nuevo.

import Foundation
import SwiftData

@Model
class CustomHeroe: Identifiable, Hashable {

    @Attribute(.unique) var id: UUID
    var nombre: String
    var poderes: String
    
    init(id: UUID = UUID(), nombre: String, poderes: String) {
        self.id = id
        self.nombre = nombre
        self.poderes = poderes
    }
}
