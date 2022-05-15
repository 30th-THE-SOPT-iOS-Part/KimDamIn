//
//  SignUpModel.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/12.
//

import Foundation

struct SignUpResponse: Codable {
    let status: Int
    let success: Bool?
    let message: String
    let data: SignUpData?
}

struct SignUpData: Codable {
    let id: Int
}
