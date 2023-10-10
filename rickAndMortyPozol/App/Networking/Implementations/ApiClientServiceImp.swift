//
//  ApiClientServiceImp.swift
//  rickAndMortyPozol
//
//  Created by u633168 on 10/10/2023.
//

import Foundation

struct ApiClientServiceImp: ApiClientService {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared){
        self.session = session
    }
    // Vamos a usar esta funcion, y realizamos el Request
    func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T {
        //vamos a validar nuestra url
        guard let url = url else { throw ApiError.errorInUrl }
        return try await makeRequest(url: url)
        
    }
    // aca realizamos la request, utiliza async await, el async throws nos puede devolver un error o nuestra respuesta
    private func makeRequest<T: Decodable>(url: URL) async throws -> T {
       let request = try await session.data(from: url)
        return try validateResponse(request: request)
    }
    // Luego usamos una func para validar la respuesta si es 200, 400, 0 500 utilizando un enum para el tipo de error
    private func validateResponse<T: Decodable>(
        request: (data: Data, httpResponse: URLResponse) // en el response recibimos una dupla, el data y el response es el que validamos.
    ) throws -> T {
        guard let httpResponse = request.httpResponse as? HTTPURLResponse
        else { throw ApiError.unknownError}
        
        switch httpResponse.statusCode {
        case HttpResponseStatus.ok:
            return try decoModel(data: request.data) // es 200 la resp, entonces pasamos a decodificar la data de la response
        case HttpResponseStatus.clienteError:
            throw ApiError.clientError
        case HttpResponseStatus.serverError:
            throw ApiError.serverError
        default:
            throw ApiError.unknownError
        }
    }
    // Esta es la func que decodifica la data en base al tipo de modelo que queremos y nos retorna nuestro modelo T
    private func decoModel<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        let model = try? decoder.decode(T.self, from: data) // Decodificamos con el modelo generico.
        guard let model = model else { throw ApiError.errorDecoding } // Lanza error si no pudo decodificar correctamente.
        return model
    }
    
}
