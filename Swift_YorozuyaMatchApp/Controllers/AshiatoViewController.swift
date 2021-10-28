//
//  AshiatoViewController.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/19.
//

import UIKit

class AshiatoViewController: MatchListViewController,GetAshiatoDataProtocol {

    var loadDBModel = LoadDBModel()
    var userDataModelArray = [UserDataModel]()
    
    //override=上書き
    override func viewDidLoad() {
        super.viewDidLoad()
//追加の機能
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = false
        //足あとをロードする
        loadDBModel.getAshiatoDataProtocol = self
        loadDBModel.loadAshiatoData()
        
        tableView.register(MatchPersonCell.nib(), forCellReuseIdentifier: MatchPersonCell.identifier)
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userDataModelArray.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchPersonCell.identifier, for: indexPath) as? MatchPersonCell
        cell?.configure(nameLabelString: userDataModelArray[indexPath.row].name!, jobLabelString: userDataModelArray[indexPath.row].job!, quickWordLabelString: userDataModelArray[indexPath.row].quickWord!, profileImageViewString: userDataModelArray[indexPath.row].profileImageString!)
    
        return cell!
     
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileVC = self.storyboard?.instantiateViewController(identifier: "profileVC2") as! ProfileViewController
        profileVC.userDataModel = userDataModelArray[indexPath.row]
        self.navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
    
    
    func getAshiatoDataProtocol(userDataModelArray: [UserDataModel]) {
        
        self.userDataModelArray = userDataModelArray
        tableView.reloadData()
        
    }
    
}
