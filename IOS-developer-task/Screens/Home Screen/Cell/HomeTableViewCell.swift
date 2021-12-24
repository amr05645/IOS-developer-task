//
//  HomeTableViewCell.swift
//  IOS-developer-task
//
//  Created by Elsaadany on 24/12/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell, ReusableView {
    
    @IBOutlet weak var showImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var runTimeLbl: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    @IBOutlet weak var premieredLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}