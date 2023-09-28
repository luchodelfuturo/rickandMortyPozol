//
//  LoadMenuUseCase.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 28/09/2023.
//

protocol LoadMenuUseCase {
    func execute() async -> Result <[MenuItem], Error>
}

struct LoadMenuUseCaseImp: LoadMenuUseCase {
    let menuRepository: MenuRepository
    
    func execute() async -> Result<[MenuItem], Error> {
        do {
            let repositoryResult = try await menuRepository.fetchMenuData()
            return .success(repositoryResult)
        } catch {
            return .failure(error)
        }
    }
} 
