//
//  ViewController.swift
//  findObject
//
//  Created by R82 on 28/02/23.
//
import SwiftUI

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressField: UIProgressView!
    var time = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        progressField.progress = 0.0
        progressField.isHidden = true
            
     
      
    }
    
    func progressView(){
        var a = 0.0
        
        time = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true, block: { i in
            a += 0.02
            self.progressField.progress = Float(a)
            if self.progressField.progress == 1.0{
                self.progressField.progress = 0.0
                self.navigation()
                self.time.invalidate()
            }
        })
    }
    
    func navigation(){
        let navigateToModePage = storyboard?.instantiateViewController(withIdentifier: "Modepage") as! Modepage
        navigationController?.pushViewController(navigateToModePage, animated: true)
    }
    
    @IBAction func playButton(_ sender: UIButton){
        progressField.isHidden = false
        progressView()
    }


}
