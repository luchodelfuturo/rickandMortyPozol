//
//  MenuItem.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 27/09/2023.
//

struct MenuItem {
    
    let title: String
    let url: String
    let type: MenuItemType
}
enum MenuItemType: String {
    case characters = "characters"
    case episodes = "episodes"
    case locations = "locations"
    
    init?(fromString string: String) {
        if let itemType = MenuItemType(rawValue: string) {
            self = itemType
        } else {
            return nil
        }
    }
}
