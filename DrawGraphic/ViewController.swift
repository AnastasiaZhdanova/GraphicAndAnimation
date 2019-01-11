//
//  ViewController.swift
//  DrawGraphic
//
//  Created by Anastasia Zhdanova on 1/11/19.
//  Copyright © 2019 Anastasia Zhdanova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var graphControler: GraphView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func repeatTap(_ sender: Any) {
         graphControler.setNeedsDisplay() //перезапуск draw
    }
}

