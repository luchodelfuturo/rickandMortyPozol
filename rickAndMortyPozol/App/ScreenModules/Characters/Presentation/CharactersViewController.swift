//
//  CharactersViewController.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 24/10/2023.
//

import Foundation
import UIKit

protocol CharactersViewControllerCoordinator {
    func didSelectMenuCell(urlDetail: String)
}

final class CharactersViewController: UITableViewController {
    
    // MARK: - Public Properties
    
    var ejemploPropiedadPublica: String?
    
    // MARK: - Private Properties
    
    private let ejemploPropiedadPrivada = "Valor Privado"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Código de configuración inicial aquí
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Código a ejecutar antes de que la vista sea visible
    }
    
    // MARK: - Helpers
    
    private func configurarElementos() {
        // Configurar elementos de la interfaz aquí
    }
    
    private func cargarDatos() {
        // Cargar datos necesarios aquí
    }
    
    // MARK: - Actions
    
    @objc private func accionBoton() {
        // Código a ejecutar cuando se presiona un botón
    }
    
}


