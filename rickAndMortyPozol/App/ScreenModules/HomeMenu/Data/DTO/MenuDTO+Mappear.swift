//
//  MenuDTO+Mappear.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 10/10/2023.
//

import Foundation

extension MenuDTO {
    func toDomain() -> [MenuItem] {
        return self.dictionaryProperties().compactMap { dictionary in
            let title = dictionary.key
            let url: String = (dictionary.value as? String) ?? ""
            
            guard let type = MenuItemType(fromString: title) else { return nil }
            
            return MenuItem(title: title, url: url, type: type)
        }
    }
}
