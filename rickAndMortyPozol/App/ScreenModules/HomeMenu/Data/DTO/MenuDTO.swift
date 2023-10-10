//
//  MenuDTO.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 10/10/2023.
//

import Foundation

//El DTO es lo que vamos a mapear de la API xd

struct MenuDTO: Decodable {
    let characters, locations, episodes: String
}
 // al aplicar este protocolo a nuestra propiedad lo que permite es que nuestra estructura tenga la capidad de convertir sus props en un Dictionary , ej: [Characters, Value] .
extension MenuDTO: PropertyIterator { }
