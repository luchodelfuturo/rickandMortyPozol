//
//  MenuRepositoryImp.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 27/09/2023.
//

struct MenuRepositoryImp: MenuRepository {
    func fetchMenuData() async throws -> [MenuItem] {
        [MenuItem(title: "locations", url: "XD")]
    }
}
