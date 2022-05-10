//
//  HomeStoryCollectionViewCell.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/06.
//

import UIKit

class HomeStoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "HomeStoryCollectionViewCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName:  UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.sizeToFit()
    }
    
    func setData(_ storyData: HomeStoryDataModel){
        profileImage.image = UIImage(named: storyData.profileImage)
        profileName.text = storyData.profileName
    }

}
