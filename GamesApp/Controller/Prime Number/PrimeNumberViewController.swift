//
//  PrimeNumberViewController.swift
//  GamesApp
//
//  Created by Şükrü on 20.05.2023.
//

import UIKit

class PrimeNumberViewController: UIViewController {

    /*
     *  Vars
     */
    
    var numberArray : [Int] = []
    var trueCount   = 0
    var falseCount  = 0
    
    // ---------------------------------------------
    
    /*
     *  Views
     */
    
    var titleLabel     : UILabel!
    var truePointLabel : UILabel!
    var falsePointLabel: UILabel!
    var teachButton    : UIButton!
    var nextButton     : UIButton!
    
    var collectionView : UICollectionView!
    
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
        
        self.view.backgroundColor = UIColor.white
        
        // Prepare Number Data
        
        self.prepareNumberData(completion: {
            
            // Create Next Button
            
            self.createNextButton()
            
            // Create Teach Button
            
            self.createTeachButton()
            
            // Create Title Label
            
            self.createTitleLabel()
            
            // Create Points Label
            
            self.createPointsLabel()
            
            // Create CollectionView
            
            self.createCollectionView()
            
        })
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Prepare Number Data
     */
    
    func prepareNumberData(completion: (() -> Void)? = nil){
        
        for _ in 0...11{
            
            let randomInt = Int.random(in: 0..<100)

            self.numberArray.append(randomInt)
            
        }
        
        completion?()
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Title Label
     */
    
    func createTitleLabel(){
        
        // Create Title Label
        
        self.titleLabel          = UILabel()
        titleLabel.text          = "Asal sayıları seçiniz!"
        titleLabel.font          = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor     = .black
        titleLabel.textAlignment = .center
        
        self.view.addSubview(titleLabel)
        
        // Title Label Constraints
        
        titleLabel.translatesAutoresizingMaskIntoConstraints                                            = false
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 180).isActive           = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive    = true
        titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Points Label
     */
    
    func createPointsLabel(){
        
        // Create True Points Label
        
        self.truePointLabel = UILabel()
        truePointLabel.text = "0 Doğru"
        truePointLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        truePointLabel.textColor = UIColor.systemGreen
        
        self.view.addSubview(truePointLabel)
        
        // True Points Label Constraints
        
        truePointLabel.translatesAutoresizingMaskIntoConstraints                                          = false
        truePointLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
        truePointLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 50).isActive = true
        
        // Create False Points Label
        
        self.falsePointLabel = UILabel()
        falsePointLabel.text = "0 Yanlış"
        falsePointLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        falsePointLabel.textColor = UIColor.systemRed
        
        self.view.addSubview(falsePointLabel)
        
        // True Points Label Constraints
        
        falsePointLabel.translatesAutoresizingMaskIntoConstraints                                             = false
        falsePointLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100).isActive = true
        falsePointLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 50).isActive    = true
        
    }

    // ---------------------------------------------
    
    /*
     *  Create CollectionView
     */
    
    func createCollectionView(){
        
        // Create CollectionView
        
        let layout     = UICollectionViewLayout()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        self.collectionView                 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundColor      = .clear
        collectionView.contentInset         = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        collectionView.register(NumberCollectionViewCell.self, forCellWithReuseIdentifier: "Number")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
        
        // CollectionView Constraints
        
        collectionView.translatesAutoresizingMaskIntoConstraints                                           = false
       // collectionView.heightAnchor.constraint(equalToConstant: 300).isActive                              = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive    = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive  = true
        collectionView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 100).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.teachButton.topAnchor, constant: -20).isActive = true
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Next Button
     */
    
    func createNextButton(){
        
        self.nextButton               = UIButton()
        nextButton.titleLabel?.font   = UIFont.systemFont(ofSize: 15, weight: .bold)
        nextButton.layer.borderWidth  = 1
        nextButton.layer.borderColor  = UIColor.orange.cgColor
        nextButton.layer.cornerRadius = 8
        nextButton.tag                = 1
        
        nextButton.setTitleColor(UIColor.black, for: .normal)
        nextButton.setTitle("Genel teste başla!", for: .normal)
        nextButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        
        self.view.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints                                            = false
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive                                = true
        nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive    = true
        nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive     = true
    }
   
    // ---------------------------------------------
    
    /*
     *  Create Teach Button
     */
    
    func createTeachButton(){
        
        self.teachButton               = UIButton()
        teachButton.titleLabel?.font   = UIFont.systemFont(ofSize: 15, weight: .bold)
        teachButton.layer.borderWidth  = 1
        teachButton.layer.borderColor  = UIColor.orange.cgColor
        teachButton.layer.cornerRadius = 8
        teachButton.tag                = 0
        
        teachButton.setTitleColor(UIColor.black, for: .normal)
        teachButton.setTitle("Detaylı öğren", for: .normal)
        teachButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        
        self.view.addSubview(teachButton)
        
        teachButton.translatesAutoresizingMaskIntoConstraints                                            = false
        teachButton.heightAnchor.constraint(equalToConstant: 50).isActive                                = true
        teachButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive    = true
        teachButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        teachButton.bottomAnchor.constraint(equalTo: self.nextButton.topAnchor, constant: -20).isActive  = true
        
    }
    
    @objc func clickButton(_ sender: UIButton){
        
        if sender.tag == 0{
            
            let vc = PrimeNumberWebViewController()
            
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        } else {
            
            let vc = ViewController()
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    func isPrime(_ number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        
        if number <= 3 {
            return true
        }
        
        var i = 2
        
        while i * i <= number {
            if number % i == 0 {
                return false
            }
            i += 1
        }
        
        return true
    }
    
}

extension PrimeNumberViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // Number Of Items In Section
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return numberArray.count
        
    }
    
    // Cell For Item At
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Number", for: indexPath) as! NumberCollectionViewCell
        
        cell.numberLabel.text = "\(numberArray[indexPath.row])"
        
        return cell
        
    }
    
    // Size For Item At
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 80, height: 80)
        
    }
    
    // Did Select Item
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? NumberCollectionViewCell
        
        let isPrime = self.isPrime(self.numberArray[indexPath.row])
        
        if isPrime == true{
            
            self.trueCount += 1
            self.truePointLabel.text         = "\(trueCount) Doğru"
            cell?.numberView.backgroundColor = .systemGreen
            cell?.isUserInteractionEnabled   = false
            
        }else {
            
            self.falseCount += 1
            self.falsePointLabel.text        = "\(falseCount) Yanlış"
            cell?.numberView.backgroundColor = .systemRed
            cell?.isUserInteractionEnabled   = false
                        
        }
        
    }
        
}

