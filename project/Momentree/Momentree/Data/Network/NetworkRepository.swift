//
//  Repository.swift
//  Momentree
//
//  Created by Importants on 11/23/24.
//

import Foundation
import ComposableArchitecture

protocol NetworkRepositoryProtocol {
    func create(
        object: Object
    )  async throws -> Result<CreateObjectResponse, NetworkError>
}

final class NetworkRepository: NetworkRepositoryProtocol {
    let networkService = NetworkService(
        config: NetworkConfiguration(
            baseURL: "http://ec2-184-73-145-160.compute-1.amazonaws.com:8080",
            header: [:],
            queryParameters: [:]
        )
    )
    
    func create(object: Object) async throws -> Result<CreateObjectResponse, NetworkError> {
        do {
            let reqeust = CreateObjectRequest(content: object.content)
            let endPoint = APIEndPoints.createObject(
                request: reqeust,
                path: "\(object.day)"
            )
            let result = try await networkService.asyncRequest(with: endPoint)
            return .success(result)
        }
        catch {
            throw NetworkError.URLError
        }
    }
}

extension NetworkRepository {
    
}

private enum NetworkRepositoryKey: DependencyKey {
    static var liveValue: NetworkRepository = NetworkRepository()
}

extension DependencyValues {
    var networkRepository: NetworkRepository {
        get { self[NetworkRepositoryKey.self] }
        set { self[NetworkRepositoryKey.self] = newValue }
    }
}
