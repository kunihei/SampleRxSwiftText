//
//  TextFieldSampleViewController.swift
//  SampleRxSwiftText
//
//  Created by 祥平 on 2021/12/11.
//

import UIKit

class TextFieldSampleViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    
    private let maxNameFieldSize = 10
    private let maxAddressFieldSize = 50
    
    let limitText: (Int) -> String = {
        return "あと\($0)文字"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.addTarget(self, action: #selector(nameFieldEditingChanged(sender:)), for: .editingChanged)
        addressField.addTarget(self, action: #selector(nameFieldEditingChanged(sender:)), for: .editingChanged)
    }
    
    @objc func addressFieldRditingChanged(sender: UITextField) {
        guard let changedText = sender.text else { return }
        let limitCount = maxAddressFieldSize - changedText.count
        addressLabel.text = limitText(limitCount)
        
    }
    
    @objc func nameFieldEditingChanged(sender: UITextField) {
        guard let changedText = sender.text else { return }
        let limitCount = maxNameFieldSize - changedText.count
        nameLabel.text = limitText(limitCount)
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
