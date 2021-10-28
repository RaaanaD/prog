//
//  HumansViewController.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/03.
//

import UIKit
import Firebase
import SDWebImage

class HumansViewController: UIViewController,GetProfileDataProtocol,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,GetLikeDataProtocol {
    

  
    
    @IBOutlet weak var ashiatoButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchORNot = Bool()
    
    let sectionInsets = UIEdgeInsets(top: 10.0, left: 2.0, bottom: 2.0, right: 2.0)
    
    let itemsPerRow:CGFloat = 2
    var userDataModelArray = [UserDataModel]()
    
    //追記9・24
    var db = Firestore.firestore()
    
    var loadshitaLikeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Util.rectButton2(button: searchButton)
        Util.rectButton2(button: ashiatoButton)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(viewWillEnterForeground(_:)), name: UIScene.willEnterForegroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground(_:)), name: UIScene.didEnterBackgroundNotification, object: nil)
        
        
        if Auth.auth().currentUser?.uid != nil && searchORNot == false{
            
            collectionView.delegate = self
            collectionView.dataSource = self
            
            //自分のユーザデータを取り出す
            let userData = KeyChainConfig.getKeyArrayData(key: "userData")
//            print(userData["customer"])
            
            //受信します
            let loadDBModel = LoadDBModel()
            loadDBModel.getProfileDataProtocol = self
            //10/2記載
            loadDBModel.getLikeDataProtocol = self
            loadDBModel.loadUsersProfile(customer: userData["customer"] as! String)

            //10/2記載
            loadDBModel.loadLikeList()
            
            //追記9月23日 ★アプリ立ち上がったら記載！？
            self.db.collection("Users").document(Auth.auth().currentUser!.uid).collection("matching").document(Auth.auth().currentUser!.uid).setData(
                
                ["customer":userData["customer"] as Any,"uid":userData["uid"] as Any,"name":userData["name"] as Any,"cost":userData["cost"] as Any,"pre":userData["pre"] as Any,"job":userData["job"] as Any,"identity":userData["identity"] as Any,"profile":userData["profile"] as Any,"profileImageString":userData["profileImageString"] as Any,"quickWord":userData["quickWord"] as Any,"meet":userData["meet"] as Any]
            )
            //追記9月23日　★アプリ立ち上がったら記載！？
            loadDBModel.loadMatchingPersonData()
            
        }else if Auth.auth().currentUser?.uid != nil && searchORNot == true{
            
            //検索から返ってきたので、ロードする必要がない
            collectionView.reloadData()
            
        }else{
            performSegue(withIdentifier: "inputVC", sender: nil)

        }
    }
    
    @objc func viewWillEnterForeground(_ notification:Notification?){
        
        //ステータスを更新
        Util.updateOnlineStatus(onlineORNot: false)
    }
    
    @objc func didEnterBackground(_ notification:Notification?){
        
        //ステータスを更新
    }
    
    
    func getProfileData(userDataModelArray: [UserDataModel]) {
        
        var deleteArray = [Int]()
        var count = 0
        
        //いいねした人は表示しない
        loadshitaLikeArray = []
        self.userDataModelArray = userDataModelArray
        loadshitaLikeArray = KeyChainConfig.getKeyArrayListData(key: "ownLikeList")
        
        for i in 0..<self.userDataModelArray.count{
            
            if loadshitaLikeArray.contains(self.userDataModelArray[i].uid!) == true{
                
                deleteArray.append(i)
                
            }
            
        }
        
        for i in 0..<deleteArray.count{
            
            print(deleteArray.count,i)
            print(self.userDataModelArray.count)
            print(deleteArray.debugDescription)
            print(count)
            print(deleteArray[i] - count)
            
            self.userDataModelArray.remove(at: deleteArray[i] - count)
            count += 1
            
        }
        
        collectionView.reloadData()

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return userDataModelArray.count
    
    }
    
    //スクリーンのサイズに応じたセルのサイズ変換
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        print((itemsPerRow + 1) * sectionInsets.left)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem + 42)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
        
    }
    
    //セルの行間
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        //セルと構築、返す
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        //セルに効果　ex.影など
        //★10/2 以下はコメントアウトしなくてもok
//        cell.layer.cornerRadius = cell.frame.width * 0.3
//        cell.layer.cornerRadius = cell.frame.width/2
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = true
        
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.sd_setImage(with: URL(string: userDataModelArray[indexPath.row].profileImageString!), completed: nil)
        imageView.layer.cornerRadius = imageView.frame.width * 0.3
//        imageView.layer.cornerRadius = imageView.frame.width/2
        
        let quickWordLabel = cell.contentView.viewWithTag(2)as! UILabel
        quickWordLabel.text = userDataModelArray[indexPath.row].quickWord
        
        let onLineMarkImageView = cell.contentView.viewWithTag(3) as! UIImageView
        onLineMarkImageView.layer.cornerRadius = onLineMarkImageView.frame.width/2
        
        if userDataModelArray[indexPath.row].onlineORNot == true{
            
            onLineMarkImageView.image = UIImage(named: "online")
        }else{
            onLineMarkImageView.image = UIImage(named: "offLine")
        }
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let profileVC = self.storyboard?.instantiateViewController(identifier: "profileVC") as! ProfileViewController
        profileVC.userDataModel = userDataModelArray[indexPath.row]
        self.navigationController?.pushViewController(profileVC, animated: true)
        
        
    }
    
    
    @IBAction func search(_ sender: Any) {
        
        performSegue(withIdentifier: "searchVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "searchVC"{
            
            let userData = KeyChainConfig.getKeyArrayData(key: "userData")
            
            //遷移先のControllerを取得
            let searchVC = segue.destination as? SearchViewController
            searchVC?.userData = userData["customer"] as! String
            
            
            //遷移先のpropertyに処理ごと渡す
            searchVC?.resultHandler = { userDataModelArray,searchDone in
                
                self.searchORNot = searchDone
                self.userDataModelArray = userDataModelArray
                self.collectionView.reloadData()
                
            }
            
            
        }
        
    }
    
    //10/2追記 自分にLikeした人をとってくる
    func getLikeDataProtocol(userDataModelArray: [UserDataModel]) {
        var count = 0
        
        //indexNumberが入る
        var likeArray = [Int]()
        
        //もし今の配列に同じ要素があればその要素を配列から消去
        for i in 0..<userDataModelArray.count{
            if self.userDataModelArray.contains(userDataModelArray[i]) == true{
                
                likeArray.append(i)
            }
            
        }
        
        for i in 0..<likeArray.count{
            self.userDataModelArray.remove(at: likeArray[i] - count)
            count += 1
        }
        
        print(self.userDataModelArray.count)
        print(self.userDataModelArray.debugDescription)
        
        self.collectionView.reloadData()
    }
    
}
