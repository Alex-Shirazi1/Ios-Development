//
//  Listing_View.swift
//  ViperPages
//
//  Created by Alex Shirazi on 1/16/23.
//

import Foundation
import UIKit
import MapKit

//talks to presenter
protocol ListingDetails_View_Protocol {
    var presenter: ListingDetails_Presenter_Protocol? {get set}
    
    
    func update(with country:Country)
    func update(with error:String)
}

class ListingDetails_ViewController: UIViewController, ListingDetails_View_Protocol {
   
    //property
    var presenter: ListingDetails_Presenter_Protocol?
    
  //components
    let stackView = UIStackView()
    let label = UILabel()
   
    let label1 = UILabel()
    let label2 = UILabel()
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        presenter?.viewDidLoad()
    }
}
extension ListingDetails_ViewController {
    func style(){
        view.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Shirazi Label"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "Shirazi Label"
        label1.font = UIFont.preferredFont(forTextStyle: .title1)
        label1.textAlignment = .center
        
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "Shirazi Label"
        label2.font = UIFont.preferredFont(forTextStyle: .title1)
        label2.textAlignment = .center
        
        
        
        
    }
    func layout(){
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
     
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func update(with country: Country) {
        label.textColor = .black
        label.text = country.name
        label1.text = String(country.emoji)
        label2.text = country.code
    }
    
    func update(with error: String) {
        label.text = error
        label.textColor = .red
    }
    
}
