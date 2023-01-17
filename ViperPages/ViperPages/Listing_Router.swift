//
//  Listing_Router.swift
//  ViperPages
//
//  Created by Alex Shirazi on 1/16/23.
//

import Foundation


//entry point to viper arch

protocol ListingDetails_Router_Protocol {
    var entry: ListingDetails_ViewController? {get}
    static func createListingDetails(with country:Country)-> ListingDetails_Router_Protocol
}

class ListingDetails_Router: ListingDetails_Router_Protocol {
    var entry: ListingDetails_ViewController?
    
    static func createListingDetails(with country: Country) -> ListingDetails_Router_Protocol {
        let router = ListingDetails_Router()
        let view = ListingDetails_ViewController()
        let presenter = ListingDetails_Presenter()
        let interactor = ListingDetails_Interactor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.country = country
        
        router.entry = view
        return router
    }
    
    
}
