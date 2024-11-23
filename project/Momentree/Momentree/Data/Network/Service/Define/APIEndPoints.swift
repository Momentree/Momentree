//
//  APIEndPoints.swift
//  Momentree
//
//  Created by Importants on 11/23/24.
//

import Foundation

/**
 API 엔드포인트를 정의하고 관리하는 구조체입니다.
 
 이 구조체는 다양한 API 요청에 대한 엔드포인트를 생성하는 정적 메서드를 포함합니다.
 */
struct APIEndPoints {
    
    /**
     API 경로를 정의하는 열거형입니다.
     */
    // TODO: - path 입력
    enum APIPath: String {
        case signUp = "/api/signUp/path"
        case signIn = "/api/signIn/path"
        case checkToken = "/api/test/whoami"
        
        case saveContent = "/api/saveContent"
        case getObjectList = "/api/getObjectList"
        case getDetailObject = "api/getObject"
        
        case createObject = "/api/diary/create/"
        case updateObject = "/api/diary/update"
    }

    static func signUpEndPoint(
    ) -> EndPoint<signUpResponse> {
        EndPoint(
            path: APIPath.signUp,
            method: .post
        )
    }
    
    static func signInEndPoint(
    ) -> EndPoint<signInResponse> {
        EndPoint(
            path: APIPath.signIn,
            method: .post
        )
    }
    
    static func checkToken(
    ) -> EndPoint<checkTokenResponse> {
        EndPoint(
            path: APIPath.checkToken,
            method: .post
        )
    }
    
    static func createObject(
        request: CreateObjectRequest,
        path: String
    ) -> EndPoint<CreateObjectResponse> {
        EndPoint(
            path: APIPath.createObject,
            method: .post,
            pathParameter: path
        )
    }
    
    static func updateObject(
        request: UpdateObjectRequest
    ) -> EndPoint<UpdateObjectResponse> {
        EndPoint(
            path: APIPath.updateObject,
            method: .post
        )
    }
}
