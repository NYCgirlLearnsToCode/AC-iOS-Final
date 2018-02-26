//
//  FeedViewController.swift
//  AC-iOS-Final
//
//  Created by Lisa J on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let postTableViewCell = PostTableViewCell()
    private let authService = AuthUserService()
    private let feedView = FeedView()
    private let uploadVC = UploadViewController()
    
    private var posts = [Post](){
        didSet {
            DispatchQueue.main.async {
                self.feedView.tableView.reloadData()
            }
        }
    }
    
    private var users = [MeatlyUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(feedView)
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
        postTableViewCell.postCaption.delegate = self
        configureNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //MARK: checks if user is signed in or not
        if AuthUserService.getCurrentUser() == nil {
            let loginVC = LoginViewController()
            self.present(loginVC, animated: false, completion: nil)
        } else {
            loadAllPosts()
            loadAllUsers() // HEREEEEE
        }
    
    }
    
    
    
    private func configureNavBar() {
        navigationItem.title = "Feed"
        let logoutBarItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: #selector(logout))
        navigationItem.rightBarButtonItem = logoutBarItem
    }
    
    @objc private func logout() {
        let alertView = UIAlertController(title: "Are you sure you want to Logout?", message: nil, preferredStyle: .alert)
        let yesOption = UIAlertAction(title: "Yes", style: .destructive) { (alertAction) in
            self.authService.signOut()
            let loginVC = LoginViewController()
            self.present(loginVC, animated: true, completion: nil)
        }
        let noOption = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertView.addAction(yesOption)
        alertView.addAction(noOption)
        present(alertView, animated: true, completion: nil)
    }
    
    private func loadAllPosts() {
        DBService.manager.loadAllPosts { (posts) in
            if let posts = posts {
                self.posts = posts
            } else {
                print("error loading posts")
            }
        }
    }
    
    private func loadAllUsers() {
        DBService.manager.loadAllUsers { (users) in
            if let users = users {
                self.users = users
            } else {
                print("error loading users")
            }
        }
    }
    
}
extension FeedViewController: UITextViewDelegate {
    func adjustUITextViewHeight(arg : UITextView)
    {
        //arg.translatesAutoresizingMaskIntoConstraints = true
        postTableViewCell.postImageView.contentMode = .scaleAspectFill
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UIScreen.main.bounds.height * 4/5
//    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var numOfSections: Int = 0
        if posts.count > 0 {
            feedView.tableView.backgroundView = nil
            feedView.tableView.separatorStyle = .singleLine
            numOfSections = 1
        } else {
            let noDataLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: feedView.tableView.bounds.size.width, height: feedView.tableView.bounds.size.height))
            noDataLabel.text = "No Posts Yet"
            noDataLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
            noDataLabel.textAlignment = .center
            feedView.tableView.backgroundView = noDataLabel
            feedView.tableView.separatorStyle = .none
        }
        return numOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            feedView.tableView.dequeueReusableCell(withIdentifier: "Post Cell", for: indexPath) as! PostTableViewCell
        let post = posts.reversed()[indexPath.row]
        //cell.backgroundColor = .blue
        cell.configurePostCell(post: post)
//        cell.postCaption.text = post.caption
        print("cell configured",post.postImageStr)
        return cell
    }
}
extension FeedViewController: AuthUserServiceDelegate {
    func didSignOut(_ userService: AuthUserService) {
        let loginVC = LoginViewController()
        self.present(loginVC, animated: true) {
            let tabBarController: UITabBarController = self.tabBarController! as UITabBarController
            tabBarController.selectedIndex = 0
        }
    }
}
