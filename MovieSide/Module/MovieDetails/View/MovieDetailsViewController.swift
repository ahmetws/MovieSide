//
//  MovieDetailsViewController.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var viewModel: MovieDetailsViewModel!

    convenience init(viewModel: MovieDetailsViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        getMovieDetails()
    }
    
    //MARK: UI
    
    private func prepareUI() {
        title = viewModel.getTitle()
    }
    
    private func updateMovieDetails() {
        // update if movie is inside a collection
    }
    
    //MARK: Data
    
    private func getMovieDetails() {
        viewModel.getMovieDetails { [weak self] in
            DispatchQueue.main.async {
                self?.updateMovieDetails()
            }
        }
    }
}
