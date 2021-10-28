//
//  SearchViewController.swift
//  YorozuyaApp
//
//  Created by 台莉捺子 on 2021/09/28.
//

import UIKit

class SearchViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,GetSearchResultProtocol {
    

    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var identityTextField: UITextField!
    @IBOutlet weak var costMinTextField: UITextField!
    @IBOutlet weak var costMaxTextField: UITextField!
    @IBOutlet weak var preTextField: UITextField!
    @IBOutlet weak var meetTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!

    var costMinPicker = UIPickerView()
    var costMaxPicker = UIPickerView()
    var jobPicker = UIPickerView()
    var identityPicker = UIPickerView()
    var prePicker = UIPickerView()
    var meetPicker = UIPickerView()

    var dataStringArray = [String]()
    var dataIntArray = [Int]()
    
    var userDataModelArray = [UserDataModel]()
    var userData = String()
    // 遷移元から処理を受け取るクロージャのプロパティを用意
    var resultHandler: (([UserDataModel],Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobTextField.inputView = jobPicker
        identityTextField.inputView = identityPicker
        costMinTextField.inputView = costMinPicker
        costMaxTextField.inputView = costMaxPicker
        preTextField.inputView = prePicker
        meetTextField.inputView = meetPicker
        
        jobPicker.delegate = self
        jobPicker.dataSource = self
        identityPicker.delegate = self
        identityPicker.dataSource = self
        costMinPicker.delegate = self
        costMinPicker.dataSource = self
        costMaxPicker.delegate = self
        costMaxPicker.dataSource = self
        prePicker.delegate = self
        prePicker.dataSource = self
        meetPicker.delegate = self
        meetPicker.dataSource = self
        
        jobPicker.tag = 1
        identityPicker.tag = 2
        costMinPicker.tag = 3
        costMaxPicker.tag = 4
        prePicker.tag = 5
        meetPicker.tag = 6
        
        //        Util.rectButton(button: restButton)
        Util.rectButton(button: searchButton)
        
        // Do any additional setup after loading the view.
    }
    
    //PickerViewのコンポーネント内の行数を決めるメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 1:
            dataStringArray = ["ビジネス","IT・プログラミング","デザイン・クリエイティブ・芸術","就業・転職","副業・フリーランス","探偵・調査・探し物","自己啓発・マインドフルネス","代行サービス","恋愛・婚活","スポーツ・フィットネス","健康・医療","美容","農業・自然","旅・旅行","場所・会場提供","音楽","マンガ・アニメ・ゲーム","趣味・娯楽","各種相談窓口","その他"]
            return dataStringArray.count
        case 2:
            dataStringArray = ["親しみ易い","親切・丁寧・分かり易い","冷静・客観的・的確","情熱的・熱心","主体的・リーダー性強い","面白い・個性派","サポート欲強い","ボランティア・人助け精神高い"]
            return dataStringArray.count
        case 3:
            dataIntArray = ([Int])(0...100)
            return dataIntArray.count
            //dataStringArray =             ["0","1,000","5,000","1万","3万","5万","10万","50万","100万"]
            //return dataStringArray.count
            //dataStringArray = ["0","1〜999","1,000〜4,999","5,000〜9,999","1万〜29,999","3万〜49,999","5万〜99,999","10万〜"]
            //return dataStringArray.count
        case 4:
            dataIntArray = ([Int])(0...100)
            return dataIntArray.count
            //dataStringArray =                         ["0","1,000","5,000","1万","3万","5万","10万","50万","100万","101万以上"]
            //return dataStringArray.count
        case 5:
            dataStringArray = Util.prefectures()
            return dataStringArray.count
        case 6:
            dataStringArray = ["オンライン","その他"]
            return dataStringArray.count
        default:
            return 0
        }
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag{
        case 1:
            jobTextField.text = dataStringArray[row]
            jobTextField.resignFirstResponder()
            break
        case 2:
            identityTextField.text = dataStringArray[row]
            identityTextField.resignFirstResponder()
            break
        case 3:
            costMinTextField.text = String(dataIntArray[row]) + ",000円"
            costMinTextField.resignFirstResponder()
            break
            //costMinTextField.text = "¥" + dataStringArray[row]
        case 4:
            //costMaxTextField.text = "¥" + dataStringArray[row]
            costMaxTextField.text = String(dataIntArray[row]) + ",000円"
            costMaxTextField.resignFirstResponder()
            break
        case 5:
            preTextField.text = dataStringArray[row]
            preTextField.resignFirstResponder()
            break
        case 6:
            meetTextField.text = dataStringArray[row]
            meetTextField.resignFirstResponder()
            break
        default:
            break
        }
        
    }
    
    
    //PickerViewのコンポーネントに表示するデータを決めるメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 1:
            return dataStringArray[row]
        case 2:
            return dataStringArray[row]
        case 3:
            //return "¥" + dataStringArray[row]
            return String(dataIntArray[row]) + ",000円"
        case 4:
            //return "¥" + dataStringArray[row]
            return String(dataIntArray[row]) + ",000円"
        case 5:
            return dataStringArray[row]
        case 6:
            return dataStringArray[row]
            
        default:
            return ""
        }
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func search(_ sender: Any) {
        
        //条件に合ったものを受信する
        let loadDBModel = LoadDBModel()
        loadDBModel.getSearchResultProtocol = self
        loadDBModel.loadSearch(job: jobTextField.text!, identity: identityTextField.text!, costMin: costMinTextField.text!, costMax: costMaxTextField.text!, pre: preTextField.text!, meet: meetTextField.text!, userData: userData)
        //★★10/3 98章を参照！！
//        loadDBModel.loadSearch(job: jobTextField.text!, identity: identityTextField.text!, costMax: costMaxTextField.text!, costMin: costMinTextField.text!, pre: preTextField.text!, meet: meetTextField.text!, userData: userData)
        
    }
    
        
//        @IBAction func resetAll(_ sender: Any) {
//
//            jobTextField.text = ""
//            identityTextField.text = ""
//            costMinTextField.text = ""
//            costMaxTextField.text = ""
//            preTextField.text = ""
//            meetTextField.text = ""
//
//        }
    
    
    func getSearchResultProtocol(userDataModelArray: [UserDataModel], searchDone: Bool) {
        
        self.userDataModelArray = []
        self.userDataModelArray = userDataModelArray
        
        if let handler = self.resultHandler{
            
            //入力値を引数として渡された処理を実行
            
            handler(self.userDataModelArray,searchDone)
            
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
