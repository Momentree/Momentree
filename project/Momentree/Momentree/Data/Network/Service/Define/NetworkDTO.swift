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

// TODO: 일기 저장 (단일)
struct SaveContentRequest: Encodable {
    
}

struct SaveContentResponse: Decodable {
    
}


// TODO: 일기 불러오기 (배열)
struct ObjectContentListRequest: Encodable {
    let userId: String
    let date: Int
}

struct ObjectContentListResponse: Decodable {

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
