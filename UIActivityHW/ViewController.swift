//
//  ViewController.swift
//  UIActivityHW
//
//  Created by Иван on 4/30/21.
//

import UIKit

class ViewController: UIViewController {
    
    var textField = UITextField()
    var button = UIButton()
    var pickerView = UIPickerView()
    
    private var pickerViewArray = ["nothing", "nothing", "share"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        createButton()
        createPickerView()
        
    }
    
    private func createTextField() {
        textField = UITextField(frame: CGRect(x: 50, y: 340, width: 320, height: 50))
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(textField)
        
    }
    
    private func createButton() {
        button = UIButton(frame: CGRect(x: 110, y: 450, width: 200, height: 80))
        button.backgroundColor = .cyan
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitle("Share", for: .normal)
        button.addTarget(self, action: #selector(buttontapped), for: .allTouchEvents)
        view.addSubview(button)
    }
    
    private func createPickerView() {
        pickerView = UIPickerView(frame: CGRect(x: 110, y: 550, width: 200, height: 100))
        pickerView.layer.cornerRadius = 10
        pickerView.backgroundColor = .systemGray5
        pickerView.dataSource = self
        pickerView.delegate = self
        view.addSubview(pickerView)
        
    }
    
    @objc private func buttontapped() {
        showActivityController()
    }
    
    private func showActivityController() {
        let objectsToShare: [Any] = [textField.text ?? ""]
        let activityController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.present(activityController, animated: true)
        textField.text = ""
    }
    
    
}

extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerViewArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerViewArray[row] {
        case "share":
            showActivityController()
        default:
            break
        }
    }
    
}

