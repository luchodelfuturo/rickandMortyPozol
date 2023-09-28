//
//  AppFactory.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 20/09/2023.

import UIKit

protocol AppFactory {
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator
}

struct AppFactoryImp: AppFactory{
    func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator {
        let homeFactory = HomeFactoryImp()
        let homeCoordinator = HomeCoordinator(navigation: navigation, homeFactory: homeFactory)
        return homeCoordinator
    }
    
    
}
