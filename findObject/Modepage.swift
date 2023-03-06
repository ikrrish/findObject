//
//  Modepage.swift
//  findObject
//
//  Created by R82 on 28/02/23.
//

import UIKit

class Modepage: UIViewController {

    
  
    @IBOutlet weak var labelOfEasy: UIButton!
    @IBOutlet weak var labelOfMedium: UIButton!
    @IBOutlet weak var labelOfHard: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
    }
    
    @IBAction func easyButton(_ sender: UIButton){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "GamePage") as! GamePage
        navigate.freq = 0.06
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    @IBAction func mediumButton(_ sender: UIButton){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "GamePage") as! GamePage
        navigate.freq = 0.03
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    @IBAction func hardButton(_ sender: UIButton){
        let navigate = storyboard?.instantiateViewController(withIdentifier: "GamePage") as! GamePage
        navigate.freq = 0.02
        
        navigationController?.pushViewController(navigate, animated: true)
    }
    

    
    
}
