//
//  Listing_Interactor.swift
//  ViperPages
//
//  Created by Alex Shirazi on 1/16/23.
//

import Foundation

//talks to presenter
protocol ListingDetails_Interactor_Protocol {
    var presenter: ListingDetails_Presenter_Protocol? {get set}
    var country: Country? {get set}
    
    func getCountryData()
}

class ListingDetails_Interactor: ListingDetails_Interactor_Protocol {
    var presenter: ListingDetails_Presenter_Protocol?
    
    var country: Country?
    
    func getCountryData() {
        presenter?.interactorUpdateData(country: country)
        
    }
    
    
}
