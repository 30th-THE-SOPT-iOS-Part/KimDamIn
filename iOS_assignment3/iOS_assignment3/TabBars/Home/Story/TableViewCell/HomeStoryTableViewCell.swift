//
//  HomeStoryTableViewCell.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/06.
//

import UIKit

class HomeStoryTableViewCell: UITableViewCell {
    
    static let identifier = "HomeStoryTableViewCell"

    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
        registerDelegate()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - register Nib and Delegate
    
    func registerNib() {
        let storyNib = UINib(nibName: HomeStoryCollectionViewCell.identifier, bundle: nil)
        collectionView.register(storyNib, forCellWithReuseIdentifier:
        HomeStoryCollectionViewCell.identifier)
    }
    
    func registerDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

//MARK: - Collection View Protocol

extension HomeStoryTableViewCell: UICollectionViewDelegate {
    
}
extension HomeStoryTableViewCell : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeStoryDataModel.storySampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeStoryCollectionViewCell.identifier, for: indexPath) as? HomeStoryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setData(HomeStoryDataModel.storySampleData[indexPath.row])
        
        return cell
        
    }
}

extension HomeStoryTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (58/375)
        let cellHeight = cellWidth * (72/58)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }

  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    
}
