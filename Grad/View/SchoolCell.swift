//
//  SchoolCell.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/10/20.
//

import UIKit
import Charts


protocol SchoolCellDelegate: class {
    func handleURLTapped(_ cell: SchoolCell)
}

class SchoolCell : UICollectionViewCell {
    //MARK: - Properties
    
    private let ethnicities = ["asian", "caucasian", "black",
                               "hispanic", "islander", "other"]
    private let percents = [12.0, 73.0, 6.0, 3.0, 3.0, 3.0]
    
    var school : school? {
        didSet {
            configure()
        }
    }
    
    weak var delegate : SchoolCellDelegate?
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    private let addressLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        
        return label
    }()
    
    private let addmissionRateLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    public let schoolLink : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    private let tution : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    private let satLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    private let actLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    private let gpaLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    private let DemographicsLabel : UIView = {
        let view = UIView()
        
        return view
    }()
    
    private let maleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    private let femaleLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    private let ageLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    private let firstGenerationLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        alpha = 0.5
        configureCellElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureCellElements() {
        contentView.isUserInteractionEnabled = false
        addDemographics()
        configureNameLabel()
        configureAdmissionsLabels()
        configureSchoolLink()
        
    }
    
    func configureNameLabel() {
        addSubview(nameLabel)
        nameLabel.frame = CGRect(x: frame.width / 6,
                                 y: -15,
                                 width: frame.width / 1.5,
                                 height: frame.height * 0.10)
        
        addSubview(addressLabel)
        addressLabel.frame = CGRect(x: 0, y: frame.height * 0.02, width: frame.width, height: frame.height * 0.08)
    }
    
    func configureAdmissionsLabels() {
        let stack = UIStackView(arrangedSubviews: [gpaLabel,satLabel,
                                                   actLabel,addmissionRateLabel])
        stack.spacing = 0
        stack.distribution = .fillProportionally
        stack.axis = .horizontal
        addSubview(stack)
        stack.frame = CGRect(x: 1, y: frame.height * 0.06, width: frame.width - 2, height: frame.height * 0.10)
    }
    
    func configureSchoolLink() {
        addSubview(schoolLink)
        schoolLink.frame = CGRect(x: 0,
                                  y: frame.height * 0.90,
                                  width: frame.width,
                                  height: frame.height * 0.10)
    }
    
    func addDemographics() {
        settingUpChart()
        addTuition()
    }
    
    
    func settingUpChart() {
        let chart = PieChartView(frame: DemographicsLabel.frame)
        
        var entries = [PieChartDataEntry]()
        
        for (index, value) in percents.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value
            entry.label = ethnicities[index]
            entries.append(entry)
        }
        
        let set = PieChartDataSet(entries: entries, label: "Demographics")
        var colors = [UIColor]()
        
        for _ in 0...ethnicities.count - 1 {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 233), alpha: 1)
            colors.append(color)
        }
        
        set.colors = colors
        let data = PieChartData(dataSet: set)
        chart.data = data
        chart.noDataText = "No data available"
        chart.isUserInteractionEnabled = true
        
        chart.holeRadiusPercent = 0.2
        chart.transparentCircleColor = UIColor.clear
        addSubview(chart)
        chart.frame = CGRect(x: (frame.width / 2) - 190,
                             y: frame.height * 0.12,
                             width: 380, height: 380)
    }
    
    func addTuition() {
        let stack = UIStackView(arrangedSubviews: [ageLabel, firstGenerationLabel])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 0
        addSubview(stack)
        stack.frame = CGRect(x: 0, y: frame.height * 0.73, width: frame.width, height: frame.height * 0.10)
        
        let otherStack = UIStackView(arrangedSubviews: [maleLabel, tution, femaleLabel])
        otherStack.axis = .horizontal
        otherStack.spacing = 0
        otherStack.distribution = .fillProportionally
        addSubview(otherStack)
        otherStack.frame = CGRect(x: 0, y: frame.height * 0.83, width: frame.width, height: frame.height * 0.10)
    }
    //MARK: - Selectors
    
    @objc func handleURLTapped() {
        print("please")
        delegate?.handleURLTapped(self)
    }
    
    //MARK: - API
    func configure() {
        guard let school = school else { return }
        let viewModel = SchoolCellViewModel(currentschool: school)
        let numberFormater = NumberFormatter()
        numberFormater.numberStyle = .decimal
        numberFormater.groupingSize = 3
        nameLabel.text = viewModel.name
        addressLabel.text = "\(viewModel.city), \(viewModel.state)"
        gpaLabel.text = "GPA \n\(viewModel.typcialGPA)"
        satLabel.text = "SAT \n\(viewModel.typicalSAT)"
        actLabel.text = "ACT \n\(viewModel.typicalACT)"
        addmissionRateLabel.text = "Acceptance\n\(viewModel.addmissonRate)%"
        
        tution.text = "Annual Tuition \n$\(String(describing: numberFormater.string(from: NSNumber(value: viewModel.tution))!))"
        maleLabel.text = "Male Population\n \(viewModel.male)%"
        femaleLabel.text = "Female Population \n \(viewModel.female)%"
        ageLabel.text = "Average Enrollment Age \n \(viewModel.age)"
        firstGenerationLabel.text = "First Generation Population \n \(viewModel.firstGen)%"
        
        schoolLink.text = viewModel.website
        
    }
}
