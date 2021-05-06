//
//  MainViewController.swift
//  forca
//
//  Created by IFPB on 06/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var forca: Forca!
    @IBOutlet weak var lbTip: UILabel!
    @IBOutlet weak var lbAttempts: UILabel!
    @IBOutlet weak var lbSpaces: UILabel!
    @IBOutlet weak var lbUserLetters: UILabel!
    @IBOutlet weak var tfLetter: UITextField!
    @IBOutlet weak var ivForcaImage: UIImageView!
    
    @IBAction func btnPlay(_ sender: Any) {
        let letter = Character(self.tfLetter.text!)
        self.forca.play(letter: letter)
        
        if (self.forca.finished()) {
            let resultViewController = self.storyboard?.instantiateViewController(identifier: "result_view") as! ResultViewController
            
            resultViewController.result = self.forca.gameResult()
            resultViewController.word = self.forca.word
            
            self.present(resultViewController, animated: true, completion: nil)
            
            self.forca.startGame()
        }
        
        self.update()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.forca = Forca()
        self.update()
    }
    
    func update() {
        self.lbTip.text = self.forca.wordTip
        self.lbAttempts.text = "Tentativas restantes - \(self.forca.attempts)"
        
        self.lbSpaces.text = String(self.forca.spaces)
        self.lbUserLetters.text = String(self.forca.usedLetters)
        self.tfLetter.text = ""
        self.updateImage()
    }

    
    func updateImage() {
        switch self.forca.attempts {
        case 9:
            self.ivForcaImage.image = UIImage(named: "1")
        case 8:
            self.ivForcaImage.image = UIImage(named: "2")
        case 7:
            self.ivForcaImage.image = UIImage(named: "3")
        case 6:
            self.ivForcaImage.image = UIImage(named: "4")
        case 5:
            self.ivForcaImage.image = UIImage(named: "5")
        case 4:
            self.ivForcaImage.image = UIImage(named: "6")
        case 3:
            self.ivForcaImage.image = UIImage(named: "7")
        case 2:
            self.ivForcaImage.image = UIImage(named: "8")
        case 1:
            self.ivForcaImage.image = UIImage(named: "9")
        case 0:
            self.ivForcaImage.image = UIImage(named: "10")
        default:
            self.ivForcaImage.image = UIImage(named: "0")
        }
    }
    
}

