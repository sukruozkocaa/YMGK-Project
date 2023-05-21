//
//  PrimeNumberWebViewController.swift
//  GamesApp
//
//  Created by Şükrü on 20.05.2023.
//

import UIKit
import WebKit

class PrimeNumberWebViewController: UIViewController {

    /*
     *  Views
     */
    
    var webView: WKWebView!
    
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
        
        // Create WebView
        
        self.createWKWebView()
        
    }
    
    func createWKWebView(){
        
        self.webView = WKWebView(frame: self.view.frame)
        
        self.view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints                                        = false
        webView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive   = true
        webView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        
        let myURL     = URL(string: "https://matematikdelisi.com/Orta/Sinif8/Konu/Asal/Asal_Sayi_mi_Cozumlu_Ornekler.html")
        let myRequest = URLRequest(url: myURL!)
                            
        self.webView.load(myRequest)
        
    }

}
