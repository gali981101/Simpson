//
//  detailsVC.swift
//  SimpsonBook
//
//  Created by Terry Jason on 2023/7/24.
//

import UIKit

class detailsVC: UIViewController {
    
    var selectedSimpson : Simpson?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedSimpson?.image
        nameLabel.text  = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
    }
    
}
