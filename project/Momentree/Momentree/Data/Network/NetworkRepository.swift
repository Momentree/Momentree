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
    
    func update(
        object: Object
    ) async throws
    
    func getList(
    ) async throws -> [Object]
}

final class NetworkRepository: NetworkRepositoryProtocol {
    let networkService = NetworkService(
        config: NetworkConfiguration(
            baseURL: "http://ec2-184-73-145-160.compute-1.amazonaws.com:8080",
            header: ["Content-Type":"application/json"],
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
    
    func update(object: Object) async throws {
        let reqeust = UpdateObjectRequest(id: object.day, content: object.content)
        let endPoint = APIEndPoints.updateObject(request: reqeust)
        let result = try await networkService.asyncRequest(with: endPoint)
    }
    
    func getList() async throws -> [Object] {
        let request = ObjectContentListRequest()
        let endPoint = APIEndPoints.getObjectList()
        return try await networkService.asyncRequest(with: endPoint).list
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
