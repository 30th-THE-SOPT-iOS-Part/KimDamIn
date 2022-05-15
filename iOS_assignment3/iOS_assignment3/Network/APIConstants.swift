//
//  APIConstants.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/12.
//

import Foundation

/*
 API Constants
 
 - 주소를 모아놓은 구조체
 - 이름은 형식상 API를 모아 놓았다는 느낌으로 APIConstants라고 지음
 */

struct APIConstants {
    // MARK: - Auth Base URL
    static let authBaseURL = "http://13.124.62.236"
    // MARK: - Feature URL
    // loginURL = "http://13.124.62.236/auth/signin"
    static let loginURL = authBaseURL + "/auth/signin"
    // signUpURL = "http://13.124.62.236/auth/signin"
    static let signUpURL = authBaseURL + "/auth/signup"
    
    //MARK: - Picsum Base URL
    static let picsumURL = "  https://picsum.photos/v2/list"
//    static let feedsizeURL = "/340/375"
}
