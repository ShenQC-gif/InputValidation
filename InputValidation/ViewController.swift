//
//  ViewController.swift
//  InputValidation
//
//  Created by ちいつんしん on 2021/02/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var textField: UITextField!
    private var entry = Entry()

    //参加者を管理
    var memberArray = [String]()
    
    @IBAction func add(_ sender: Any) {

        //do構文を使って書く
        do {
            let member = try entry.add(input: textField.text ?? "")
            memberArray.append(member)
        } catch Entry.Validation.isEmpty{
            print("空です")
        }catch Entry.Validation.isTooLong{
            print("5文字を超えています")
        }catch{
        }

        //guardを使って書く
//        guard let member = textField.text else {
//            return
//        }
//
//        guard member != "" else {
//            return
//        }
//
//        guard member.count <= 5 else {
//            return
//        }
//        memberArray.append(member)

        //if文だけで書く
        //textFieldがnilかもしれない
//        if let text = textField.text{
//            if text != ""{
//                if text.count <= 5{
//                memberArray.append(text)
//                }
//            }
//        }

        print(memberArray)
    }
}

class Entry{

    enum Validation :Error {
        case isEmpty
        case isTooLong
    }

    func add(input:String) throws -> String{

        guard input != "" else {
            throw Validation.isEmpty
        }

        guard input.count <= 5 else {
            throw Validation.isTooLong
        }

        return input
    }
}


