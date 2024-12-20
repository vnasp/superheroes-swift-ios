//
//  APIHeroeList.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 19-12-24.
//
// Modelo para los datos desde la API (listado de superhéroes)
// Identifiable: para identificar cada héroe de forma única.
// Decodable: para pasar la respuesta JSON de la API a objetos de Swift

import Foundation

struct APIHeroeList: Identifiable, Decodable {
    let id: Int
    let nombre: String
    let primeraAparicion: String
    let imagen: String
}
