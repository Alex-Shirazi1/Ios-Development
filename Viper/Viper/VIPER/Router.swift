//
//  Router.swift
//  Viper
//
//  Created by Alex Shirazi on 1/4/23.
//

import Foundation
import UIKit

//object
//entry point

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    
    var entry: EntryPoint? {get}
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {

    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
       
        //assign VIP in here
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInterator = UserInterator()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        return router
    }
    
    
}
