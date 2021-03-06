//
//  CoursesViewController.swift
//  Networking
//
//  Created by Жадаев Алексей on 10.08.2021.
//

import UIKit

class CoursesViewController: UIViewController {
    
    private var courses = [Course]()
    private var courseName: String?
    private var courseUrl: String?
    private let url = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchData()
    }
    
    func fetchData() {
        NetworkManager.fetchCourses(url: url) { courses in
            self.courses = courses
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func configureCell(cell: CoursesTableViewCell, for IndexPath: IndexPath) {
        let course = courses[IndexPath.row]
        cell.courseName.text = course.name
        if let numberOfLessons = course.numberOfLessons {
            cell.lessonsNumber.text = "Number of lessons: \(numberOfLessons)"
        }
        if let numberOfTests = course.numberOfTests {
            cell.testsNumber.text = "Number of tests: \(numberOfTests)"
        }
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: course.imageUrl!) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                cell.courseImage.image = UIImage(data: imageData)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webViewController = segue.destination as! DescriptionViewController
        webViewController.courseName = courseName
        if let course = courseUrl {
            webViewController.courseUrl = course
        }
    }
}

extension CoursesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdForCoursesCell") as! CoursesTableViewCell
        configureCell(cell: cell, for: indexPath)
        return cell
    }
    
    
}

extension CoursesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = courses[indexPath.row]
        courseName = course.name
        courseUrl = course.link
        
        performSegue(withIdentifier: "courseDescriptionSegue", sender: self)
    }
}
