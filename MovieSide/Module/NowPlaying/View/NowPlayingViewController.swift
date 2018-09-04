//
//  NowPlayingViewController.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 4.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: NowPlayingViewModel!

    convenience init(viewModel: NowPlayingViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        configureData()
    }
    
    //MARK: UI

    private func prepareUI() {
        title = viewModel.getTitle()
    }
    
    //MARK: Data
    
    private func configureData() {
        
    }
}

extension NowPlayingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
