//
//  MenuRepositoryImp.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 27/09/2023.
//

import Foundation

struct MenuRepositoryImp: MenuRepository {
    
    let apiClientService: ApiClientService
    let urlList: String
    
    func fetchMenuData() async throws -> [MenuItem] {
        let url = URL(string: urlList)
        return try await apiClientService.request(url: url, type: MenuDTO.self).toDomain() //con MenuDTO le decimos como decodificar el data que recibimos del request
        
    }
}
