//
//  HeaderView.swift
//  ContactsProj
//
//  Created by Alex Shirazi on 12/20/22.
//

import Foundation
import UIKit


class TableHeader: UITableViewHeaderFooterView {
    static let identifier = "TableHeader"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "steve")
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
      
        label.font  = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        return label
        
    }()
    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        backgroundColor = .systemBlue
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
        label.frame = CGRect(x: 0, y: contentView.frame.size.height-10-label.frame.size.height, width: contentView.frame.size.width, height: label.frame.size.height)
        
        
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height-15-label.frame.size.height)
    }
}


