//
//  MenuDTO+Mappear.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 10/10/2023.
//

import Foundation

extension MenuDTO {
    func toDomain() -> [MenuItem]{
        return self.dictionaryProperties().map{ dictionary in
            let title = dictionary.key
            let url: String = (dictionary.value as? String) ?? String()
            return MenuItem(title: title, url: url)
        }
    }
}
