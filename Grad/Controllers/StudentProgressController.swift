//
//  StudentProgressController.swift
//  Grad
//
//  Created by Oscar Garcia Vazquez on 10/9/20.
//

import UIKit

class StudentProgressController : UIViewController {
    //MARK: - Properties
    
    private let colors = Colors()
    
    private let checkList : UITableView = {
        let tv = UITableView()
        
        return tv
    }()
    
    private let notificationLabel : UILabel = {
        let label = UILabel()
        label.text = "General Checklist To Go To College"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        return label
    }()
    
    private var check = [[objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Submit FAFSHA", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Started Looking for scholarships", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Create a list of reach, match, saftey colleges?", done: false)],
                         [objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Taken ACT", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Taken SAT", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Talked To Guidance Counsler", done: false),
                         objectives(image: #imageLiteral(resourceName: "Gradpw"), title: "Get Transcripts", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Talk to admissions at your choice schools (call or email)", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Find out application deadlines", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Get applications", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Found out if admission test is required", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Find people to write you letters of recommendations", done: false)],
                         [objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Call admissions to see if they have tours", done: false),
                          objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Check out schools social media accounts.", done: false),
                          objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Call department/major that you're interested in ", done: false),
                          objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Make a pros and cons list for each school", done: false)],
                         [objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Sent application", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Sent transcripts", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Sent Letters of recommendation", done: false),
                         objectives(image: #imageLiteral(resourceName: "GradSAT"), title: "Send thank you notes to recommendation writters", done: false)]]
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        refresh()
        print("DEBUG: Entered Student Progress")
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        setUpCheckList()
    }
    
    func setUpCheckList() {
        view.addSubview(notificationLabel)
        notificationLabel.frame = CGRect(x: 0,
                                         y: view.frame.width * 0.10,
                                         width: view.frame.width,
                                         height: view.frame.height * 0.10)
        
        checkList.delegate = self
        checkList.dataSource = self
        checkList.rowHeight = 60
        checkList.separatorStyle = .singleLine
        checkList.backgroundColor = .clear
        
        view.addSubview(checkList)
        checkList.frame = CGRect(x: 0, y: view.frame.height * 0.20, width: view.frame.width, height: view.frame.height * 0.60)
    }
    
    func refresh() {
        view.backgroundColor = .clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    }
    
    let headerTitles = ["Finacial Aid/Scholarships", "Gather Application Items",
                        "Looking For Schools", "Submitting Applications"]
    
    //MARK: - Selectors
    
    //MARK: - API
}

extension StudentProgressController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        
        return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return check[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = check[indexPath.section][indexPath.row].title
        cell.imageView?.image = check[indexPath.section][indexPath.row].image
        
        if check[indexPath.section][indexPath.row].done {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .clear
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("lol")
    }
    
   
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if self.check[indexPath.section][indexPath.row].done {
            let doneAction = UIContextualAction(style: .normal, title: "Mark as Incomplete", handler: {
                (ac: UIContextualAction, view: UIView, success: (Bool) -> Void) in
                
                print("unDone")
                self.check[indexPath.section][indexPath.row].done = !self.check[indexPath.section][indexPath.row].done
                let cell = (tableView.cellForRow(at: indexPath))!
                cell.backgroundColor = .clear
                success(true)
            })
            doneAction.backgroundColor = .blue
            return UISwipeActionsConfiguration(actions: [doneAction])
        } else {
            let doneAction = UIContextualAction(style: .normal, title: "Mark as Complete", handler: {
                (ac: UIContextualAction, view: UIView, success: (Bool) -> Void) in
                
                print("Done")
                self.check[indexPath.section][indexPath.row].done = !self.check[indexPath.section][indexPath.row].done
                let cell = (tableView.cellForRow(at: indexPath))!
                
                cell.backgroundColor = .green
                
                success(true)
            })
            doneAction.backgroundColor = .green
            return UISwipeActionsConfiguration(actions: [doneAction])
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
