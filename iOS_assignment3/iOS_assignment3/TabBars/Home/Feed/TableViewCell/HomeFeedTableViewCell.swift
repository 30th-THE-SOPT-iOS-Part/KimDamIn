//
//  HomeFeedTableViewCell.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/05.
//

import UIKit

class HomeFeedTableViewCell: UITableViewCell {
    
    static let identifier = "HomeFeedTableViewCell"
    
    //MARK: - IBOutlet
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var captionUserName: UIButton!
    @IBOutlet weak var comments: UIButton!
    @IBOutlet weak var caption: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUIButtonSize()
    }
    
    //MARK: - Function
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ feedData: HomeFeedDataModel) {
        profileImage.image = UIImage(named: feedData.profileImage)
        profileName.text = feedData.profileName
        //피드 이미지
        feedImage.image = UIImage(named: feedData.feedImage)
        
        likeCountLabel.text = "좋아요\(feedData.likesCount)개"
        captionUserName.setTitle(feedData.profileName, for: .normal)
        caption.text = feedData.caption
        comments.setTitle("댓글 \(feedData.commentsCount)개 모두 보기", for: .normal)
        
    }
    
    func setUIButtonSize(){
        captionUserName.titleLabel?.numberOfLines = 1
        captionUserName.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    //MARK: - IBAction
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
    @IBAction func captionFieldBtnDidTap(_ sender: Any) {
    }
    @IBAction func moreCommentsBtnDidTap(_ sender: Any) {
    }
    
}


