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
    
    private var metaData: LPLinkMetadata = LPLinkMetadata() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchURLPreview()
    }
    
    private func fetchURLPreview() {
        // #available(iOS 13.0, *)
        
        let metadataProvider = LPMetadataProvider()
        guard let urlString = URLs.recipesArray.first, let url = URL(string: urlString) else { 
            return 
        }
        
        metadataProvider.startFetchingMetadata(for: url) { (metadata, error) in
            guard let data = metadata, error == nil else { 
                return 
            }
            self.metaData = data
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
        
        let linkView = LPLinkView(metadata: metaData)
        cell.richView.addSubview(linkView)
        linkView.frame.size = cell.richView.frame.size    
        linkView.sizeToFit()
        
        return cell
    }
}
