//
//  PropertyIterator.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 10/10/2023.
//

import Foundation

protocol PropertyIterator { }

extension PropertyIterator {
    func dictionaryProperties() -> [String: Any]{
        let mirror = Mirror(reflecting: self)
        var dictionary: [String: Any] = [:]
        
        mirror.children.forEach { property in
            dictionary[property.label ?? String()] = property.value
        }
        
        return dictionary
    }
}
