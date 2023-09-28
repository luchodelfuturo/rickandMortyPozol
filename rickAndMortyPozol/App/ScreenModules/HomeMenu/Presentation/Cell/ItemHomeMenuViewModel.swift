//
//  ItemHomeMenuViewModel.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 28/09/2023.

struct ItemHomeMenuViewModel {
    private let menuItem: MenuItem
    
    init(menuItem: MenuItem) {
        self.menuItem = menuItem
    }
    
    var title: String {
        menuItem.title.capitalized
    }
    
    var imageName: String {
        menuItem.title
    }
}
