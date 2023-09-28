//
//  HomeFactory.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 22/09/2023.
//
import UIKit

protocol HomeFactory {
    func makeModule() -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
    
    func makeModule() -> UIViewController {
        let homeMenuController = HomeMenuController(collectionViewLayout: makeLayout())
        homeMenuController.title = "Rick and Morty xD"
        return  homeMenuController
    }
    
    private func makeLayout() -> UICollectionViewLayout {
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
