//
//  FAQViewController.swift
//  Citimate
//
//  Created by Hitaishin on 04/03/17.
//  Copyright © 2017 Hitaishin. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var fAQTableView: UITableView!
    
    struct Section
    {
        var name: String!
        var items: [String]!
        var collapsed: Bool!
        
        init(name: String, items: [String], collapsed: Bool = true) {
            self.name = name
            self.items = items
            self.collapsed = collapsed
        }
    }
    
    var sections = [Section]()
   //MARK:- View Life Cycle 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Global.backButton(self)
        
        for _ in 0 ..< 10
        {
            self.sections.append(Section(name: "Lorem ipsum dolor sit er elit lamet?", items:["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."]))
        }
        
        Global.reloadTableViewDataAnimated(self.fAQTableView)
    }
    
    //MARK:- TableView Delegate And DataSource
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sections[section].collapsed!) ? 0 : sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "header") as! FAQTableViewCell
        let label = UILabel(frame: CGRect(x: 0, y: header.frame.size.height - 1, width: header.frame.size.width, height: 1))
        label.text = ""
        label.backgroundColor = Global.hexStringToUIColor("#c3c3c3")
        header.addSubview(label)
        
        header.expandButton.tag = section
        header.titleLabel.text = sections[section].name
        header.expandButton.addTarget(self, action: #selector(FAQViewController.toggleCollapse), for: .touchUpInside)
        header.contentView.backgroundColor = UIColor.white
        //        header.contentView.layer.borderColor = Global.colorWithHexString("DD3B20").CGColor
        //        header.contentView.layer.borderWidth = 2.0
        
        if sections[section].collapsed == true {
            header.expandButton.setImage(UIImage(named: "ic_dropdown"), for: .normal)
            header.dividerLabel.isHidden = false
        }
        else
        {
            header.expandButton.setImage(UIImage(named: "ic_dropdown_up"), for: .normal)
            header.dividerLabel.isHidden = true
        }
        
        return header.contentView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        //        cell.layer.borderColor = UIColor.whiteColor().CGColor
        //        cell.layer.borderWidth = 5.0
        self.fAQTableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        
        cell?.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
        cell?.textLabel?.textColor = Global.hexStringToUIColor("353535")
        cell?.textLabel?.textAlignment = NSTextAlignment.justified
        cell?.backgroundColor = Global.hexStringToUIColor("FFFFFF")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let str : String = sections[section].name
        let height : CGFloat = Global.heightForView(str,font: .systemFont(ofSize: 13),width: GlobalConstant.SCREEN_WIDTH - 50)
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let str : String = sections[indexPath.section].items[indexPath.row]
        let height : CGFloat = Global.heightForView(str,font: .systemFont(ofSize: 13),width: GlobalConstant.SCREEN_WIDTH - 30)
        return height
    }
    
    //MARK:- Custom Button Action
    
    @IBAction func toggleCollapse(sender: UIButton) {
        let section = sender.tag
        let collapsed = sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = !collapsed!
        
        // Reload section
        fAQTableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
