//
//  SchoolSearchController.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/9/20.
//

import UIKit

class SchoolSearchController : UIViewController {
    //MARK: - Properties
    let colors = Colors()
    
    private var selectedPrice = 3
    private var commuteAnswer = ""
    private var outOfStateAnswer = ""
    private var ethnicityAnswer = ""
    private var loanAnswer = ""
    private var hospitatlityAnswer = ""
    private var scholarshipAnswer = ""
    private var workAnswer = ""
    private var programAnswer = ""
    
    private let payForSchoolPicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let schoolPrices = ["What do you want to pay?","2000", "5000", "10000", "15000", "25000", "50000"]
    
    private let commutePicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let commuteData = ["Want to Commute?","Yes", "No",
                                    "Not sure"]
    
    private let outOfStatePicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let outOfStateData = ["Want to be out of state?","Yes", "No",
                                    "Not sure"]
    
    private let ethnicityPicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let ethnicityData = ["Prefered Demographic","asian", "black", "caucasian", "hispanic", "islander", "Not sure"]
    
    private let programLengthPicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let programLengthData = ["What kind of program?","Associates Degree (2 years)", "Bachalors Degree (4 years)", "Not sure"]
    
    private let workStatusPicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let workStatusData = ["Want to work while in school?","Yes", "No","Not sure"]
    
    
    private let hospitalityPicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let hospitatlityData = ["Want to live on campus?","Yes", "No","Not sure"]
    
    private let loanPicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let loanData = ["Want to take out loans?","Yes", "No","Not sure"]
    
    private let scholarshipPicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let scholarshipData = ["Are you looking for scholarships?","Yes", "No","Not sure"]
    
    private let submitButton : UIButton = {
        let button = Utilities().button(withTitle: "Submit")
        
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        refresh()
        print("DEBUG: School search Entered")
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        addPickers()
        addSubmitButton()
        navigationController?.navigationBar.isHidden = true
    }
    
    func addPickers() {
        configureSchoolPricePicker()
    }
    
    func addSchoolPricePicker() {
        let stack = UIStackView(arrangedSubviews: [payForSchoolPicker, commutePicker, outOfStatePicker, ethnicityPicker, hospitalityPicker, loanPicker, scholarshipPicker, workStatusPicker, programLengthPicker])
        stack.spacing = 0
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        view.addSubview(stack)
        stack.frame = CGRect(x: 20, y: view.frame.height * 0.06, width: view.frame.width - 40, height : view.frame.height * 0.76)
    }
    func configureSchoolPricePicker() {
        payForSchoolPicker.dataSource = self
        payForSchoolPicker.delegate = self
        payForSchoolPicker.tintColor = .clear
        payForSchoolPicker.backgroundColor = .clear
        
        commutePicker.dataSource = self
        commutePicker.delegate = self
        commutePicker.tintColor = .clear
        commutePicker.backgroundColor = .clear
        
        outOfStatePicker.dataSource = self
        outOfStatePicker.delegate = self
        outOfStatePicker.tintColor = .clear
        outOfStatePicker.backgroundColor = .clear
        
        ethnicityPicker.dataSource = self
        ethnicityPicker.delegate = self
        ethnicityPicker.tintColor = .clear
        ethnicityPicker.backgroundColor = .clear
        
        workStatusPicker.dataSource = self
        workStatusPicker.delegate = self
        workStatusPicker.tintColor = .clear
        workStatusPicker.backgroundColor = .clear
        
        hospitalityPicker.dataSource = self
        hospitalityPicker.delegate = self
        hospitalityPicker.tintColor = .clear
        hospitalityPicker.backgroundColor = .clear
        
        loanPicker.dataSource = self
        loanPicker.delegate = self
        loanPicker.tintColor = .clear
        loanPicker.backgroundColor = .clear
        
        scholarshipPicker.dataSource = self
        scholarshipPicker.delegate = self
        scholarshipPicker.tintColor = .clear
        scholarshipPicker.backgroundColor = .clear
        
        programLengthPicker.dataSource = self
        programLengthPicker.delegate = self
        programLengthPicker.tintColor = .clear
        programLengthPicker.backgroundColor = .clear
        
        addSchoolPricePicker()
    }
    
    func addSubmitButton() {
        view.addSubview(submitButton)
        submitButton.frame = CGRect(x: (view.frame.width / 2) - 60, y: view.frame.height * 0.83, width: 120, height: 40)
    }
    
    func refresh() {
        view.backgroundColor = .clear
        let backgroundLayer = colors.gl
        backgroundLayer?.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    }
    
    //MARK: - Selectors
    
    //MARK: - API
}

extension SchoolSearchController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == payForSchoolPicker {
            return schoolPrices.count
        } else if pickerView == commutePicker {
            return commuteData.count
        } else if pickerView == outOfStatePicker {
            return outOfStateData.count
        } else if pickerView == ethnicityPicker {
            return ethnicityData.count
        } else if pickerView == workStatusPicker {
            return workStatusData.count
        } else if pickerView == scholarshipPicker {
            return scholarshipData.count
        } else if pickerView == hospitalityPicker {
            return hospitatlityData.count
        } else if pickerView == loanPicker {
            return loanData.count
        } else if pickerView == programLengthPicker {
            return programLengthData.count
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == payForSchoolPicker {
            return schoolPrices[row]
        } else if pickerView == commutePicker {
            return commuteData[row]
        } else if pickerView == ethnicityPicker {
            return ethnicityData[row]
        } else if pickerView == outOfStatePicker {
            return outOfStateData[row]
        } else if pickerView == workStatusPicker {
            return workStatusData[row]
        } else if pickerView == scholarshipPicker {
            return scholarshipData[row]
        } else if pickerView == hospitalityPicker {
            return hospitatlityData[row]
        } else if pickerView == loanPicker {
            return loanData[row]
        } else if pickerView == programLengthPicker {
            return programLengthData[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == payForSchoolPicker {
            selectedPrice = Int(schoolPrices[row]) ?? 0
        } else if pickerView == commutePicker {
            commuteAnswer = commuteData[row]
        } else if pickerView == ethnicityPicker {
            ethnicityAnswer = ethnicityData[row]
        } else if pickerView == outOfStatePicker {
            outOfStateAnswer = outOfStateData[row]
        } else if pickerView == workStatusPicker {
            workAnswer = workStatusData[row]
        } else if pickerView == scholarshipPicker {
            scholarshipAnswer = scholarshipData[row]
        } else if pickerView == hospitalityPicker {
            hospitatlityAnswer = hospitatlityData[row]
        } else if pickerView == loanPicker {
            loanAnswer = loanData[row]
        } else if pickerView == programLengthPicker {
            programAnswer = programLengthData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerView == payForSchoolPicker {
            return NSAttributedString(string: self.schoolPrices[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        } else if pickerView == commutePicker {
            return NSAttributedString(string: self.commuteData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        } else if pickerView == outOfStatePicker {
            return NSAttributedString(string: self.outOfStateData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        } else if pickerView == ethnicityPicker {
            return NSAttributedString(string: self.ethnicityData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        } else if pickerView == workStatusPicker {
            return NSAttributedString(string: self.workStatusData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        } else if pickerView == scholarshipPicker {
            return NSAttributedString(string: self.scholarshipData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        } else if pickerView == hospitalityPicker {
            return NSAttributedString(string: self.hospitatlityData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        } else if pickerView == loanPicker {
            return NSAttributedString(string: self.loanData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        } else if pickerView == programLengthPicker {
            return NSAttributedString(string: self.programLengthData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        }
        
        return NSAttributedString(string: self.schoolPrices[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
    
}
