//
//  Coordinator.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 20/09/2023.
//
import UIKit

protocol Coordinator {
    var navigation: UINavigationController { get }
    func start()
}
