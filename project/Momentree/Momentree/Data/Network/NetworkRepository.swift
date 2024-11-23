//
//  Repository.swift
//  Momentree
//
//  Created by Importants on 11/23/24.
//

import Foundation

protocol NetworkRepositoryProtocol {
    func signUp(
        loginId: String,
        password: String
    )
    
    func signIn(
        loginId: String,
        password: String
    )
}

// 유저 아이디 :
// 보낼 때 1~18
// 캘린던 day -: (1)
