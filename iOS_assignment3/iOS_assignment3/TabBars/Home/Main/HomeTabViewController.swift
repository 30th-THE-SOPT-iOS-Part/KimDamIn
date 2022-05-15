//
//  HomeTabViewController.swift
//  iOS_assignment3
//
//  Created by 김담인 on 2022/05/05.
//

import UIKit

class HomeTabViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var addUIButton: UIButton!
    @IBOutlet weak var likeUIButton: UIButton!
    @IBOutlet weak var shareUIButton: UIButton!
    @IBOutlet weak var homeFeedTableView: UITableView!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        registerDelegate()
    }
    
    //MARK: - IBAction
    @IBAction func addBtnDidTap(_ sender: Any) {
    }
    @IBAction func likeBtnDidTap(_ sender: Any) {
    }
    @IBAction func shareBtnDidTap(_ sender: Any) {
    }
    
    //MARK: - register Nib and Delegate
    func registerNib() {
        let feedNib = UINib(nibName: HomeFeedTableViewCell.identifier, bundle: nil)
        homeFeedTableView.register(feedNib, forCellReuseIdentifier: HomeFeedTableViewCell.identifier)
        
        let storyNib = UINib(nibName: HomeStoryTableViewCell.identifier, bundle: nil)
        homeFeedTableView.register(storyNib, forCellReuseIdentifier: HomeStoryTableViewCell.identifier)
    } 
    
    func registerDelegate() {
        homeFeedTableView.delegate = self
        homeFeedTableView.dataSource = self
    }

}

//MARK: - Table View Protocol
extension HomeTabViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var sectionSize: CGFloat
        
        sectionSize = indexPath.section == 0 ? 72 : 488
        
        return sectionSize
    }
    
}
extension HomeTabViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection  section: Int) -> Int {
        
        var rows: Int
        
        rows = section == 0 ? 1 : HomeFeedDataModel.feedSampleData.count
        
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            guard let storyTableCell = homeFeedTableView.dequeueReusableCell(withIdentifier: HomeStoryTableViewCell.identifier, for: indexPath) as? HomeStoryTableViewCell else { return UITableViewCell() }
            return storyTableCell

        }else {
            guard let feedCell = homeFeedTableView.dequeueReusableCell(withIdentifier: HomeFeedTableViewCell.identifier, for: indexPath) as? HomeFeedTableViewCell else { return UITableViewCell() }

            feedCell.setData(HomeFeedDataModel.feedSampleData[indexPath.row])

            return feedCell
        }
    }
}

// feed image 가져오는 함수
extension HomeTabViewController {
    
}

