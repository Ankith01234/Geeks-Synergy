package com.geekssynergy.DTO;

import com.geekssynergy.Entity.SignUp;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SignUpDTO
{
    private String message;
    private SignUp signUp;
}
