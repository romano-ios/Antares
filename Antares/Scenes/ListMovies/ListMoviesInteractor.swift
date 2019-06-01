//
//  ListMoviesInteractor.swift
//  Antares
//
//  Created by Leandro Romano on 05/05/19.
//  Copyright (c) 2019 Leandro Romano. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListMoviesBusinessLogic {
    func getMovies(by category: MovieCategory)
}

protocol ListMoviesDataStore {
    //var name: String { get set }
}

class ListMoviesInteractor: ListMoviesBusinessLogic, ListMoviesDataStore {

    var presenter: ListMoviesPresentationLogic?
    var worker: ListMoviesWorker?
    
    init(worker: ListMoviesWorker = ListMoviesWorker()) {
        self.worker = worker
    }
    
    func getMovies(by category: MovieCategory) {
        worker?.retrieveMovies(for: category).done(handleSuccess).catch(handleError)
    }
    
    private func handleSuccess(_ response: ListMovies.Response) {
        presenter?.presentMovies(response: response)
    }
    
    private func handleError(_ error: Error) {
        presenter?.presentError(error)
    }
    
}
