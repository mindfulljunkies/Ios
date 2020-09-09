//
//  ChatingVC.swift
//  ClassyDrives
//
//  Created by apple on 27/08/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ChatingVC: UIViewController {
    @IBOutlet weak var mChatingTableVw: UITableView!
    
    
    @IBOutlet weak var mHeaderLbl: UILabel!
    @IBOutlet weak var mTxt: UITextField!
    var chatArry: [Message]!
    var ref: DatabaseReference!
    var otherUserId = String()
    var otherUserName = String()
    var otherUserImage = String()
    var userID = String()
    var messageNode = String()
    var chatobjectarray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        chatArry = [Message]()
        mChatingTableVw.estimatedRowHeight = 200
        mChatingTableVw.rowHeight = UITableView.automaticDimension
        userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""
        if otherUserName != ""{
            mHeaderLbl.text = otherUserName
        }
        // Do any additional setup after loading the view.
        

    }
    override func viewWillAppear(_ animated: Bool) {
        self.getChat()
    }
    @IBAction func mBackBtnAct(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func mSendBtnAct(_ sender: Any) {
        if mTxt.text != ""{
            sendMessage()
        }
    }
    func timestampToDate(Timestamp :Double,completion: (String) -> ()){
        let x = Timestamp / 1000
        let date = NSDate(timeIntervalSince1970: x)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let localDate = formatter.string(from: date as Date)
        completion(localDate)
    }
    func timestampsToDate(Timestamp :String,completion: (String) -> ()){
        let x = Timestamp
        let date = NSDate(timeIntervalSince1970: (Double(x) as? TimeInterval)!)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let localDate = formatter.string(from: date as Date)
        completion(localDate)
    }
    func sendMessage(){
       
        self.ref = Database.database().reference()
        let messages = self.ref.child("Messages")
        
        let nodeFromID = messages.child(messageNode)
        let userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""
        let autoID = nodeFromID.childByAutoId()
    
        let date = Date()
        let new_timestamp = Int(date.timeIntervalSince1970 * 1000.0)
        let dict: [String:Any] = ["author": "SukhFromMJ",
                                  "isSame":false,
                                  "message":mTxt.text ?? "",
                                  "otherUserImage":otherUserImage,
                                  "recepient_id":otherUserId,
                                  "sender_id": userID,"timestamp": "\(new_timestamp)","type":"text","userImage":""
        ]
        autoID.updateChildValues(dict)
      //  autoID.setValue(dict)
        mTxt.text! = ""
        self.getChat()
    }
    
    func getChat(){
        self.ref = Database.database().reference()
        print("messageNode---\(messageNode)"); self.ref.child("Messages").child(messageNode).queryOrdered(byChild: "timestamp").observe(.value, with: { (data) in
            print(data)
            
            if data.value! is NSNull{
          //      SVProgressHUD.dismiss()
                
            }else{
                
                
                guard let values = data.value as? NSDictionary else {
                    return
                }
                print(values)
                self.chatobjectarray.removeAllObjects()
                for sort in data.children{
                    print(sort)
                    guard let snap = sort as? DataSnapshot else{return}
                    self.chatobjectarray.add(snap.value!)
                }
                
                self.chatArry.removeAll()
                
                self.chatArry = Message.modelsFromDictionaryArray(array: self.chatobjectarray)
              //  SVProgressHUD.dismiss()
                self.mChatingTableVw.reloadData()
                self.scrollToBottom()
            }
        }) { (error) in
            print(error.localizedDescription)
            //  self.hideProgress()
        }
        
    }
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.chatArry.count-1, section: 0)
            self.mChatingTableVw.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}
extension ChatingVC: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if chatArry.count > 0{
        return chatArry.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""

        let chatArrId = chatArry[indexPath.row].sender_id
        print(chatArrId)
        print(String(describing: userID))
       if String(describing: chatArrId!) != String(describing: userID){
            let cell = mChatingTableVw.dequeueReusableCell(withIdentifier: "ChatingTableViewCellID", for: indexPath) as! ChatingTableViewCell
            cell.mReciverLbl.text = chatArry[indexPath.row].message ?? ""
        if let timeResult = Double(chatArry[indexPath.row].timestamp!) {
            let date = Date(timeIntervalSince1970: timeResult)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
//            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            cell.mReciverTimeLbl.text! = localDate
        }

              return cell
       }else{
           let cell = mChatingTableVw.dequeueReusableCell(withIdentifier: "ChatingTableViewCellID2", for: indexPath) as! ChatingTableViewCell
             cell.mSenderLbl.text = chatArry[indexPath.row].message ?? ""
        if chatArry[indexPath.row].timestamp != ""{
            _ = Double(chatArry[indexPath.row].timestamp!)
 
            if let timeResult = Double(chatArry[indexPath.row].timestamp!) {
                let date = Date(timeIntervalSince1970: timeResult / 1000)
                let dateFormatter = DateFormatter()
                dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
                let localDate = dateFormatter.string(from: date)
                cell.mSenderTimeLbl.text! = localDate
            }
    
        }

            return cell
          }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
        
    }
}
