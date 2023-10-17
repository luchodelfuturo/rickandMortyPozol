//
//  HomeFactory.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 22/09/2023.
//
import UIKit
import Combine
protocol HomeFactory {
    func makeModule(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
    
    func makeModule(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController {
        let apiClientService = ApiClientServiceImp()
        let menuRepository = MenuRepositoryImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
        let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
        let state = PassthroughSubject<StateController, Never>()
        let homeMenuViewModel = HomeViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
        let homeMenuController = HomeMenuController(viewModel: homeMenuViewModel, layout: makeLayout(),coordinator: coordinator)
        homeMenuController.title = "Rick and Morty xD"
        return  homeMenuController
    }
    
    private func makeLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let layoutWidth = (UIScreen.main.bounds.width - 20 ) / 2
        let layoutHeight = (UIScreen.main.bounds.width - 20) / 2
        layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
        return layout
    }
    
}
