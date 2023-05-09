//
//  NumberCollectionViewCell.swift
//  GamesApp
//
//  Created by Şükrü on 10.05.2023.
//

import UIKit

class NumberCollectionViewCell: UICollectionViewCell {
 
    var numberView: UIView!
    var numberLabel: UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // Initialize
        
        self.initialize()
        
    }
    
    override var isSelected: Bool {
        
        didSet {
            
            numberView.backgroundColor = isSelected ? .black : .red
            
        }
        
    }
    
    func initialize(){
        
        // Create Number View
        
        self.createNumberView()
        
        // Create Number Label
        
        self.createNumberLabel()
    }
    
    func createNumberView(){
        
        self.numberView                = UIView()
        numberView.backgroundColor     = .red
        numberView.layer.masksToBounds = false
        numberView.clipsToBounds       = true
        numberView.layer.cornerRadius  = 40
        
        self.addSubview(numberView)
        
        numberView.translatesAutoresizingMaskIntoConstraints                      = false
        numberView.widthAnchor.constraint(equalToConstant: 80).isActive           = true
        numberView.heightAnchor.constraint(equalToConstant: 80).isActive          = true
        numberView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        numberView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    func createNumberLabel(){
        
        self.numberLabel = UILabel()
        numberLabel.text = "10"
        numberLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        numberLabel.textColor = UIColor.white
        
        numberView.addSubview(numberLabel)
        
        numberLabel.translatesAutoresizingMaskIntoConstraints                            = false
        numberLabel.centerXAnchor.constraint(equalTo: numberView.centerXAnchor).isActive  = true
        numberLabel.centerYAnchor.constraint(equalTo: numberView.centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
