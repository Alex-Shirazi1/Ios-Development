//
//  FooterView.swift
//  ContactsProj
//
//  Created by Alex Shirazi on 12/20/22.
//

import Foundation
import UIKit

class TableFooter: UITableViewHeaderFooterView {
    static let identifier = "TableFooter"
    

    private let label: UILabel = {
        let label = UILabel()
        label.font  = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
        
    }()
    private let sublabel: UILabel = {
        let label = UILabel()
        label.text = "Shirazi Inc"
        label.textColor = .black
        label.font  = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        return label
        
    }()
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(sublabel)
        contentView.backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(text: String){
        label.text = text
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        sublabel.sizeToFit()
        
        let width = contentView.frame.size.width
        let height = contentView.frame.size.height
        label.frame = CGRect(x: 0, y: 0, width: width , height: height/2 )
        sublabel.frame = CGRect(x: 0, y: height/2, width: width , height: height/2 )
       
    }
}
