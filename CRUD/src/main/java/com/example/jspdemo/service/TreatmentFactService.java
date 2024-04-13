package com.example.jspdemo.service;

import com.example.jspdemo.model.TreatmentFact;
import com.example.jspdemo.repo.ITreatmentFactRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TreatmentFactService {

    @Autowired
    ITreatmentFactRepository treatmentFactRepository;

    public List<TreatmentFact> getAllTreatmentFacts() {
        List<TreatmentFact> treatmentFacts = new ArrayList<>();
        treatmentFactRepository.findAll().forEach(treatmentFacts::add);
        return treatmentFacts;
    }

    public TreatmentFact getTreatmentFactById(Long id) {
        return treatmentFactRepository.findById(id).orElse(null);
    }

    public boolean saveOrUpdateTreatmentFact(TreatmentFact treatmentFact) {
        TreatmentFact updatedTreatmentFact = treatmentFactRepository.save(treatmentFact);
        return treatmentFactRepository.findById(updatedTreatmentFact.getId()).isPresent();
    }

    public boolean deleteTreatmentFact(Long id) {
        treatmentFactRepository.deleteById(id);
        return !treatmentFactRepository.findById(id).isPresent();
    }
    public List<TreatmentFact> getTreatmentFactsByEmployeeId(String employeeId) {
        return treatmentFactRepository.findByEmployeeId(employeeId);
    }
}
