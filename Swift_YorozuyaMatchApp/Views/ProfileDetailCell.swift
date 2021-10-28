//
//  ProfileDetailCell.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/05.
//

import UIKit

class ProfileDetailCell: UITableViewCell {

    @IBOutlet weak var customerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var identityLabel: UILabel!
    @IBOutlet weak var preLabel: UILabel!
    @IBOutlet weak var meetLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    
    static let identifire = "ProfileDetailCell"
    
    static func nib()->UINib{
        
        return UINib(nibName: "ProfileDetailCell", bundle: nil)
    }
    
    func configure(nameLabelString:String,jobLabelString:String,identityLabelString:String, preLabelString:String,meetLabelString:String,customerLabelString:String,costLabelString:String){
        
        nameLabel.text = nameLabelString
        jobLabel.text = jobLabelString
        identityLabel.text = identityLabelString
        preLabel.text = preLabelString
        meetLabel.text = meetLabelString
        customerLabel.text = customerLabelString
        costLabel.text = costLabelString
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
