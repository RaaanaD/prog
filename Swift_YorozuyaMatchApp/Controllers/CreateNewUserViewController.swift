//
//  CreateNewUserViewController.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/03.
//

import UIKit
import Firebase
import AVFoundation

class CreateNewUserViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ProfileSendDone{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var quickWordTextField: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    

    @IBOutlet weak var toProfileButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    var player = AVPlayer()
    
    var costPicker = UIPickerView()
    var prePicker = UIPickerView()
    var jobPicker = UIPickerView()
    var identityPicker = UIPickerView()
    var meetPicker = UIPickerView()
    
    //例。北海道〜沖縄、A型〜0型
    var dataStringArray = [String]()
    
    //例　0歳から150歳
    var dataIntArray = [Int]()
    
    var customer = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpVideo()

        textField2.inputView = costPicker
        textField3.inputView = prePicker
        textField4.inputView = jobPicker
        textField5.inputView = identityPicker
        textField6.inputView = meetPicker
        
        
        costPicker.delegate = self
        costPicker.dataSource = self
        prePicker.delegate = self
        prePicker.dataSource = self
        jobPicker.delegate = self
        jobPicker.dataSource = self
        identityPicker.delegate = self
        identityPicker.dataSource = self
        meetPicker.delegate = self
        meetPicker.dataSource = self
    
        costPicker.tag = 1
        prePicker.tag = 2
        jobPicker.tag = 3
        identityPicker.tag = 4
        meetPicker.tag = 5
        
        customer = "解決したい"
        
        Util.rectButton(button: toProfileButton)
        Util.rectButton(button: doneButton)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag{
        case 1:
            dataIntArray = ([Int])(0...100)
            return dataIntArray.count
            //dataStringArray =
//            ["0","1,000","5,000","1万","3万","5万","10万","50万","100万","101万以上"]
           //["0","1〜999","1,000〜4,999","5,000〜9,999","1万〜29,999","3万〜49,999","5万〜99,999","10万〜"]
            //return dataStringArray.count
        case 2:
            dataStringArray = Util.prefectures()
            return dataStringArray.count
        case 3:
            dataStringArray = ["ビジネス","IT・プログラミング","デザイン・クリエイティブ・芸術","就業・転職","副業・フリーランス","探偵・調査・探し物","自己啓発・マインドフルネス","代行サービス","恋愛・婚活","スポーツ・フィットネス","健康・医療","美容","農業・自然","旅・旅行","場所・会場提供","音楽","マンガ・アニメ・ゲーム","趣味・娯楽","各種相談窓口","その他"]
            return dataStringArray.count
        case 4:
            dataStringArray = ["親しみ易い","親切・丁寧・分かり易い","冷静・客観的・的確","情熱的・熱心","主体的・リーダー性強い","面白い・個性派","サポート欲強い","ボランティア・人助け精神高い"]
            return dataStringArray.count
        case 5:
            dataStringArray = ["オンライン","その他"]
            return dataStringArray.count
        default:
            return 0
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        switch pickerView.tag{
        case 1:
            textField2.text = String(dataIntArray[row]) + ",000円"
            //textField2.text = "約 ¥" + dataStringArray[row]
            textField2.resignFirstResponder()
            break
        case 2:
            textField3.text = dataStringArray[row]
            textField3.resignFirstResponder()
            break
        case 3:
            textField4.text = dataStringArray[row]
            textField4.resignFirstResponder()
            break
        case 4:
            textField5.text = dataStringArray[row]
            textField5.resignFirstResponder()
            break
        case 5:
            textField6.text = dataStringArray[row]
            textField6.resignFirstResponder()
            break
        default:
            break
        }
        
    }
    
    //行に記載する文字列
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 1:
            //return "¥" + dataStringArray[row]
            return String(dataIntArray[row]) + ",000円"
        case 2:
            return dataStringArray[row]
        case 3:
            return dataStringArray[row]
        case 4:
            return dataStringArray[row]
        case 5:
            return dataStringArray[row]
        default:
            return ""
        }
        
    }
    
    
    @IBAction func customerSwitch(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            customer = "解決したい"
        }else{
            customer = "案件を探したい"
        }

    }
    
    
    @IBAction func done(_ sender: Any) {
        
        //firestoreに送信
        let manager = Manager.shared.profile
        
        //送信
        Auth.auth().signInAnonymously { result, error in

            if error != nil{
                print(error.debugDescription)
                return
            }
            
            if let range1 = self.textField2.text?.range(of: ",000円"){
                self.textField2.text?.replaceSubrange(range1, with: "")
            }
            
            let userdata = UserDataModel(name: self.textField1.text, cost: self.textField2.text, pre: self.textField3.text, job: self.textField4.text, identity: self.textField5.text, customer: self.customer, profile: manager, profileImageString: "", uid: Auth.auth().currentUser?.uid, quickWord: self.quickWordTextField.text, meet: self.textField6.text, date: Date().timeIntervalSince1970, onlineORNot: true)
            
            let sendDBModel = SendDBModel()
            sendDBModel.profileSendDone = self
            sendDBModel.sendProfileData(userData: userdata, profileImageData: (self.imageView.image?.jpegData(compressionQuality: 0.4))!)
            
        }
        
    }
    
    func profileSendDone(){
        dismiss(animated: true, completion: nil)
    }
    
  
    @IBAction func tap(_ sender: Any) {
        
        //カメラもしくはアルバム起動
        openCamera()
        
    }
    
    func openCamera(){
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
//            cameraPicker.showsCameraControls = true
            present(cameraPicker, animated: true, completion: nil)
            
        }else{
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let pickedImage = info[.editedImage] as? UIImage
        {
            imageView.image = pickedImage
            //閉じる処理
            picker.dismiss(animated: true, completion: nil)
         }
 
    }
 
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func setUpVideo(){
            //ファイルパス
            player = AVPlayer(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/yorozuyaapp-38d86.appspot.com/o/Ink%20-%2058193.mp4?alt=media&token=6c25b589-ca6e-428a-b689-b9cb274f406b")!)

               //AVPlayer用のレイヤーを生成
               let playerLayer = AVPlayerLayer(player: player)
               playerLayer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)

               playerLayer.videoGravity = .resizeAspectFill
               playerLayer.repeatCount = 0 //無限ループ(終わったらまた再生のイベント後述)
               playerLayer.zPosition = -1
               view.layer.insertSublayer(playerLayer, at: 0)

               //終わったらまた再生
               NotificationCenter.default.addObserver(
                   forName: .AVPlayerItemDidPlayToEndTime, //終わったr前に戻す
                   object: player.currentItem,
                   queue: .main) { (_) in

                       self.player.seek(to: .zero)//開始時間に戻す
                       self.player.play()

               }

               self.player.play()

    }
        
    
    

}
