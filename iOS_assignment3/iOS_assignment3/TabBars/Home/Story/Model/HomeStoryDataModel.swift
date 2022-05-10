//
//  HomeStoryDataModel.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/06.
//

import Foundation

struct HomeStoryDataModel {
    
    let profileImage:String
    let profileName:String
}

extension HomeStoryDataModel {
    static let storySampleData: [HomeStoryDataModel] = [
        
        HomeStoryDataModel(
            profileImage: "profileImage1",
            profileName: "Name1"
        ),
        HomeStoryDataModel(
            profileImage: "profileImage2",
            profileName: "Name2"
        ),
        HomeStoryDataModel(
            profileImage: "profileImage3",
            profileName: "Name3"
        ),
        HomeStoryDataModel(
            profileImage: "profileImage4",
            profileName: "Name4"
        ),
        HomeStoryDataModel(
            profileImage: "profileImage5",
            profileName: "Name5"
        ),
        HomeStoryDataModel(
            profileImage: "profileImage6",
            profileName: "Name6"
        ),
        HomeStoryDataModel(
            profileImage: "profileImage1",
            profileName: "Name1"
        ),
        HomeStoryDataModel(
            profileImage: "profileImage2",
            profileName: "Name2"
        ),
        HomeStoryDataModel(
            profileImage: "profileImage3",
            profileName: "Name3"
        ),
        HomeStoryDataModel(
            profileImage: "profileImage4",
            profileName: "Name4"
        ),
        HomeStoryDataModel(
            profileImage: "profileImage5",
            profileName: "Name5"
        ),
        HomeStoryDataModel(
            profileImage: "profileImage6",
            profileName: "Name6"
        )
    
    ]
}
