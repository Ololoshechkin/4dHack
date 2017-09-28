//
//  ViewControllerWithMessages.swift
//  MapService
//
//  Created by Vadim on 29/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

open class ViewControllerWithMessages: UIViewController, MFMessageComposeViewControllerDelegate {
    
    func sendBySms() {
        let smsText =
            "sms : \(GlobalInfo.smsIsEnabled)\n" +
                "from : \(GlobalInfo.from)\n" +
                "to : \(GlobalInfo.to)\n" +
                "duration : \(GlobalInfo.duration)\n" +
                "walkDuration : \(GlobalInfo.walkDuration)\n" +
                "budget : \(GlobalInfo.budget)\n" +
                "options : \(GlobalInfo.options)\n" +
        "places : \(GlobalInfo.places.filter { s in s != nil }.map { s in s!})\n"
        print(smsText)
        if (GlobalInfo.smsIsEnabled) {
            let controller = MFMessageComposeViewController()
            controller.messageComposeDelegae = self
            controller.recipients = [IlyaPhoneNumber]
            controller.body = "Hello from California!"
            
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
}
