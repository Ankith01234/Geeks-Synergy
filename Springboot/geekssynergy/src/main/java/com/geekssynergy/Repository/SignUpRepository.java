package com.geekssynergy.Repository;

import com.geekssynergy.Entity.SignUp;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SignUpRepository extends JpaRepository<SignUp,Integer>
{
    Optional<SignUp> findByEmail(String email);
}
