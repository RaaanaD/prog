//
//  MatchPersonCell.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/18.
//

import UIKit

class MatchPersonCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var quickWordLabel: UILabel!
    
    static let identifier = "MatchPersonCell"
    
    static func nib()->UINib{
        
        return UINib(nibName: "MatchPersonCell", bundle: nil)
    }
    
    func configure(nameLabelString:String,jobLabelString:String, quickWordLabelString:String,profileImageViewString:String){
        
        userNameLabel.text = nameLabelString
        jobLabel.text = jobLabelString
        quickWordLabel.text = quickWordLabelString
        profileImageView.sd_setImage(with: URL(string: profileImageViewString), completed: nil)
    
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width * 0.3
//        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
