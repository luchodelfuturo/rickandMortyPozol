//
//  MenuRepository.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 27/09/2023.
//

protocol MenuRepository {
    func fetchMenuData() async throws -> [MenuItem]
}
