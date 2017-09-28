//
//  Extensions.swift
//  MapService
//
//  Created by Vadim on 28/09/2017.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

extension UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

extension UIViewController: MFMessageComposeViewControllerDelegate {
    
    public func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
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
        let controller = MFMessageComposeViewController()
        controller.messageComposeDelegate = self
        controller.recipients = [StasPhoneNumber]
        controller.body = smsText
        self.present(controller, animated: true, completion: nil)
    }
    
}
