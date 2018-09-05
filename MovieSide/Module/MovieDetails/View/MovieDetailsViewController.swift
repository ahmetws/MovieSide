//
//  MovieDetailsViewController.swift
//  MovieSide
//
//  Created by Ahmet Yalcinkaya on 5.09.2018.
//  Copyright © 2018 AppSide. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

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
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        tableView.tableFooterView = UIView()
        
        tableView.register(MovieHeaderCell.self)
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

extension MovieDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowType: MovieDetailsViewModel.MovieDetailsRowType = viewModel.rowType(for: indexPath)
        
        switch rowType {
        case .header(let movie):
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieHeaderCell.identifier) as! MovieHeaderCell
            cell.setup(with: movie)
            return cell
        case .collection:
            return UITableViewCell()
        }
    }
    
}
