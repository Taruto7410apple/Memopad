//
//  MemoViewController.swift
//  Memopad
//
//
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var titleTextField: UITextField!
    //@IBOutlet var contentTextView: UITextView!
    @IBOutlet var contentTextView2: UITextView!
    
    var saveData:UserDefaults=UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text=saveData.object(forKey:"title") as? String
        //contentTextView.text=saveData.object(forKey:"content") as? String
        contentTextView2.text=saveData.object(forKey:"content2") as? String
        titleTextField.delegate=self
      

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMemo(){
        
        saveData.set(titleTextField.text,forKey:"title")
        saveData.set(contentTextView2.text, forKey:"content2")
        
        let alert: UIAlertController=UIAlertController(title:"保存", message:"メモの保存が完了しました。",preferredStyle:.alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler:{action in
                    self.navigationController?.popViewController(animated:true)
                }
            )
        )
        present(alert,animated:true,completion:nil)
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
