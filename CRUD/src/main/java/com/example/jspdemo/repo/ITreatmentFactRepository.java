package com.example.jspdemo.repo;

import com.example.jspdemo.model.TreatmentFact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface ITreatmentFactRepository extends JpaRepository<TreatmentFact, Long> {
    List<TreatmentFact> findByEmployeeId(Long employeeId);
}
