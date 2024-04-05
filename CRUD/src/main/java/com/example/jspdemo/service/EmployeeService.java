package com.example.jspdemo.service;

import com.example.jspdemo.model.Employee;
import com.example.jspdemo.repo.IEmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    IEmployeeRepository employeerepo;
    public List<Employee> getEmployeesByFio(String fio) {
        return employeerepo.findByFio(fio);
    }
    public List<Employee> getAllEmployees(){
    List<Employee> employeeList = new ArrayList<>();
    employeerepo.findAll().forEach(employee -> employeeList.add(employee));
        return  employeeList;
}
public Employee getEmployeeById(Long id){
    return employeerepo.findById(id).get();
}
public boolean saveOrUpdateEmployee(Employee employee) {
    Employee updatedEmployee = employeerepo.save(employee);
    if (employeerepo.findById(updatedEmployee.getId()) != null) {
        return true;
    }
    return false;
}
    public boolean deleteEmployee(Long id) {
       employeerepo.deleteById(id);
        if (employeerepo.findById(id) != null) {
            return true;
        }
        return false;
    }
}
