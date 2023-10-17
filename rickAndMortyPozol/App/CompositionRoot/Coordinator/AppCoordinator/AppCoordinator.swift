//
//  AppCoordinator.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 20/09/2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigation: UINavigationController
    private let appFactory: AppFactory
    private var homeCoordinator: Coordinator? //para que no se muera al aejecutarse el coordinatorHome
    init(navigation: UINavigationController, appFactory: AppFactory, window: UIWindow?){
        self.navigation = navigation
        self.appFactory = appFactory
        configWindow(window: window)
    }
    
    
    func start() {
        homeCoordinator = appFactory.makeHomeCoordinator(navigation: navigation)
        homeCoordinator?.start()
    }
    
    private func configWindow(window: UIWindow?) {
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
    
}
