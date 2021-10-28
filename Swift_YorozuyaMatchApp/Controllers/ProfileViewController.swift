//
//  ProfileViewController.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/04.()
//

import UIKit
import Firebase

class ProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,LikeSendDelegate,GetLikeConutProtcol {

    

    @IBOutlet weak var likeButton: UIButton!
    var userDataModel:UserDataModel?
    @IBOutlet weak var tableView: UITableView!
    var likeCount = Int()
    var likeFlag = Bool()
    var loadDBModel = LoadDBModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //＊＊自分で追加＊＊
//        UINib(nibName: "UICollectionElementKindCell", bundle:nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    tableView.register(ProfileImageCell.nib(), forCellReuseIdentifier: ProfileImageCell.identifire)
    tableView.register(ProfileTextCell.nib(), forCellReuseIdentifier: ProfileTextCell.identifire)
    tableView.register(ProfileDetailCell.nib(), forCellReuseIdentifier: ProfileDetailCell.identifire)
        
        
        // Do any additional setup after loading the view.
        
        loadDBModel.getLikeConutProtcol = self
        loadDBModel.loadLikeCount(uuid: (userDataModel?.uid)!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        let sendDBModel = SendDBModel()
        sendDBModel.sendAshiato(aitenoUserID: (userDataModel?.uid)!)
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileImageCell.identifire, for: indexPath) as! ProfileImageCell
            cell.configure(profileImageString: (userDataModel?.profileImageString)!, nameLabelString: (userDataModel?.name)!, costLabelString: (userDataModel?.cost)!, quickWordLabelString: (userDataModel?.quickWord)!,jobLabelString: (userDataModel?.job)!, identityLabelString: (userDataModel?.identity)!, likeLabelString: String(likeCount))
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTextCell.identifire, for: indexPath) as! ProfileTextCell

            cell.profileTextView.text = userDataModel?.profile

            return cell

        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileDetailCell.identifire, for: indexPath) as! ProfileDetailCell
            cell.configure(nameLabelString:  (userDataModel?.name)!, jobLabelString: (userDataModel?.job)!, identityLabelString: (userDataModel?.identity)!, preLabelString:  (userDataModel?.pre)!, meetLabelString: (userDataModel?.meet)!, customerLabelString: (userDataModel?.customer)!, costLabelString: (userDataModel?.cost)!)

            return cell
            
        default:
            return UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1{
            return 450
        }else if indexPath.row == 2{
            return 370
        }else if indexPath.row == 3{
            return 400
        }
        
        return 1
        
    }

    
    @IBAction func likeAction(_ sender: Any) {
        
        //もし自分のIDで無い場合
        if userDataModel?.uid != Auth.auth().currentUser?.uid{

            //Like
           let sendDBModel = SendDBModel()
            sendDBModel.likeSendDelegate = self

            if self.likeFlag == false{
            sendDBModel.sendTolike(likeFlag: true, thisUserID: (userDataModel?.uid)!)
                
        }else{
                sendDBModel.sendTolike(likeFlag: false, thisUserID: (userDataModel?.uid)!)
            }
                
        }
        
    }
    
    func like() {
        //ライクが押された時に呼ばれる
        //いいねするアニメーション()
        Util.startAnimation(name: "good", view: self.view)
    }
    
    func getLikeCount(likeCount: Int, likeFlag: Bool) {

        self.likeFlag = likeFlag
        self.likeCount = likeCount
        if self.likeFlag == false{
            likeButton.setImage(UIImage(named: "notLike"), for: .normal)
            
        }else{
            likeButton.setImage(UIImage(named: "like"), for: .normal)
            
        }
        
        tableView.reloadData()
    }
    
}
