//
//  MatchListViewController.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/18.
//

import UIKit
import Firebase

class MatchListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,GetWhoisMatchListProtocol {
    

    var tableView = UITableView()
    var matchingArray = [UserDataModel]()
    var userData = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MatchPersonCell.nib(), forCellReuseIdentifier: MatchPersonCell.identifier)
        
        
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //マッチングしている人のデータを取得
        let loadDBModel = LoadDBModel()
        loadDBModel.getWhoisMatchListProtocol = self
        loadDBModel.loadMatchingPersonData()
        userData = KeyChainConfig.getKeyArrayData(key: "userData")
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return matchingArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchPersonCell.identifier, for: indexPath) as! MatchPersonCell
        cell.configure(nameLabelString: matchingArray[indexPath.row].name!, jobLabelString: matchingArray[indexPath.row].job!, quickWordLabelString: matchingArray[indexPath.row].quickWord!, profileImageViewString: matchingArray[indexPath.row].profileImageString!)
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let chatVC = self.storyboard?.instantiateViewController(identifier: "chatVC") as! ChatViewController
        chatVC.userDataModel = matchingArray[indexPath.row]
        chatVC.userData = userData
        self.navigationController?.pushViewController(chatVC, animated: true)
        
    }
    
    
    func getWhoisMatchListProtocol(userDataModelArray: [UserDataModel]) {
        
        matchingArray = userDataModelArray
        tableView.reloadData()
        
    }

}
