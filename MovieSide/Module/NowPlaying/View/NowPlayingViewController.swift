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
    
    var movies: [String] = []

    convenience init(movies: [String]) {
        self.init()
        self.movies = movies
    }
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        configureData()
    }
    
    //MARK: UI

    private func prepareUI() {
        title = "Now Playing"
    }
    
    //MARK: Data
    
    private func configureData() {
        
    }
}

extension NowPlayingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
