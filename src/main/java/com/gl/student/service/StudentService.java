package com.gl.student.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.gl.student.entity.Student;

@Service
public interface StudentService {

	public List<Student> findAll();

	public Student findById(int Id);

	public void save(Student student);

	public void deleteById(int Id);

	public List<Student> searchBy(String name, String department);
}
