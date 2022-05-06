//
//  HomeFeedDataModel.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/06.
//

import Foundation

struct HomeFeedDataModel {
    
    let profileImage:String
    let profileName:String
    let feedImage:String
    
    let likesCount:Int
    let caption:String
    let commentsCount:Int

}

extension HomeFeedDataModel {
    
    static let feedSampleData: [HomeFeedDataModel] = [
        HomeFeedDataModel(
            profileImage: "profileImage1",
            profileName: "Teletubbies",
            feedImage: "feedImage1",
            likesCount: 123,
            caption: "나 돈 많아 이거 자랑하고 싶었어~",
            commentsCount:23
        ),
        HomeFeedDataModel(
            profileImage: "profileImage2",
            profileName: "Boradol2",
            feedImage: "feedImage2",
            likesCount: 123,
            caption: "나 돈 많아 이거 자랑하고 싶었어~",
            commentsCount:23
        ),
        HomeFeedDataModel(
            profileImage: "profileImage3",
            profileName: "DDubi",
            feedImage: "feedImage3",
            likesCount: 123,
            caption: "나 돈 많아 이거 자랑하고 싶었어~",
            commentsCount:23
        ),
        HomeFeedDataModel(
            profileImage: "profileImage4",
            profileName: "NaNa",
            feedImage: "feedImage4",
            likesCount: 123,
            caption: "나 돈 많아 이거 자랑하고 싶었어~",
            commentsCount:23
        ),
        HomeFeedDataModel(
            profileImage: "profileImage5",
            profileName: "BBo",
            feedImage: "feedImage5",
            likesCount: 123,
            caption: "나 돈 많아 이거 자랑하고 싶었어~",
            commentsCount:23
        ),
    ]
}
