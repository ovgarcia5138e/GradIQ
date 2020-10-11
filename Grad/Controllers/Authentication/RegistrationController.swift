//
//  RegistrationController.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/9/20.
//

import UIKit
import MaterialComponents.MaterialChips

private let cellIdentifier = "ChipCell"

class RegistrationController : UIViewController {
    //MARK: - Properties
    let colors = Colors()
    private var genderSelected = ""
    private var schoolYearSelected = ""
    private var ethnicitySelected = ""
    
    private let emailTF : UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Email")
        
        return tf
    }()
    
    private lazy var emailContainer : UIView = {
        let image = #imageLiteral(resourceName: "gradEmail")
        let view = Utilities().inputContainerView(withImage: image, textField: emailTF)
        
        return view
    }()
    
    private let nameTF : UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Full Name")
        
        return tf
    }()
    
    private lazy var fullNameContainer : UIView = {
        let imate = #imageLiteral(resourceName: "GradName")
        let view = Utilities().inputContainerView(withImage: imate, textField: nameTF)
        
        return view
    }()
    
    private let passwordTF : UITextField = {
        let tf = Utilities().textField(withPlaceholder: "Password")
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    private lazy var passwordContainer : UIView = {
        let image = #imageLiteral(resourceName: "Gradpw")
        let view = Utilities().inputContainerView(withImage: image, textField: passwordTF)
        
        return view
    }()
    
    private let gpaTF : UITextField = {
        let tf = Utilities().textField(withPlaceholder: "GPA")
        
        return tf
    }()
    
    private lazy var gpaContainer : UIView = {
        let image = #imageLiteral(resourceName: "GradGPA")
        let view = Utilities().inputContainerView(withImage: image, textField: gpaTF)
        
        return view
    }()
    
    private let satTF : UITextField = {
        let tf = Utilities().textField(withPlaceholder: "SAT Score (Leave blank if not applicable)")
        
        return tf
    }()
    
    private lazy var satContainer : UIView = {
        let image = #imageLiteral(resourceName: "GradSAT")
        let view = Utilities().inputContainerView(withImage: image, textField: satTF)
        
        return view
    }()
    
    private let genderPicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let genderData = ["Prefer Not To Say", "Female",
                           "Male", "Non-Binary"]
    
    private let schoolYearPicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let schoolYearData = ["HS Freshman", "HS Sophmore", "HS Junior",
                                  "HS Senior", "High School Graduate", "Uni Freshman",
                                  "Uni Sophmore", "Uni Junior", "Uni Senior"]
    
    private let schoolYears = ["hs_fresh", "hs_soph", "hs_junior",
                              "hs_senior", "High School Graduate", "c_fres",
                              "c_soph", "c_junior", "c_senior"]
    
    private let genders = ["n/a", "f", "m", "nb"]
    
    private let ethnicityPicker : UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let ethnicityData = ["asian", "black", "hispanic",
                                 "islander", "caucasian"]
    
    private let interstData = ["Administration", "Automobiles",
                                 "Business", "Care Giver",
                                 "Computers", "Law", "Medicine",
                                 "Technology"]
    
    private let interestCollection : UICollectionView = {
        let layout = MDCChipCollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 50, height: 20)
        
        let coll = UICollectionView(frame: .zero, collectionViewLayout: layout)
        coll.register(ChipCell.self, forCellWithReuseIdentifier: cellIdentifier)
        coll.allowsMultipleSelection = true
        
        coll.layer.cornerRadius = 20
        coll.alpha = 0.5
        return coll
    }()
    
    private var selectedInterst = [String]()
    
    private let registerButton : UIButton = {
        let btn = Utilities().button(withTitle: "Register")
        btn.addTarget(self, action: #selector(handleRegisterPressed), for: .touchUpInside)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.backgroundColor = .white
        btn.alpha = 0.85
        btn.layer.cornerRadius = 13
        btn.layer.borderWidth = 1.5
        btn.layer.borderColor = UIColor.white.cgColor
        
        return btn
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        addPickers()
        addTextFields()
        addInterestCollection()
        configureCollection()
        addRegisterButton()
    }
    
    func addTextFields() {
        let stack = UIStackView(arrangedSubviews: [fullNameContainer,emailContainer,
                                                   passwordContainer, gpaContainer,
                                                   satContainer])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 3
        view.addSubview(stack)
        stack.frame = CGRect(x: 10, y: view.frame.height * 0.09,
                             width: view.frame.width - 20,
                             height: view.frame.height * 0.30)
    }
    
    func addGenderPicker() {
        view.addSubview(genderPicker)
        genderPicker.frame = CGRect(x: 10,
                                    y: view.frame.height * 0.39,
                                    width: view.frame.width - 20,
                                    height: view.frame.height * 0.10)
    }
    
    func configureGenderPicker() {
        genderPicker.delegate = self
        genderPicker.dataSource = self
        genderPicker.tintColor = .clear
        genderPicker.backgroundColor = .clear
        addGenderPicker()
    }
    
    func addPickers() {
        configureGenderPicker()
        configureSchoolYearPicker()
        configureEthnicyPicker()
    }
    
    func addSchoolYearPicker() {
        view.addSubview(schoolYearPicker)
        schoolYearPicker.frame = CGRect(x: 10,
                                        y: view.frame.height * 0.50,
                                        width: view.frame.width - 20,
                                        height: view.frame.height * 0.10)
    }
    
    func configureSchoolYearPicker() {
        schoolYearPicker.delegate = self
        schoolYearPicker.dataSource = self
        schoolYearPicker.tintColor = .clear
        schoolYearPicker.backgroundColor = .clear
        addSchoolYearPicker()
    }
    
    func addInterestCollection() {
        view.addSubview(interestCollection)
        interestCollection.frame = CGRect(x: 10,
                                 y: view.frame.height * 0.72,
                                 width: view.frame.width - 20,
                                 height: view.frame.height * 0.17)
    }
    
    func configureCollection() {
        interestCollection.delegate = self
        interestCollection.dataSource = self
    }
    
    func addEthnictyPicker() {
        view.addSubview(ethnicityPicker)
        ethnicityPicker.frame = CGRect(x: 10, y: view.frame.height * 0.60, width: view.frame.width - 20, height: view.frame.height * 0.10)
    }
    
    func configureEthnicyPicker() {
        ethnicityPicker.dataSource = self
        ethnicityPicker.delegate = self
        ethnicityPicker.tintColor = .clear
        ethnicityPicker.backgroundColor = .clear
        
        addEthnictyPicker()
    }
    
    func refresh() {
        view.backgroundColor = .clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    }
    
    func addRegisterButton() {
        view.addSubview(registerButton)
        registerButton.frame = CGRect(x: (view.frame.width / 2) - 75,
                                      y: view.frame.height * 0.91,
                                      width: 150, height: 45)
    }
    
   
    //MARK: - Selectors
    
    @objc func handleRegisterPressed() {
        let creds = userCredentials.init(email: emailTF.text!, password: passwordTF.text!, firstName: nameTF.text!, lastname: nameTF.text!, satScore: Int(satTF.text!) ?? 0, gpa: Double(gpaTF.text!) ?? 0.0, ethnicity: ethnicitySelected, gender: genderSelected, mostEducation: schoolYearSelected, Interests: selectedInterst)
        
        UserServices.shared.registerUser(cred: creds) {
            //print(currentUser.currUser?.token)
            guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
            
            guard let tab = window.rootViewController as? MainTabController else { return }
            
            tab.authenticateUser()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - API
}

extension RegistrationController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == schoolYearPicker {
            return schoolYearData.count
        } else if pickerView == genderPicker {
            return genderData.count
        } else if pickerView == ethnicityPicker {
            return ethnicityData.count
        }
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == schoolYearPicker {
            return schoolYearData[row]
        } else if pickerView == genderPicker {
            genderSelected = genderData[row]
            return genderData[row]
        } else if pickerView == ethnicityPicker {
            return ethnicityData[row]
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == genderPicker {
            genderSelected = genders[row]
        } else if pickerView == schoolYearPicker {
            schoolYearSelected = schoolYears[row]
        } else if pickerView == ethnicityPicker {
            ethnicitySelected = ethnicityData[row]
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerView == genderPicker {
            return NSAttributedString(string: self.genderData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        } else if pickerView == schoolYearPicker {
            return NSAttributedString(string: self.schoolYearData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        } else if pickerView == ethnicityPicker {
            return NSAttributedString(string: self.ethnicityData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        }
        
        return NSAttributedString(string: self.genderData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
    }
}

extension RegistrationController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interstData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = interestCollection.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ChipCell
        cell.chipView.titleLabel.text = interstData[indexPath.row]
        cell.chipView.setTitleColor(UIColor.blue, for: .normal)
        cell.chipView.setBackgroundColor(UIColor.green, for: .selected)
        cell.chipView.contentVerticalAlignment = .center
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let interest = interstData[indexPath.row]
        
        if !(selectedInterst.contains(interest)) {
            selectedInterst.append(interest)
        }
        
        print(interstData[indexPath.row])
        print(selectedInterst)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let interest = interstData[indexPath.row]
        
        let i = selectedInterst.firstIndex(of: interest)!
        
        selectedInterst.remove(at: i)
        
        print(interstData[indexPath.row])
        print(selectedInterst)
    }
    
    
}
