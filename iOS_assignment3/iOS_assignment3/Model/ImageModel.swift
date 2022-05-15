//
//  ImageModel.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/13.
//

import Foundation

struct ImageResponse: Codable {
    let object: [ImageData]
}

struct ImageData: Codable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let downloadUrl: String
    
//    enum Codingkeys: String, CodingKey {
//        case id, author, width, height, url
//        case downloadUrl = "download_url"
//    }
}




