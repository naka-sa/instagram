//
//  CommentViewController.swift
//  Instagram
//
//  Created by satoshi_nakajima on 2017/03/28.
//  Copyright © 2017年 satoshi_nakajima. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController {
    var postData: PostData!
    
    @IBOutlet weak var commentUserName: UILabel!
    
    @IBOutlet weak var commentField: UITextField!
    
    @IBAction func commentPostButton(_ sender: Any) {
        
        
        
        var comments = postData.comments
        let name = FIRAuth.auth()?.currentUser?.displayName
        let comment:String = commentField.text!
        let time = NSDate.timeIntervalSinceReferenceDate
        let comment_data =  ["commenter":name,"time": String(time),"comment_txt":comment]
        let postRef = FIRDatabase.database().reference().child(Const.PostPath).child(postData.id!)
        comments.append(comment_data as! [String : String])
        postRef.updateChildValues(["comments":comments])
        
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
