//
//  HttpResponseStatus.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 10/10/2023.
//

import Foundation

enum HttpResponseStatus {
    static let ok = 200...299
    static let clienteError = 400...499
    static let serverError = 500...599
}
