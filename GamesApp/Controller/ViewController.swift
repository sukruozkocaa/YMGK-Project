//
//  ViewController.swift
//  GamesApp
//
//  Created by Şükrü Özkoca on 3.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var numberArray = [10,12,18,22,25,36,45,56,63,71,83,90]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Initialize
        
        self.initialize()
        
    }

    /*
     *  Initialize
     */
    
    func initialize(){
        
        view.backgroundColor = .red
        
        // Create CollectionView

        self.createCollectionView()
        
    }
    
    /*
     *  Create CollectionView
     */
    
    func createCollectionView(){
        
        let layout     = UICollectionViewLayout()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        self.collectionView                 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = flowLayout
        
        collectionView.register(NumberCollectionViewCell.self, forCellWithReuseIdentifier: "Number")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints                                          = false
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive           = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive     = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive   = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return numberArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Number", for: indexPath) as! NumberCollectionViewCell
        
        cell.numberLabel.text = "\(numberArray[indexPath.row])"
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 80, height: 80)
        
    }
        
}

