//
//  Listing_Presenter.swift
//  ViperPages
//
//  Created by Alex Shirazi on 1/16/23.
//

import Foundation

//talks to view, Interactor, and Router

protocol ListingDetails_Presenter_Protocol {
    var router: ListingDetails_Router_Protocol? {get set}
    var interactor: ListingDetails_Interactor_Protocol? {get set}
    var view: ListingDetails_View_Protocol? {get set}
    
    func interactorUpdateData(country: Country?)
    func viewDidLoad()
}

class ListingDetails_Presenter: ListingDetails_Presenter_Protocol {
    var router: ListingDetails_Router_Protocol?
    
    var interactor: ListingDetails_Interactor_Protocol?
    
    var view: ListingDetails_View_Protocol?
    
    func interactorUpdateData(country: Country?) {
        if let country = country {
            view?.update(with: country)
        } else{
            view?.update(with: "No Data")
        }
       
    }
    
    func viewDidLoad() {
        interactor?.getCountryData()
    }
    
    
}
