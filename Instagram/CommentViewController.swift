//
//  CommentViewController.swift
//  Instagram
//
//  Created by satoshi_nakajima on 2017/03/28.
//  Copyright © 2017年 satoshi_nakajima. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    @IBOutlet weak var commentField: UITextField!
    
    //target
    var postData:PostData!
    
    @IBAction func commentPostButton(_ sender: Any) {
        // postDataに必要な情報を取得しておく
        let name = FIRAuth.auth()?.currentUser?.displayName
        
        // 辞書を作成してFirebaseに保存する
        let postRef = FIRDatabase.database().reference().child(Const.PostPath).child(self.postData.id!)
        let postData = ["caption": "\(self.postData.caption!) : \n : \(name!) : \(commentField.text!)"]
        postRef.updateChildValues(postData)
        
        //コメント投稿を完了する
        SVProgressHUD.showSuccess(withStatus: "コメントを投稿しました")
        self.dismiss(animated: true, completion: nil)
    }

 
    @IBAction func commentCancelButton(_ sender: Any) {
        //コメント投稿をキャンセルする
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
