//
//  ViewController.swift
//  LPLinkPresenter
//
//  Created by hyeri kim on 17/10/2019.
//  Copyright © 2019 hyeri kim. All rights reserved.
//

import UIKit
import LinkPresentation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            let metadataProvider = LPMetadataProvider()
            let url = URL()
        } else {
            print("This device cannot support linkPresentation")
            // Fallback on earlier versions
        }
    
    }
}
