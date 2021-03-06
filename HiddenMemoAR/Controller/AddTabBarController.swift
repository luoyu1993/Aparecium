//
//  AddTabBarController.swift
//  HiddenMemoAR
//
//  Created by HyungJung Kim on 24/11/2018.
//  Copyright © 2018 HyungJung Kim. All rights reserved.
//

import UIKit


class AddTabBarController: UITabBarController {
    
    // MARK: - override
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addHiddenNotesMemoViewController = self.children[selectedIndex] as? AddHiddenNotesMemoViewController {
            addHiddenNotesMemoViewController.titleForRegister = titleForRegister
            addHiddenNotesMemoViewController.keyImageForRegister = keyImageForRegister
            
            addHiddenNotesMemoViewController.prepare(for: segue, sender: sender)
        } else if let addHiddenImageMemoViewController = self.children[selectedIndex] as? AddHiddenImageMemoViewController {
            addHiddenImageMemoViewController.titleForRegister = titleForRegister
            addHiddenImageMemoViewController.keyImageForRegister = keyImageForRegister
            
            addHiddenImageMemoViewController.prepare(for: segue, sender: sender)
        } else if let addHiddenVideoMemoViewController = self.children[selectedIndex] as? AddHiddenVideoMemoViewController {
            addHiddenVideoMemoViewController.titleForRegister = titleForRegister
            addHiddenVideoMemoViewController.keyImageForRegister = keyImageForRegister
            
            addHiddenVideoMemoViewController.prepare(for: segue, sender: sender)
        }
    }
    
    // MARK: - IBAction
    
    @IBAction private func backButtonDidTap(_ sender: Any) {
        self.registeredKeysCollectionViewControllerDelegate?.didBack()
    }
    
    @IBAction private func doneButtonDidTap(_ sender: Any) {
        self.alertTextField()
    }
    
    // MARK: - internal
    
    weak var registeredKeysCollectionViewControllerDelegate: RegisteredKeysCollectionViewControllerDelegate?
    
    var titleForRegister: String?
    var keyImageForRegister: UIImage?
    
}


private extension AddTabBarController {
    
    private func alertTextField() {
        let alertController = UIAlertController(
            title: "Title",
            message: nil,
            preferredStyle: UIAlertController.Style.alert
        )
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter a title."
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.titleForRegister = alertController.textFields?[0].text ?? ""
            
            self.performSegue(withIdentifier: "segueToViewController", sender: nil)
        }
        
        [cancelAction, okAction].forEach {
            alertController.addAction($0)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
