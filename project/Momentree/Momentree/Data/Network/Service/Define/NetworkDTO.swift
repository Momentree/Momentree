//
//  NetworkDTO.swift
//  Momentree
//
//  Created by Importants on 11/23/24.
//

import Foundation

struct signUpRequest: Encodable {
    let loginId: String
    let password: String
}

struct signUpResponse: Decodable {
    // TODO: response
}

struct signInRequest: Encodable {
    let loginId: String
    let password: String
}

struct signInResponse: Decodable {
    let accessToken: String
    let userId: String
}

struct checkTokenRequest: Encodable {
    let token: String
}

struct checkTokenResponse: Decodable {
    let code: String
}

struct CreateObjectRequest: Encodable {
    let content: String
    let openStatus: String
    
    init(content: String, openStatus: String = "OPEN") {
        self.content = content
        self.openStatus = openStatus
    }
}

struct CreateObjectResponse: Decodable {
    let id: Int?
    let createDate: String
    let lastModifiedDate: String
}

struct UpdateObjectRequest: Encodable {
    let id: Int
    let content: String
}

struct UpdateObjectResponse: Decodable {
    
}

struct SaveContentRequest: Encodable {
    
}

struct SaveContentResponse: Decodable {
    
}


// TODO: 일기 불러오기 (배열)
struct ObjectContentListRequest: Encodable {
}

struct ObjectContentListResponse: Decodable {
    let list: [Object]
}

// TODO: 일기 디테일 불러오기 (단일)
struct ObjectDetailResponse: Encodable {
    
}

struct ObjectDetailRequest: Decodable {
    let userId: String
    let title: String
    let content: String
    let date: String
}
