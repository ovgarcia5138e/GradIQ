//
//  SchoolOptionsController.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/10/20.
//

import UIKit
import SafariServices

private let reuseIdentifier = "SchoolCell"

class SchoolOptionsController : UICollectionViewController {
    //MARK: - Properties
    private var schoolCollectionData = [school]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        print("DEBUG: Collection View")
        super.viewDidLoad()
        configureUI()
        fetchSchools()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        collectionView.register(SchoolCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .cyan
    }
    
    func fetchSchools() {
        let practice = [school.init(name: "Floria Gulf Coast University", addmissionRates: 53, typicalGPA: 3.5, typicalSAT: 1200, typicalACT: 28,schoolLink: "https://www.fgcu.edu/", tutition: 10000, city: "Fort Myers", state: "Florida", male: 54.3, female: 43.2, age: 19, firstGeneration: 21.3), school.init(name: "Clemson University", addmissionRates: 34, typicalGPA: 3.8, typicalSAT: 1350, typicalACT: 29 ,schoolLink: "https://www.clemson.edu/", tutition: 53208, city: "Clemson", state: "South Carolina", male: 56.3, female: 32.4, age: 18, firstGeneration: 12.4), school.init(name: "University of Florida", addmissionRates: 24, typicalGPA: 3.9, typicalSAT: 1432, typicalACT: 31, schoolLink: "https://www.ufl.edu/", tutition: 42354, city: "Gainsville", state: "Florida", male: 45.2,female: 34.6, age: 20, firstGeneration: 65.3), school.init(name: "Georgia Tech", addmissionRates: 30.3, typicalGPA: 3.6, typicalSAT: 1385, typicalACT: 31, schoolLink: "https://www.gatech.edu/", tutition: 34821, city: "Athens", state: "Georgia",male: 45.3, female: 23.2, age: 19, firstGeneration: 9.2)]
        
        schoolCollectionData = practice
    }
    
    //MARK: - Selectors
    
    //MARK: - API
}

extension SchoolOptionsController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return schoolCollectionData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SchoolCell
        
        cell.delegate = self
        cell.school = schoolCollectionData[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let svc = SFSafariViewController(url: URL(string: schoolCollectionData[indexPath.row].schoolLink)!)
        present(svc, animated: true, completion: nil)
    }
}

extension SchoolOptionsController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height / 1.3)
    }
}

extension SchoolOptionsController : SchoolCellDelegate {
    func handleURLTapped(_ cell: SchoolCell) {
        print("Cell tabbed")
    }
}
