//
//  HomeCoordinator.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 22/09/2023.
//
import UIKit

final class HomeCoordinator: Coordinator {
    var navigation: UINavigationController
    private let homeFactory: HomeFactory
    
    init(navigation: UINavigationController, homeFactory: HomeFactory) {
        self.navigation = navigation
        self.homeFactory = homeFactory
    }
    
    func start() {
        let controller = homeFactory.makeModule()
        navigation.pushViewController(controller, animated: true)
    }
    
    
}
