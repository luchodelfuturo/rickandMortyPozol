//
//  HomeMenuViewModel.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 28/09/2023.
//
import Combine
import Foundation

protocol HomeMenuViewModel {
    var state: PassthroughSubject<StateController, Never> { get }
    var menuItemsCount: Int { get }
    func viewDidLoad()
    func getItemMenuViewModel(indexPath: IndexPath) -> ItemHomeMenuViewModel
    func getMenuItem(indexPath: IndexPath) -> MenuItem
}

final class HomeViewModelImp: HomeMenuViewModel {
    var state: PassthroughSubject<StateController, Never>
    
    var menuItemsCount: Int {
        menuItems.count
    }
    
    private let loadMenuUseCase: LoadMenuUseCase
    private var menuItems: [MenuItem] = []
    
    init(state: PassthroughSubject<StateController, Never>, loadMenuUseCase: LoadMenuUseCase) {
        self.state = state
        self.loadMenuUseCase = loadMenuUseCase
    }
    
    func viewDidLoad() {
        state.send(.loading)
        Task {
            let result = await loadMenuUseCase.execute()
           updateUI(result: result) //Quito el await ya que usamos en el controlador un .recieve(on:RunLoop.main)
        }
    }
    
    private func updateUI(result: Result<[MenuItem],Error>){ //Al estar trabajando con concurrencia moderna, usamos @MainActor, pero... usamos un .recieve en el controller y eso hace que no necesitemos esto.
        switch result {
        case .success(let menuItems):
            self.menuItems = menuItems
            state.send(.success)
        case .failure(let error):
            state.send(.fail(error: error.localizedDescription))
        }
        
    }
    
    func getItemMenuViewModel(indexPath: IndexPath) -> ItemHomeMenuViewModel {
        let menuItem = menuItems[indexPath.row]
        return ItemHomeMenuViewModel(menuItem: menuItem)
    }
    
    func getMenuItem(indexPath: IndexPath) -> MenuItem {
        menuItems[indexPath.row]
    }
    
     
}

