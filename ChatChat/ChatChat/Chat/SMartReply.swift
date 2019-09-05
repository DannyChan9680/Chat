//
//  SMartReply.swift
//  ChatChat
//
//  Created by Civet on 2019/9/5.
//  Copyright © 2019 limeixiang. All rights reserved.
//

import Foundation
import ApiAI
class SmartReply: UIViewController{
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var chipResponse: UILabel!
    @IBAction func  sendMessage(_  sender:  Any)  {
        let  request  =  ApiAI.shared().textRequest()
        let chat=ChatViewController()
        chat.textField=self.messageField.text
        if  let  text  =self.messageField.text,  text  !=  ""  {
            request?.query  =  text
        }  else  {
            return
        }
        request?.setMappedCompletionBlockSuccess({  (request,  response)  in
            let  response  =  response as!  AIResponse
            if  let  textResponse  =  response.result.fulfillment.speech  {
               self.speechAndText(text: textResponse)
            }
        },  failure:  {  (request,  error)  in
            print(error!)
        })
        ApiAI.shared().enqueue(request)
        messageField.text  =  ""
    }
}
