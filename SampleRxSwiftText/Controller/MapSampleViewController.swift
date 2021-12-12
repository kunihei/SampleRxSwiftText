//
//  MapSampleViewController.swift
//  SampleRxSwiftText
//
//  Created by 祥平 on 2021/12/12.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

class MapSampleViewController: UIViewController {

    @IBOutlet weak var hogeTextField: UITextField!
    @IBOutlet weak var fooTextLabel: UILabel!
    @IBOutlet weak var showUserNameButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    let user = "kunihisa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showUserNameButton.rx.tap
            .map { [weak self] in
                return self?.user
            }
            .bind(to: fooTextLabel.rx
                    .text)
            .disposed(by: disposeBag)

        hogeTextField.rx.text
            .map { text -> String? in
                guard let text = text else { return nil }
                
                return "あと\(text.count)文字"
            }
            .bind(to: fooTextLabel.rx.text)
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
