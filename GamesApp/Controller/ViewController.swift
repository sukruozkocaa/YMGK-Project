//
//  ViewController.swift
//  GamesApp
//
//  Created by Şükrü Özkoca on 3.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     *  Views
     */
    
    var collectionView : UICollectionView!
    var imageView      : UIImageView!
    var infoView       : UIView!
    var infoImageView  : UIImageView!
    var infoLabel      : UILabel!
    var pointLabel     : UILabel!
    
    var statusView                : UIView!
    var coefficientLabel          : UILabel!
    var perfectSquareNumberLabel  : UILabel!
    var primeNumberLabel          : UILabel!
    
    // ---------------------------------------------
    
    /*
     *  Vars
     */

    var numberArray : [Int] = []
    var point: Int  = 0

    // ---------------------------------------------
    
    /*
     *  View Did Load
     */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Initialize
        
        self.initialize()
        
    }

    /*
     *  Initialize
     */
    
    func initialize(){
        
        // Prepare Number Data
        
        self.prepareNumberData(completion: {
            
            // Create ImageView
            
            self.createImageView()
            
            // Create CollectionView

            self.createCollectionView()
            
            // Create Info View
            
            self.createInfoView()
            
            // Create Point Label
            
            self.createPointLabel()
            
            // Create Status View
            
            self.createStatusView()
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
     *  Create ImageView
     */
    
    func createImageView(){
        
        // Create ImageView
        
        self.imageView  = UIImageView()
        imageView.image = UIImage(named: "sea")
        
        self.view.addSubview(imageView)
        
        // ImageView Constraints
        
        imageView.translatesAutoresizingMaskIntoConstraints                                        = false
        imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive   = true
        imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        
    }
    
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
        collectionView.contentInset         = UIEdgeInsets(top: 50, left: 20, bottom: 0, right: 20)
        collectionView.isScrollEnabled      = false
        
        collectionView.register(NumberCollectionViewCell.self, forCellWithReuseIdentifier: "Number")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
        
        // CollectionView Constraints
        
        collectionView.translatesAutoresizingMaskIntoConstraints                                          = false
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: 0).isActive      = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive   = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Info View
     */
    
    func createInfoView(){
        
        // Create InfoView
        
        self.infoView                 = UIView(frame: CGRect(x: 10, y: 50, width: view.frame.width*0.9, height: 100))
        infoView.backgroundColor      = .clear
        infoView.layer.cornerRadius   = 15
        
        self.imageView.addSubview(infoView)
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView   = UIVisualEffectView(effect: blurEffect)
        blurView.frame = infoView.frame
        blurView.layer.cornerRadius = 15
        blurView.clipsToBounds = true
        
        infoView.addSubview(blurView)
        
        // ---------------------------------------------
        
        self.infoImageView  = UIImageView()
        infoImageView.image = UIImage(named: "information")
        
        infoView.addSubview(infoImageView)
        
        infoImageView.translatesAutoresizingMaskIntoConstraints                                        = false
        infoImageView.widthAnchor.constraint(equalToConstant: 50).isActive                             = true
        infoImageView.heightAnchor.constraint(equalToConstant: 50).isActive                            = true
        infoImageView.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 30).isActive         = true
        infoImageView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 30).isActive = true
        
        // ---------------------------------------------
        
        // Create Info Label
        
        self.infoLabel = UILabel()
        infoLabel.text = "Lütfen 9'un katı, asal sayı veya tam kare olan baloncukları bulunuz!"
        infoLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        infoLabel.textColor = UIColor.systemGray6
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        
        self.infoView.addSubview(infoLabel)
        
        infoLabel.translatesAutoresizingMaskIntoConstraints                                             = false
        infoLabel.topAnchor.constraint(equalTo: infoImageView.bottomAnchor, constant: 20).isActive      = true
        infoLabel.leadingAnchor.constraint(equalTo: self.infoView.leadingAnchor, constant: 20).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: self.infoView.trailingAnchor, constant: 0).isActive = true
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Point Label
     */
    
    func createPointLabel(){
        
        // Create Point Label
        
        self.pointLabel = UILabel()
        pointLabel.text = "Puanınız: \(String(describing: self.point))"
        pointLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        pointLabel.textColor = UIColor.white
        
        self.imageView.addSubview(pointLabel)
        
        // Point Label Constraints
        
        pointLabel.translatesAutoresizingMaskIntoConstraints                                                 = false
        pointLabel.topAnchor.constraint(equalTo: self.imageView.topAnchor, constant: 50).isActive            = true
        pointLabel.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: -30).isActive = true
        
    }
    
    // ---------------------------------------------
    
    /*
     *  Create Status View
     */
    
    func createStatusView(){
        
        // Create Status View
        
        self.statusView               = UIView()
        statusView.backgroundColor    = .systemGray4
        statusView.layer.cornerRadius = 15
        statusView.layer.borderWidth  = 4
        statusView.layer.borderColor  = UIColor.clear.cgColor
        statusView.layer.opacity      = 0
        
        self.imageView.addSubview(statusView)
        
        // Status View Constraints
        
        statusView.translatesAutoresizingMaskIntoConstraints                                                 = false
        statusView.heightAnchor.constraint(equalToConstant: 100).isActive                                    = true
        statusView.topAnchor.constraint(equalTo: self.imageView.topAnchor, constant: 250).isActive           = true
        statusView.leadingAnchor.constraint(equalTo: self.imageView.leadingAnchor, constant: 20).isActive    = true
        statusView.trailingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: -20).isActive = true
        
        // Create Coefficient Label
        
        self.coefficientLabel = UILabel()
        coefficientLabel.text = ""
        coefficientLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        coefficientLabel.textColor = UIColor.white
        coefficientLabel.textAlignment = .center
        
        self.statusView.addSubview(coefficientLabel)
        
        // Coefficient Label Constraints
        
        coefficientLabel.translatesAutoresizingMaskIntoConstraints                                             = false
        coefficientLabel.topAnchor.constraint(equalTo: statusView.topAnchor, constant: 10).isActive            = true
        coefficientLabel.leadingAnchor.constraint(equalTo: statusView.leadingAnchor, constant: 10).isActive    = true
        coefficientLabel.trailingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: -10).isActive = true
        
        // Create Perfect Square Number Label
        
        self.perfectSquareNumberLabel = UILabel()
        perfectSquareNumberLabel.text = ""
        perfectSquareNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        perfectSquareNumberLabel.textColor = UIColor.white
        perfectSquareNumberLabel.textAlignment = .center
        
        self.statusView.addSubview(perfectSquareNumberLabel)
        
        perfectSquareNumberLabel.translatesAutoresizingMaskIntoConstraints                                             = false
        perfectSquareNumberLabel.centerYAnchor.constraint(equalTo: statusView.centerYAnchor).isActive                  = true
        perfectSquareNumberLabel.leadingAnchor.constraint(equalTo: statusView.leadingAnchor, constant: 10).isActive    = true
        perfectSquareNumberLabel.trailingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: -10).isActive = true

        // Create Prime Number Label
        
        self.primeNumberLabel = UILabel()
        primeNumberLabel.text = ""
        primeNumberLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        primeNumberLabel.textColor = UIColor.white
        primeNumberLabel.textAlignment = .center
        
        self.statusView.addSubview(primeNumberLabel)
        
        primeNumberLabel.translatesAutoresizingMaskIntoConstraints                                             = false
        primeNumberLabel.bottomAnchor.constraint(equalTo: statusView.bottomAnchor, constant: -10).isActive     = true
        primeNumberLabel.leadingAnchor.constraint(equalTo: statusView.leadingAnchor, constant: 10).isActive    = true
        primeNumberLabel.trailingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: -10).isActive = true
        
    }
    
    func isPrime(number: Int) -> Bool {
        
        if number <= 1 {
            return false
        }
        
        if number <= 3 {
            return true
        }
        
        if number % 2 == 0 || number % 3 == 0 {
            return false
        }
        
        var i = 5
        
        while i * i <= number {
            if number % i == 0 || number % (i + 2) == 0 {
                return false
            }
            
            i += 6
        }
        
        return true
    }
    
    func isPerfectSquare(number: Int) -> Bool {
        
        let squareRoot = Int(Double(number).squareRoot())
        return squareRoot * squareRoot == number
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                   
        
        UIView.animate(withDuration: 0.5) {
            
            self.statusView.layer.opacity = 1
            
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as? NumberCollectionViewCell
        
        cell?.isUserInteractionEnabled = false
        
        if numberArray[indexPath.row] % 9 == 0 {
            
            self.coefficientLabel.text = "\(numberArray[indexPath.row]) sayısı 9'un katıdır : \(numberArray[indexPath.row]) % 9 = 0"
            self.coefficientLabel.textColor = UIColor.systemGreen
            
            self.point += numberArray[indexPath.row]
            self.pointLabel.text = "Puan : \(String(describing: point))"
            
        }else {
            
            self.coefficientLabel.text = "\(numberArray[indexPath.row]) sayısı 9'un katı değildir : \(numberArray[indexPath.row]) % 9 != 0"
            self.coefficientLabel.textColor = UIColor.red
            
        }
        
        if self.isPrime(number: numberArray[indexPath.row]) {
            
            self.primeNumberLabel.text = "\(numberArray[indexPath.row]) sayısı asal sayıdır"
            self.primeNumberLabel.textColor = UIColor.systemGreen
        
            self.point += numberArray[indexPath.row]
            self.pointLabel.text = "Puan : \(String(describing: point))"
            
            
        }else {
            
            self.primeNumberLabel.text = "\(numberArray[indexPath.row]) sayısı asal sayı değildir"
            self.primeNumberLabel.textColor = UIColor.red
            
        }
        
        if self.isPerfectSquare(number: numberArray[indexPath.row]){
            
            self.perfectSquareNumberLabel.text = "\(numberArray[indexPath.row]) sayısı tam karedir"
            self.perfectSquareNumberLabel.textColor = UIColor.systemGreen
            
            self.point += numberArray[indexPath.row]
            self.pointLabel.text = "Puan : \(String(describing: point))"
            
        }else {
            
            self.perfectSquareNumberLabel.text = "\(numberArray[indexPath.row]) sayısı tam kare değildir"
            self.perfectSquareNumberLabel.textColor = UIColor.red

    
        }
        
        if primeNumberLabel.textColor == .systemGreen || perfectSquareNumberLabel.textColor == .systemGreen || coefficientLabel.textColor == .systemGreen {
            
            self.statusView.layer.borderColor = UIColor.systemGreen.cgColor
            
            cell?.numberView.isHidden = true
            
        }else {
            
            self.statusView.layer.borderColor = UIColor.red.cgColor
            cell?.numberView.layer.borderWidth = 1
            cell?.numberView.layer.borderColor = UIColor.systemRed.cgColor
            cell?.numberView.isHidden = false
            
        }
        

    }
        
}

