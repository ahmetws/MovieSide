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
    weak var delegate: ShowDetailsCoordinatorDelegate!

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
        tableView.register(MovieCollectionCell.self)
    }
    
    private func updateMovieDetails() {
        // update if movie is inside a collection
        guard viewModel.movieBelongsToCollection() else { return }
        
        getCollectionDetails()
    }
    
    private func updateCollection() {
        viewModel.updateCollection()
        reloadData()
    }
    
    private func reloadData() {
        tableView.reloadData()
    }
    
    //MARK: Data
    
    private func getMovieDetails() {
        viewModel.getMovieDetails { [weak self] in
            DispatchQueue.main.async {
                self?.updateMovieDetails()
            }
        }
    }
    
    private func getCollectionDetails() {
        viewModel.getCollectionDetails { [weak self] in
            DispatchQueue.main.async {
                self?.updateCollection()
            }
        }
    }
    
    //MARK: Selection
    
    private func didSelectMovie() -> MoviesDataSource.MovieSelectHandler {
        return { [weak self] (movie) in
            if let strongSelf = self {
                strongSelf.delegate.showDetails(of: movie, from: strongSelf)
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
        case .collection(let movies, let collectionName):
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieCollectionCell.identifier) as! MovieCollectionCell
            cell.setup(collectionName: collectionName, movies: movies, didSelectHandler: didSelectMovie())
            return cell
        }
    }
}

extension MovieDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowType: MovieDetailsViewModel.MovieDetailsRowType = viewModel.rowType(for: indexPath)
        
        switch rowType {
        case .collection(let movies, _):
            return CGFloat(AppConstants.MovieCollection.collectionHeight(from: Float(tableView.frame.width), itemCount: movies.count) + AppConstants.MovieCollection.CollectionSectionTitleHeight) 
        default:
            return UITableViewAutomaticDimension
        }
    }
}
