//
//  RxSwiftTextFieldViewController.swift
//  SampleRxSwiftText
//
//  Created by 祥平 on 2021/12/11.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

class RxSwiftTextFieldViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    
    private let maxNameFieldSize = 10
    private let maxAddressFieldSize = 50
    private let disposeBag = DisposeBag()
    
    let limitText: (Int) -> String = {
        return "あと\($0)文字"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.rx.text
            .map { [weak self] text -> String? in
                guard let text = text else { return nil}
                guard let maxNameFieldSize = self?.maxNameFieldSize else { return nil}
                let limitCount = maxNameFieldSize - text.count
                
                return self?.limitText(limitCount)
            }
            .filterNil()
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        addressField.rx.text
            .map { [weak self] text -> String? in
                guard let text = text else { return nil}
                guard let maxAddressFieldSize = self?.maxAddressFieldSize else { return nil}
                let limitCount = maxAddressFieldSize - text.count
                
                return self?.limitText(limitCount)
            }
            .filterNil()
            .bind(to: addressLabel.rx.text)
            .disposed(by: disposeBag)
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
