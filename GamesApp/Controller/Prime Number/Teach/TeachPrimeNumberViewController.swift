//
//  TeachPrimeNumberViewController.swift
//  GamesApp
//
//  Created by Şükrü on 20.05.2023.
//

import UIKit

class TeachPrimeNumberViewController: UIViewController {

    /*
     *  Views
     */
    
    var titleLabel               : UILabel!
    
    var teachingLabel            : UILabel!
    var teachingDescriptionLabel : UILabel!
    var teachTickButton          : UIButton!
    
    var applyLabel               : UILabel!
    var applyDescriptionLabel    : UILabel!
    var applyTickButton          : UIButton!
    
    var checkLabel               : UILabel!
    var chechDescriptionLabel    : UILabel!
    var checkTickButton          : UIButton!
    
    var nextButton               : UIButton!
    
    // ---------------------------------------------
    
    /*
     *  Vars
     */
    
    var tickCount = 0
    
    // ---------------------------------------------
    
    /*
     *  View Did Load
     */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Initialize
        
        self.initialize()

    }
    
    // ---------------------------------------------
    
    /*
     *  Initialize
     */
    
    func initialize(){
        
        self.view.backgroundColor = .white
        
        // Create Title Label
        
        self.createTitleLabel()
        
        // Create Teaching Label
        
        self.createTeachingLabel()
        
        // Create Teaching Description Label
        
        self.createTeachingDescriptionLabel()
        
        // Create Apply Label
        
        self.createApplyLabel()
        
        // Create Apply Description Label
        
        self.createApplyDescriptionLabel()
        
        // Create Check Label
        
        self.createCheckabel()
        
        // Create Check Description Label
        
        self.createCheckDescriptionLabel()
        
        // Create Next Button
        
        self.createNextButton()
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Title Label
     */
    
    func createTitleLabel(){
        
        // Create Title Label
        
        self.titleLabel          = UILabel()
        titleLabel.text          = "Asal Sayılar"
        titleLabel.font          = UIFont.systemFont(ofSize: 35, weight: .bold)
        titleLabel.textColor     = .systemRed
        titleLabel.textAlignment = .center
        
        self.view.addSubview(titleLabel)
        
        // Title Label Constraints
        
        titleLabel.translatesAutoresizingMaskIntoConstraints                                                    = false
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 0).isActive              = true
        titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive           = true
        titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Teaching Label
     */
    
    func createTeachingLabel(){
        
        self.teachingLabel          = UILabel()
        teachingLabel.text          = "Öğrenelim"
        teachingLabel.font          = UIFont.systemFont(ofSize: 25, weight: .bold)
        teachingLabel.textColor     = UIColor.black
        teachingLabel.textAlignment = .center
        
        self.view.addSubview(teachingLabel)
        
        // Teaching Label Constraints
            
        teachingLabel.translatesAutoresizingMaskIntoConstraints                                            = false
        teachingLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive    = true
        teachingLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        teachingLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 50).isActive   = true
        
        // Create Tick Button
        
        self.teachTickButton          = UIButton()
        teachTickButton.isEnabled     = true
        teachTickButton.layer.opacity = 0.2
        teachTickButton.tag           = 0
        
        teachTickButton.setImage(UIImage(named: "greenTick"), for: .normal)
        teachTickButton.addTarget(self, action: #selector(clickActive), for: .touchUpInside)
        
        self.view.addSubview(teachTickButton)
        
        teachTickButton.translatesAutoresizingMaskIntoConstraints                                            = false
        teachTickButton.widthAnchor.constraint(equalToConstant: 25).isActive                                 = true
        teachTickButton.heightAnchor.constraint(equalToConstant: 25).isActive                                = true
        teachTickButton.centerYAnchor.constraint(equalTo: teachingLabel.centerYAnchor).isActive              = true
        teachTickButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Teaching Description Label
     */
    
    func createTeachingDescriptionLabel(){
        
        // Create Teaching Description Label
        
        self.teachingDescriptionLabel = UILabel()
        teachingDescriptionLabel.text = "Merhaba! Bugün sana bir sayının asal sayı olup olmadığını nasıl bulabileceğini öğreteceğim. Asal sayılar, yalnızca kendisiyle ve 1 ile bölünebilen sayılardır. Yani, bir sayının yalnızca 1 ve kendisiyle bölündüğünde kalan sıfır olmalıdır."
        teachingDescriptionLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        teachingDescriptionLabel.numberOfLines = 0
        teachingDescriptionLabel.textAlignment = .center
        
        self.view.addSubview(teachingDescriptionLabel)
        
        // Teaching Description Label Constraints
        
        teachingDescriptionLabel.translatesAutoresizingMaskIntoConstraints                                            = false
        teachingDescriptionLabel.topAnchor.constraint(equalTo: teachingLabel.bottomAnchor, constant: 20).isActive     = true
        teachingDescriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive    = true
        teachingDescriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
    }

    // ---------------------------------------------
    
    /*
     *  Create Apply Label
     */
    
    func createApplyLabel(){
        
        // Create Apply Label
        
        self.applyLabel          = UILabel()
        applyLabel.text          = "Uygulayalım"
        applyLabel.font          = UIFont.systemFont(ofSize: 25, weight: .bold)
        applyLabel.textColor     = UIColor.black
        applyLabel.textAlignment = .center
        
        self.view.addSubview(applyLabel)
        
        // Apply Label Constraints
        
        applyLabel.translatesAutoresizingMaskIntoConstraints                                                   = false
        applyLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive           = true
        applyLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive        = true
        applyLabel.topAnchor.constraint(equalTo: teachingDescriptionLabel.bottomAnchor, constant: 50).isActive = true
        
        // Create Tick Button
        
        self.applyTickButton          = UIButton()
        applyTickButton.isEnabled     = true
        applyTickButton.layer.opacity = 0.2
        applyTickButton.tag           = 1
        
        applyTickButton.setImage(UIImage(named: "greenTick"), for: .normal)
        applyTickButton.addTarget(self, action: #selector(clickActive), for: .touchUpInside)
        
        self.view.addSubview(applyTickButton)
        
        applyTickButton.translatesAutoresizingMaskIntoConstraints                                            = false
        applyTickButton.widthAnchor.constraint(equalToConstant: 25).isActive                                 = true
        applyTickButton.heightAnchor.constraint(equalToConstant: 25).isActive                                = true
        applyTickButton.centerYAnchor.constraint(equalTo: applyLabel.centerYAnchor).isActive                 = true
        applyTickButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Apply Description Label
     */
    
    func createApplyDescriptionLabel(){
        
        // Create Apply Description Label
        
        self.applyDescriptionLabel          = UILabel()
        applyDescriptionLabel.text          = "Şimdi, bir sayının asal sayı olup olmadığını nasıl kontrol edebileceğimize birlikte bakalım. Örneğin, 7 sayısını ele alalım."

        applyDescriptionLabel.font          = UIFont.systemFont(ofSize: 15, weight: .medium)
        applyDescriptionLabel.textColor     = .black
        applyDescriptionLabel.numberOfLines = 0
        applyDescriptionLabel.textAlignment = .center
        
        self.view.addSubview(applyDescriptionLabel)
        
        // Apply Description Label Constraints
        
        applyDescriptionLabel.translatesAutoresizingMaskIntoConstraints                                              = false
        applyDescriptionLabel.topAnchor.constraint(equalTo: applyLabel.bottomAnchor, constant: 20).isActive          = true
        applyDescriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive      = true
        applyDescriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive   = true
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Check Label
     */
    
    func createCheckabel(){
        
        // Create Check Label
        
        self.checkLabel          = UILabel()
        checkLabel.text          = "Kontrol edelim"
        checkLabel.font          = UIFont.systemFont(ofSize: 25, weight: .bold)
        checkLabel.textColor     = UIColor.black
        checkLabel.textAlignment = .center
        
        self.view.addSubview(checkLabel)
        
        // Apply Label Constraints
        
        checkLabel.translatesAutoresizingMaskIntoConstraints                                                = false
        checkLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive        = true
        checkLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive     = true
        checkLabel.topAnchor.constraint(equalTo: applyDescriptionLabel.bottomAnchor, constant: 50).isActive = true
        
        // Create Tick Button
        
        self.checkTickButton          = UIButton()
        checkTickButton.isEnabled     = true
        checkTickButton.layer.opacity = 0.2
        checkTickButton.tag           = 2
        
        checkTickButton.setImage(UIImage(named: "greenTick"), for: .normal)
        checkTickButton.addTarget(self, action: #selector(clickActive), for: .touchUpInside)
        
        self.view.addSubview(checkTickButton)
        
        checkTickButton.translatesAutoresizingMaskIntoConstraints                                            = false
        checkTickButton.widthAnchor.constraint(equalToConstant: 25).isActive                                 = true
        checkTickButton.heightAnchor.constraint(equalToConstant: 25).isActive                                = true
        checkTickButton.centerYAnchor.constraint(equalTo: checkLabel.centerYAnchor).isActive                 = true
        checkTickButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Check Description Label
     */
    
    func createCheckDescriptionLabel(){
        
        // Create Apply Description Label
        
        self.chechDescriptionLabel          = UILabel()
        chechDescriptionLabel.text          = "7 sayısını 1 ve kendisiyle bölelim: \n 7 ÷ 1 = 7 \n 7 ÷ 7 = 1 \nSonuç olarak, 7 bir asal sayıdır, çünkü sadece 1 ve kendisiyle bölündüğünde kalan sıfır oluyor."
        chechDescriptionLabel.font          = UIFont.systemFont(ofSize: 15, weight: .medium)
        chechDescriptionLabel.textColor     = .black
        chechDescriptionLabel.numberOfLines = 0
        chechDescriptionLabel.textAlignment = .center
        
        self.view.addSubview(chechDescriptionLabel)
        
        // Apply Description Label Constraints
        
        chechDescriptionLabel.translatesAutoresizingMaskIntoConstraints                                              = false
        chechDescriptionLabel.topAnchor.constraint(equalTo: checkLabel.bottomAnchor, constant: 20).isActive          = true
        chechDescriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive      = true
        chechDescriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive   = true
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Next Button
     */
    
    func createNextButton(){
        
        self.nextButton               = UIButton()
        nextButton.layer.borderWidth  = 0.8
        nextButton.layer.borderColor  = UIColor.systemGray4.cgColor
        nextButton.layer.cornerRadius = 10
        nextButton.isEnabled          = false
        
        nextButton.setTitle("Örnek Çöz", for: .normal)
        nextButton.setTitleColor(UIColor.systemGray2, for: .normal)
        nextButton.addTarget(self, action: #selector(clickNext), for: .touchUpInside)
        
        self.view.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints                                            = false
        nextButton.heightAnchor.constraint(equalToConstant: 55).isActive                                = true
        nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive     = true
        nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive    = true
        nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
    }
    
    @objc func clickActive(_ sender: UIButton){
        
        self.tickCount += 1
        
        switch sender.tag{
            
        case 0:
            
            self.teachTickButton.layer.opacity = 1
            
        case 1:
            
            self.applyTickButton.layer.opacity = 1
            
        case 2:
            
            self.checkTickButton.layer.opacity = 1
            
        default:
            break
        }
        
        if tickCount == 3{
            
            self.nextButton.setTitleColor(UIColor.black, for: .normal)
            self.nextButton.layer.borderColor = UIColor.black.cgColor
            self.nextButton.isEnabled = true
            
        }
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Click Next
     */
    
    @objc func clickNext(){
        
        let vc = PrimeNumberViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)

    }


}
