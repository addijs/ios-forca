//
//  ResultViewController.swift
//  forca
//
//  Created by IFPB on 06/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result: String?
    var word: String?
    
    @IBOutlet weak var lbResultMessage: UILabel!
    @IBAction func btnReturn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.lbResultMessage.text = self.result
    }

}
