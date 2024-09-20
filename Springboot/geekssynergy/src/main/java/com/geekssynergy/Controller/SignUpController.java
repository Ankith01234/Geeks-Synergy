package com.geekssynergy.Controller;

import com.geekssynergy.DTO.SignUpDTO;
import com.geekssynergy.Entity.SignUp;
import com.geekssynergy.Repository.SignUpRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@CrossOrigin("*")
public class SignUpController
{
    @Autowired
    SignUpRepository signUpRepository;

    @PostMapping("/addData")
    public ResponseEntity<?> AddData(@RequestBody SignUp obj)
    {
        Optional<SignUp> S=signUpRepository.findByEmail(obj.getEmail());
        SignUpDTO signUpDTO=new SignUpDTO();
        if(S.isPresent())
        {
            signUpDTO.setSignUp(obj);
            signUpDTO.setMessage("Account already Present");
        }
        else
        {
            signUpDTO.setSignUp(obj);
            signUpDTO.setMessage("Data added successfully");
            signUpRepository.save(obj);
        }
        return new ResponseEntity<>(signUpDTO, HttpStatus.OK);
    }

}
