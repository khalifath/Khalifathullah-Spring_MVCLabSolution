package com.gl.student.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.gl.student.entity.Student;
import com.gl.student.service.StudentService;



@Controller
@RequestMapping("/students")
public class StudentController {

	@Autowired
	private StudentService studentService;

	@RequestMapping("/list")
	public String listStudents(Model theModel) {

		// get Books from db
		List<Student> student = studentService.findAll();

		// add to the spring model
		theModel.addAttribute("Students", student);

		return "list-Students";
	}

	@RequestMapping("/addStudent")
	public String addStudent(Model theModel) {

		Student student = new Student();
		theModel.addAttribute("Student", student);
		return "Student-form";
	}

	@RequestMapping("/updateStudent")
	public String updateStudent(@RequestParam("studentId") int theId,
			Model theModel) {

		Student student = studentService.findById(theId);
		theModel.addAttribute("Student", student);
		return "Student-form";			
	}


	@PostMapping("/save")
	public String saveStudent(@RequestParam("id") int id,
			@RequestParam("name") String name,@RequestParam("department") String department,@RequestParam("country") String country) {

		System.out.println(id);
		Student student;
		if(id!=0)
		{
			student=studentService.findById(id);
			student.setName(name);
			student.setDepartment(department);
			student.setCountry(country);
		}
		else
			student=new Student(name, department, country);

		// save the Student
		studentService.save(student);
		// use a redirect to prevent duplicate submissions
		return "redirect:/students/list";

	}


	@RequestMapping("/delete")
	public String delete(@RequestParam("studentId") int Id) {

		// delete the student
		studentService.deleteById(Id);

		// redirect to /student/list
		return "redirect:/students/list";

	}


	@RequestMapping("/search")
	public String search(@RequestParam("name") String name,
			@RequestParam("department") String department,
			Model theModel) {

		if (name.trim().isEmpty() && department.trim().isEmpty()) {
			return "redirect:/students/list";
		}
		else {
			List<Student> student=
					studentService.searchBy(name, department);

			theModel.addAttribute("Students", student);
			return "list-Students";
		}

	}
}
