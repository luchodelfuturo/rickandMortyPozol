//
//  HomeMenuController.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 18/09/2023.
//

import UIKit
import Combine

protocol HomeMenuViewControllerCoordinator: AnyObject {
    func didSelectMenuCell(model: MenuItem)
}

class HomeMenuController: UICollectionViewController {
    private let viewModel: HomeMenuViewModel
    private var cancellable = Set<AnyCancellable>()
    private weak var coordinator: HomeMenuViewControllerCoordinator?
    init(
         viewModel: HomeMenuViewModel,
         layout: UICollectionViewFlowLayout,
         coordinator: HomeMenuViewControllerCoordinator){
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(collectionViewLayout:  layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configCollectionView()
        stateController()
        viewModel.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    ///  Controlador  del estado, usando Combine
    private func stateController(){
        viewModel
            .state
            .receive(on: RunLoop.main) // Esto nos permite recibir el estado del controlador del viewmodel, en el hilo principal.
            .sink { [weak self ] state in
                self?.hideSpinner()
                switch state {
                case .success:
                    self?.collectionView.reloadData() //Cuando el viewModel termine d cargar, recargara la data
                case .loading:
                    self?.showSpinner()
                case .fail(error: let error):
                    self?.presentAlert(message: error, title: "Error")
                }
            }.store(in: &cancellable)
    }
    
    private func configUI(){
        view.backgroundColor = .systemBackground
    }
    
    private func configCollectionView() {
        collectionView.register(ItemHomeMenuCell.self, forCellWithReuseIdentifier: ItemHomeMenuCell.reuseIdentifier)
    }
    
    
}

extension HomeMenuController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemHomeMenuCell.reuseIdentifier, for: indexPath) as? ItemHomeMenuCell
        else { return UICollectionViewCell()}
        
        let viewModelCell = viewModel.getItemMenuViewModel(indexPath: indexPath)
        cell.configData(viewModel: viewModelCell)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.menuItemsCount
        
    }
}

extension HomeMenuController {
    
}
extension HomeMenuController{
    override func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let model = viewModel.getMenuItem(indexPath: indexPath)
        coordinator?.didSelectMenuCell(model: model)
    }
}

extension HomeMenuController: SpinnerDisplayable{}

extension HomeMenuController: MessageDisplayable {}
