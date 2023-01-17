//
//  List_Router.swift
//  ViperPages
//
//  Created by Alex Shirazi on 1/15/23.
//

import Foundation
import UIKit
//talks to presenter
//entry point

protocol List_Router_Protocol {
    var entry: ListViewController? {get}
    static func Init() -> List_Router_Protocol
    func toDetailView(country: Country)
}
class List_Router: List_Router_Protocol {
    var entry: ListViewController?
    
    static func Init() -> List_Router_Protocol {
        let router = List_Router()
        let view = ListViewController()
        let presenter = List_Presenter()
        let interactor = List_Interactor()
        
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.entry = view
        
        return router
    }
    
    func toDetailView(country: Country) {
        let detailRouter = ListingDetails_Router.createListingDetails(with: country)
        guard let detailView = detailRouter.entry else {return}
        guard let viewController = self.entry else {return}
        
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
    
    
}
