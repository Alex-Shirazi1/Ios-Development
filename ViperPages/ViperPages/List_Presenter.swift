//
//  List_Presenter.swift
//  ViperPages
//
//  Created by Alex Shirazi on 1/15/23.
//

import Foundation
//talks to router
//talks to view
//talks to interator

protocol List_Presenter_Protocol {
    var router: List_Router_Protocol? {get set}
    var view: List_View_Protocol? {get set}
    var interactor: List_Interactor_Protocol? {get set}
    
    
     func viewDidLoad()
    func interactorFetchData(result: Result<[Country],Error>)
    func tapOnDetail(_ country: Country)
    
}

class List_Presenter: List_Presenter_Protocol {
    var router: List_Router_Protocol?
    
    var view: List_View_Protocol?
    
    var interactor: List_Interactor_Protocol?
    
    func viewDidLoad() {
        interactor?.getListData()
    }
    
    func interactorFetchData(result: Result<[Country], Error>) {
        
        switch(result) {
        case .success(let countries):
            view?.update(with: countries)
        case .failure(let error):
            view?.update(with: "Failed to Load")
        }
    }
    
    func tapOnDetail(_ country: Country) {
        router?.toDetailView(country: country)
    }
    
    
}
