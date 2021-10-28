//
//  LaodDBModel.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/03.
//

import Foundation
import Firebase

protocol GetProfileDataProtocol {
    
    func getProfileData(userDataModelArray:[UserDataModel])
    
}

protocol GetLikeConutProtcol {
    func getLikeCount(likeCount:Int,likeFlag:Bool)

}

protocol GetLikeDataProtocol {
    func getLikeDataProtocol(userDataModelArray:[UserDataModel])
}

protocol GetWhoisMatchListProtocol {
    func getWhoisMatchListProtocol(userDataModelArray:[UserDataModel])
}

protocol GetAshiatoDataProtocol {
    func getAshiatoDataProtocol(userDataModelArray:[UserDataModel])
}

protocol GetSearchResultProtocol {
    func getSearchResultProtocol(userDataModelArray:[UserDataModel],searchDone:Bool)
}


class LoadDBModel {
    
    var db = Firestore.firestore()
    var profileModelArray = [UserDataModel]()
    var getProfileDataProtocol:GetProfileDataProtocol?
    var getLikeConutProtcol:GetLikeConutProtcol?
    var getLikeDataProtocol:GetLikeDataProtocol?
    var getWhoisMatchListProtocol:GetWhoisMatchListProtocol?
    var getAshiatoDataProtocol:GetAshiatoDataProtocol?
    var getSearchResultProtocol:GetSearchResultProtocol?
    
    //9/23追加
    var matchingIDArray = [String]()
    
    //ユーザデータを受信する
    func loadUsersProfile(customer:String){
        
        //★10/1記載　もしいいねした人がいるならそれを飛ばす
        let ownLikeListArray = KeyChainConfig.getKeyArrayListData(key: "ownLikeList")
        
        db.collection("Users").whereField("customer", isNotEqualTo: customer).addSnapshotListener { snapShot, error in

            if error != nil{
                print(error.debugDescription)
                return
            }

            if let snapShotDoc = snapShot?.documents{

                self.profileModelArray = []
                for doc in snapShotDoc{
                    let data = doc.data()
                    //10/2追記
                    if ownLikeListArray.contains(data["uid"] as! String) != true{
                    
                    if let name = data["name"] as? String,let cost = data["cost"] as? String,let identity = data["identity"] as? String,let job = data["job"] as? String,let meet = data["meet"] as? String,let customer = data["customer"] as? String,let pre = data["pre"] as? String,let profile = data["profile"] as? String,let profileImageString = data["profileImageString"] as? String,let uid = data["uid"] as? String,let quickWord = data["quickWord"] as? String,let onlineORNot = data["onlineORNot"] as? Bool{

                        let userDataModel = UserDataModel(name: name, cost: cost, pre: pre, job: job, identity: identity, customer: customer, profile: profile, profileImageString: profileImageString, uid: uid, quickWord: quickWord, meet: meet, date: 0, onlineORNot: onlineORNot)
                        
//                        let userDataModel = UserDataModel(name: name, age: age, pre: pre, job: job, identity: identity, customer: customer, profile: profile, profileImageString: profileImageString, uid: uid, quickWord: quickWord, meet: meet, date: 0, onlineORNot: onlineORNot)

                       self.profileModelArray.append(userDataModel)

                }
                        
                }
                    
            }

                self.getProfileDataProtocol?.getProfileData(userDataModelArray: self.profileModelArray)
        }


    }

        
  }

//likeの数を取得するメソッド()()
    
    func loadLikeCount(uuid:String){

        var likeFlag = Bool()
        db.collection("Users").document(uuid).collection("like").addSnapshotListener
        { snapShot, error in

            if error != nil{
                return
            }

            if let snapShotDoc = snapShot?.documents{

                for doc in snapShotDoc{
                    let data = doc.data()
                    if doc.documentID == Auth.auth().currentUser?.uid{
                        if let like = data["like"] as? Bool{

                            likeFlag = like

                        }


                    }

                }

                let docCount = snapShotDoc.count
                self.getLikeConutProtcol?.getLikeCount(likeCount: docCount, likeFlag: likeFlag)


            }

        }
    }
    
