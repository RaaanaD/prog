//
//  ProfileImageCell.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/04.
//

import UIKit
import SDWebImage

class ProfileImageCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var costLabel: UILabel!
    
    @IBOutlet weak var quickWordLabel: UILabel!
    
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var identityLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    static let identifire = "ProfileImageCell"
    
    static func nib()->UINib{
        
        return UINib(nibName: "ProfileImageCell", bundle: nil)
    }
    
    func configure(profileImageString:String,nameLabelString:String,costLabelString:String,quickWordLabelString:String,jobLabelString:String,identityLabelString:String,likeLabelString:String){
        
        profileImageView.sd_setImage(with: URL(string:profileImageString), completed: nil)
        nameLabel.text = nameLabelString
        costLabel.text = costLabelString
        quickWordLabel.text = quickWordLabelString
        jobLabel.text = jobLabelString
        identityLabel.text = identityLabelString
        likeLabel.text = likeLabelString
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = profileImageView.frame.width * 0.3
//        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        profileImageView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
