//
//  HomeFeedTableViewCell.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/05.
//

import UIKit

class HomeFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var feedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func goToAccountBtnDidTap(_ sender: Any) {
    }
    @IBAction func moreBtnDidTap(_ sender: Any) {
    }
    @IBAction func commentBtnDidTap(_ sender: Any) {
    }
    @IBAction func shareBtnDidTap(_ sender: Any) {
    }
    @IBAction func likeBtnDidTap(_ sender: Any) {
    }
    @IBAction func bookMarkBtnDidTap(_ sender: Any) {
    }
    @IBAction func likesFieldBtnDidTap(_ sender: Any) {
    }
    @IBAction func accountBtnDidTap(_ sender: Any) {
    }
    @IBAction func descriptionFieldBtnDidTap(_ sender: Any) {
    }
    @IBAction func moreCommentsBtnDidTap(_ sender: Any) {
    }
    
}
