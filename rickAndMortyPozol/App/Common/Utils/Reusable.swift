//
//  Reusable.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 27/09/2023.
//
protocol Reusable {}

extension Reusable {
    static var reuseIdentifier: String { String(describing: self)}
}
