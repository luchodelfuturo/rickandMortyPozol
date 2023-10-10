//
//  ApiClientService.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 10/10/2023.
//

import Foundation

protocol ApiClientService {
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T
}
// Declaramos el protocolo, como vamos a decodificar algo generico , usamos T, puede ser un modelo de locations, characters bla...
// Le pasamos la URL y el tipo que queremos decodificar y al final nos retorna un Modelo
