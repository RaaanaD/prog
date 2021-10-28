//
//  LikeListViewController.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/16.
//

import UIKit

class LikeListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,GetLikeDataProtocol,GetWhoisMatchListProtocol {
    
    

    @IBOutlet weak var tableView: UITableView!
    var userDataModelArray = [UserDataModel]()
    var userData = [String:Any]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LikeProfileCell.nib(), forCellReuseIdentifier: LikeProfileCell.identifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        let loadDBModel = LoadDBModel()
        loadDBModel.getLikeDataProtocol = self
        //10/2追記
        loadDBModel.getWhoisMatchListProtocol = self
        //likeに入っている人たちの情報を取得しセル表示
        loadDBModel.loadLikeList()
        //10/2追記
        loadDBModel.loadMatchingPersonData()
        userData = KeyChainConfig.getKeyArrayData(key: "userData")
        tableView.reloadData()
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userDataModelArray.count
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LikeProfileCell.identifier, for: indexPath)as! LikeProfileCell
        
        cell.configure(customerLabelString: userDataModelArray[indexPath.row].customer!, nameLabelString: userDataModelArray[indexPath.row].name!, jobLabelString: userDataModelArray[indexPath.row].job!, identityLabelString: userDataModelArray[indexPath.row].identity!, preLabelString: userDataModelArray[indexPath.row].pre!, meetLabelString: userDataModelArray[indexPath.row].meet!, costLabelString: userDataModelArray[indexPath.row].cost!, quickWordLabelString: userDataModelArray[indexPath.row].quickWord!, profileImageViewString: userDataModelArray[indexPath.row].profileImageString!, uid: userDataModelArray[indexPath.row].uid!, userData: userData)
        
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    func getLikeDataProtocol(userDataModelArray: [UserDataModel]) {
        self.userDataModelArray = []
        self.userDataModelArray = userDataModelArray
        tableView.reloadData()
        
    }
    
    //10/2追記　マッチングの人たち
    func getWhoisMatchListProtocol(userDataModelArray: [UserDataModel]) {
        
        var count = 0
        //indexNumberが入る
        var matchArray = [Int]()
        
        //もし今の配列に同じ要素があればその要素を配列から消去
        for i in 0..<userDataModelArray.count{
            if (self.userDataModelArray.firstIndex(where: {$0.uid == userDataModelArray[i].uid}) != nil) {
                matchArray.append(i)
            }
        }
        
        for i in 0..<matchArray.count{
            self.userDataModelArray.remove(at: matchArray[i] - count)
            count += 1
            
        }
        
        print(self.userDataModelArray.count)
        print(self.userDataModelArray.debugDescription)
        
        self.tableView.reloadData()
        
    }
    

}