    func loadLikeList(){
        
//        self.profileModelArray = []
        //★10/2追記 不要かも
        print(Auth.auth().currentUser?.uid)
        db.collection("Users").document(Auth.auth().currentUser!.uid).collection("like").addSnapshotListener { snapShot, error in

            if error != nil{
                print(error.debugDescription)
                return
            }

            if let snapShotDoc = snapShot?.documents{

                self.profileModelArray = []
                for doc in snapShotDoc{
                    let data = doc.data()
                    if let name = data["name"] as? String,let cost = data["cost"] as? String,let identity = data["identity"] as? String,let job = data["job"] as? String,let meet = data["meet"] as? String,let customer = data["customer"] as? String,let pre = data["pre"] as? String,let profile = data["profile"] as? String,let profileImageString = data["profileImageString"] as? String,let uid = data["uid"] as? String,let quickWord = data["quickWord"] as? String{

                        let userDataModel = UserDataModel(name: name, cost: cost, pre: pre, job: job, identity: identity, customer: customer, profile: profile, profileImageString: profileImageString, uid: uid, quickWord: quickWord, meet: meet, date: 0, onlineORNot: true)
                        
//                        let userDataModel = UserDataModel(name: name, age: age, pre: pre, job: job, identity: identity, customer: customer, profile: profile, profileImageString: profileImageString, uid: uid, quickWord: quickWord, meet: meet, date: 0, onlineORNot: onlineORNot)

                       self.profileModelArray.append(userDataModel)

                }
            }

            //
                self.getLikeDataProtocol?.getLikeDataProtocol(userDataModelArray: self.profileModelArray)
                
        }


      }
        
        
    }
    
  //matching以下のデータ（人）を取得する ★9/27Matching→matchingに直した！！
    func loadMatchingPersonData(){
        
        db.collection("Users").document(Auth.auth().currentUser!.uid).collection("matching").addSnapshotListener {
            snapShot, error in
            
            if error != nil{
                return
            }
            
            
            if let snapShotDoc = snapShot?.documents{
                
                self.profileModelArray = []
                for doc in snapShotDoc{
                    
                    let data = doc.data()
                    if let name = data["name"] as? String,let cost = data["cost"] as? String,let identity = data["identity"] as? String,let job = data["job"] as? String,let meet = data["meet"] as? String,let customer = data["customer"] as? String,let pre = data["pre"] as? String,let profile = data["profile"] as? String,let profileImageString = data["profileImageString"] as? String,let uid = data["uid"] as? String,let quickWord = data["quickWord"] as? String{
                        
                        //9/23追加 idを取得し比較、IDが無い場合はそのIDのnameでnotificationを出す
                        self.matchingIDArray = KeyChainConfig.getKeyArrayListData(key: "matchingID")
                        
                        //このIDを含んでいないなら
                        if self.matchingIDArray.contains(where: {$0 == uid}) == false{
                            
                            //9/24追記
                            if uid == Auth.auth().currentUser?.uid{
                                
                                self.db.collection("Users").document(Auth.auth().currentUser!.uid).collection("matching").document(Auth.auth().currentUser!.uid).delete()
                                
                            }else{
                            Util.matchiNotification(name: name, id: uid)
                                
                                //★9/26追記
                                self.db.collection("Users").document(Auth.auth().currentUser!.uid).collection("matching").document(Auth.auth().currentUser!.uid).delete()
                                
                            //idを取得し比較し、IDが無い場合はそのIDのnameでnotificationを出す
                            self.matchingIDArray.append(uid)
                            KeyChainConfig.setKeyArrayData(value: self.matchingIDArray, key: "matchingID")
                            }
                        }
                        
                        let userDataModel = UserDataModel(name: name, cost: cost, pre: pre, job: job, identity: identity, customer: customer, profile: profile, profileImageString: profileImageString, uid: uid, quickWord: quickWord, meet: meet, date: 0, onlineORNot: true)
                        self.profileModelArray.append(userDataModel)
                        
                        
                    }
                    
                }
                
                self.getWhoisMatchListProtocol?.getWhoisMatchListProtocol(userDataModelArray:self.profileModelArray)
                
                
            }
            
        
            
        }
    
    
    }

