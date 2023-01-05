//
//  Interator.swift
//  Viper
//
//  Created by Alex Shirazi on 1/4/23.
//

import Foundation
//obj
//protocl
//reference to presenter

//https://jsonplaceholder.typicode.com/users


protocol AnyInterator{
    var presenter: AnyPresenter? {get set}
    
    func getUsers()
}

class UserInterator: AnyInterator{
    var presenter: AnyPresenter?
    
    func getUsers() {
        print("start fetching")
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presenter?.interatorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            do{
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interatorDidFetchUsers(with: .success(entities))
            }
            catch{
                self?.presenter?.interatorDidFetchUsers(with: .failure(error))
                
            }
            
            
        }
        task.resume()
        
    }}
