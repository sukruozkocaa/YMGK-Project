//
//  PerfectSquareNumberWebViewController.swift
//  GamesApp
//
//  Created by Şükrü on 20.05.2023.
//

import UIKit
import WebKit

class PerfectSquareNumberWebViewController: UIViewController {

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
        
        let myURL     = URL(string: "https://orduodm.meb.gov.tr/meb_iys_dosyalar/2021_11/10114737_Karekoklu_Yfadeler_1.pdf")
        let myRequest = URLRequest(url: myURL!)
                            
        self.webView.load(myRequest)
        
    }

}
