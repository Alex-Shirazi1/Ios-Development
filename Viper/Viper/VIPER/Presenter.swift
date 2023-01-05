//
//  Presenter.swift
//  Viper
//
//  Created by Alex Shirazi on 1/4/23.
//

import Foundation
// object
//protocl
//reference to interator
//reference to router
//reference to view

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? {get set }
    var interactor: AnyInterator? {get set}
    var view: AnyView? {get set}
    
    func interatorDidFetchUsers(with result: Result<[User],Error>)
}

class UserPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInterator? {
        didSet{
            interactor?.getUsers()
        }
    }
    
    var view: AnyView?
    
   
    func interatorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success(let users):
            view?.update(with: users)
        case .failure:
            view?.update(with: "something went wrong")
        }
    }
    
    
}
