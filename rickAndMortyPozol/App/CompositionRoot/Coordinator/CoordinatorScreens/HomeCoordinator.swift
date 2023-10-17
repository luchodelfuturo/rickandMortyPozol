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
        let controller = homeFactory.makeModule(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }

}

extension HomeCoordinator: HomeMenuViewControllerCoordinator {
    func didSelectMenuCell(model: MenuItem) {
        switch model.type {
        case .characters: goToCharacters()
        case .episodes: goToEpisodes()
        case .locations: goToLocations()
        
        }
    }
    
    private func goToCharacters(){
        print("screen Characters")
    }
    private func goToEpisodes(){
        print("screen Episodes")
    }
    private func goToLocations(){
        print("screen Locations")
    }
}
