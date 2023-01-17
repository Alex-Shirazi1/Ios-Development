//
//  List_View.swift
//  ViperPages
//
//  Created by Alex Shirazi on 1/15/23.
//

import Foundation
import UIKit

//talks to presenter

protocol List_View_Protocol {
   
    var presenter: List_Presenter_Protocol? {get set}
    
  
    func update(with countries:[Country])
    func update(with error:String)
}

class ListViewController: UIViewController, List_View_Protocol {
    
    //component
    private let tableView: UITableView = UITableView()
    private let messageLabel: UILabel = UILabel()
    //property
    var presenter: List_Presenter_Protocol?
    var countries: [Country] = []
    
    //Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        presenter?.viewDidLoad()
        
        
    }
//    func viewDidAppear(<#T##animated: Bool##Bool#>) {
//       let selectedIndex = tableView.indexPathForSelectedRow {
//           tableView.deselectRow(at: selectedIndex, animated: true)
//       }
//
//}
    override func viewDidAppear(_ animated: Bool) {
         if let selectedtIndex = tableView.indexPathForSelectedRow {
             tableView.deselectRow(at: selectedtIndex, animated: true)
         }
     }
    
}
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
  

    func style(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
  
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.isHidden = false
        messageLabel.text = "Loading..."
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.textColor = .black
        messageLabel.textAlignment = .center
        

    }
    func layout(){
        view.addSubview(tableView)
        view.addSubview(messageLabel)
        
        
        
        //tableview
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        //messageLabel
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
     
        
    
    }
    
    func update(with countries: [Country]) {
        DispatchQueue.main.async { [weak self] in
            self?.countries = countries
            self?.messageLabel.isHidden = true
            self?.tableView.reloadData()
            self?.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.countries = []
            self?.tableView.isHidden = true
            self?.messageLabel.isHidden = false
            self?.messageLabel.text = error
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        presenter?.tapOnDetail(countries[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        var content = cell.defaultContentConfiguration()
        content.text = countries[indexPath.row].name
        content.secondaryText = countries[indexPath.row].emoji
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Countries"
    }
    
}

