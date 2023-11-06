//
//  CharactersFactory.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 20/10/2023.
//

import Foundation
import UIKit

protocol CharactersFactory {
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController
}

struct CharactersFactoryImp: CharactersFactory{
    func makeModule(coordinator: CharactersViewControllerCoordinator) -> UIViewController {
        let chController = CharactersViewController()
       chController.title = "Characters"
        return chController
    }
    
    
}