    func loadAshiatoData(){
        
        db.collection("Users").document(Auth.auth().currentUser!.uid).collection("ashiato").order(by: "date").addSnapshotListener { snapShot, error in
            
            if error != nil{
                return
                
            }
            
            if let snapShotDoc = snapShot?.documents{
                
                self.profileModelArray = []
                for doc in snapShotDoc{
                    
                    let data = doc.data()
                    if let name = data["name"] as? String,let cost = data["cost"] as? String,let identity = data["identity"] as? String,let job = data["job"] as? String,let meet = data["meet"] as? String,let customer = data["customer"] as? String,let pre = data["pre"] as? String,let profile = data["profile"] as? String,let profileImageString = data["profileImageString"] as? String,let uid = data["uid"] as? String,let quickWord = data["quickWord"] as? String,let date = data["date"] as? Double{
                        
                        let userDataModel = UserDataModel(name: name, cost: cost, pre: pre, job: job, identity: identity, customer: customer, profile: profile, profileImageString: profileImageString, uid: uid, quickWord: quickWord, meet: meet, date: date, onlineORNot: true)
                        self.profileModelArray.append(userDataModel)
                        
                    }
                    
                    
                }
                
                self.getAshiatoDataProtocol?.getAshiatoDataProtocol(userDataModelArray: self.profileModelArray)
                
            }
            
        }
        
    }
    
    func loadSearch(job:String,identity:String,costMin:String,costMax:String,pre:String,meet:String,userData:String){
        
        db.collection("Users").whereField("cost",isLessThan: costMax).addSnapshotListener { snapShot, error in
        //db.collection("Users").whereField("loadSearch", isEqualTo: loadSearch).addSnapshotListener { snapShot, error in   //isEqualTo
        //db.collection("Users").whereField("job", isEqualTo: job).addSnapshotListener { snapShot, error in
     
            if error != nil{
                print(error.debugDescription)
                return
            }
            
            if let snapShotDoc = snapShot?.documents{
                
                self.profileModelArray = []
                for doc in snapShotDoc{
                    
                    let data = doc.data()
                    if let name = data["name"] as? String,let cost = data["cost"] as? String,let identity = data["identity"] as? String,let job = data["job"] as? String,let meet = data["meet"] as? String,let customer = data["customer"] as? String,let pre = data["pre"] as? String,let profile = data["profile"] as? String,let profileImageString = data["profileImageString"] as? String,let uid = data["uid"] as? String,let quickWord = data["quickWord"] as? String,let onlineORNot = data["onlineORNot"] as? Bool{

                        let userDataModel = UserDataModel(name: name, cost: cost, pre: pre, job: job, identity: identity, customer: customer, profile: profile, profileImageString: profileImageString, uid: uid, quickWord: quickWord, meet: meet, date: 0, onlineORNot: onlineORNot)
                        
                        self.profileModelArray.append(userDataModel)
                        self.profileModelArray = self.profileModelArray.filter({
                            
                            //★検索条件　＆＆はかつなので、||のまたはに変えることも推奨！
                            $0.job == job && $0.identity == identity && $0.cost! >= costMin && $0.cost! <= costMax && $0.pre == pre && $0.meet == meet && $0.customer != userData
                            //$0.job == job && $0.identity == identity && $0.cost == cost && $0.pre == pre && $0.meet == meet && $0.customer != userData
                        })
                        
                        
                    }
                }
                
                self.getSearchResultProtocol?.getSearchResultProtocol(userDataModelArray: self.profileModelArray, searchDone: true)
                
            }
            
        }

        
    }
        
    
}
