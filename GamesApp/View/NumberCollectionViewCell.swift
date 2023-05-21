//
//  NumberCollectionViewCell.swift
//  GamesApp
//
//  Created by Şükrü on 10.05.2023.
//

import UIKit

class NumberCollectionViewCell: UICollectionViewCell {
 
    // Views
    
    var numberView : UIView!
    var numberLabel: UILabel!
    var blurView   : UIVisualEffectView!
    
    // ---------------------------------------------
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // Initialize
        
        self.initialize()
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Initialize
     */
    
    func initialize(){
        
        // Create Number View
        
        self.createNumberView()
        
        // Create Number Label
        
        self.createNumberLabel()
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Number View
     */
    
    func createNumberView(){
        
        // Create Number View
        
        self.numberView                = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        numberView.backgroundColor     = .clear
        numberView.layer.masksToBounds = false
        numberView.clipsToBounds       = true
        numberView.layer.cornerRadius  = 40
        numberView.layer.borderWidth   = 0.8
        numberView.layer.borderColor   = UIColor.systemGray.cgColor
        
        self.addSubview(numberView)
        
        // Create Blur Effect
        
        let blurEffect              = UIBlurEffect(style: .regular)
        blurView                    = UIVisualEffectView(effect: blurEffect)
        blurView.frame              = numberView.frame
        blurView.layer.cornerRadius = 15
        blurView.clipsToBounds      = true
        
        numberView.addSubview(blurView)
  
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Number Label
     */
    
    func createNumberLabel(){
        
        // Create Number Label
        
        self.numberLabel = UILabel()
        numberLabel.text = "10"
        numberLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        numberLabel.textColor = UIColor.black
        
        numberView.addSubview(numberLabel)
        
        // Number Label Constraints
        
        numberLabel.translatesAutoresizingMaskIntoConstraints                            = false
        numberLabel.centerXAnchor.constraint(equalTo: numberView.centerXAnchor).isActive = true
        numberLabel.centerYAnchor.constraint(equalTo: numberView.centerYAnchor).isActive = true
        
    }
    
    // Required Init
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
}
