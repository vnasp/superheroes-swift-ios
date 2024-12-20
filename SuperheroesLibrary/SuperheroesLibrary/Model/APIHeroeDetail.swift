//
//  APIHeroeDetail.swift
//  SuperheroesLibrary
//
//  Created by Valentina Muñoz on 20-12-24.
//
//  Modelo para los datos desde la API (detalle del superhéroe)
//  Decodable: para pasar la respuesta JSON de la API a objetos de Swift
//  [String]: define que será un array de textos

import Foundation

struct APIHeroeDetail: Decodable {
    let id: Int
    let nombre: String
    let nombreReal: String
    let alias: [String]
    let poderes: [String]
    let primeraAparicion: String
    let historia: String
    let afiliaciones: [String]
    let imagen: String
}
