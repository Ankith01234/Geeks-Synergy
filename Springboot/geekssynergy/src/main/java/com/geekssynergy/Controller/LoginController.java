package com.geekssynergy.Controller;

import com.geekssynergy.DTO.LoginDTO;
import com.geekssynergy.DTO.LoginDetails;
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
public class LoginController
{

    @Autowired
    SignUpRepository signUpRepository;

    @PostMapping("/loginChk")
    public ResponseEntity<?> LoginCheck(@RequestBody LoginDetails obj)
    {
        Optional<SignUp> S=signUpRepository.findByEmail(obj.getEmail());
        LoginDTO loginDTO=new LoginDTO();
        if(S.isPresent())
        {
            SignUp signUp=S.get();
            if(signUp.getPassword().equals(obj.getPassword()))
            {
                loginDTO.setLoginDetails(obj);
                loginDTO.setMessage("Correct Password");
            }
            else
            {
                loginDTO.setLoginDetails(obj);
                loginDTO.setMessage("Incorrect Password");
            }
        }
        else
        {
            loginDTO.setLoginDetails(obj);
            loginDTO.setMessage("Account doesn't Exists");
        }
        return new ResponseEntity<>(loginDTO, HttpStatus.OK);
    }

}
