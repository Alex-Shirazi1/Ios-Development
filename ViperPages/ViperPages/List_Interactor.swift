//
//  List_Interactor.swift
//  ViperPages
//
//  Created by Alex Shirazi on 1/15/23.
//

import Foundation
//talks to presenter

protocol List_Interactor_Protocol {
    var presenter: List_Presenter_Protocol? {get set}
    
    func getListData()
}

class List_Interactor: List_Interactor_Protocol {
    var presenter: List_Presenter_Protocol?
    
    func getListData() {
        guard let url = URL(string: "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/index.json") else { return }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data,response,error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorFetchData(result: .failure(NetworkError.serverError))
                return
            }
            
            do {
               
                let countries = try JSONDecoder().decode([Country].self, from: data)
                self?.presenter?.interactorFetchData(result: .success(countries))
            } catch {
                self?.presenter?.interactorFetchData(result: .failure(NetworkError.decodingError))
            }
        }
        task.resume()
    }
    
    
}
