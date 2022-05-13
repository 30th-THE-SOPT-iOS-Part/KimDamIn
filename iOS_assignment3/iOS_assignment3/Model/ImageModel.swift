//
//  ImageModel.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/13.
//

import Foundation

struct ImageResponse: Codable {
    let id: Int
    let author: String
    let width: Int
    let height: Int
    let url: String
    let downloadUrl: String
}
