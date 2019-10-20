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
    
    @IBOutlet weak var tableView: UITableView!
    var metaData = LPLinkMetadata() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            let metadataProvider = LPMetadataProvider()
            guard let url = URL(string: "https://github.com/kimhyeri") else { return }
            metadataProvider.startFetchingMetadata(for: url) { (metadata, error) in
                guard let data = metadata, error != nil else { 
                    return 
                }
                self.metaData = data
            }
        } else {
            print("This device cannot support linkPresentation")
            // Fallback on earlier versions
        }
    
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? RichTableViewCell else { 
            return UITableViewCell()
        }
        cell.titleLabel.text = metaData.title
        return cell
    }
}
