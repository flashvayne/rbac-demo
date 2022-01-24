package com.github.flashvayne.demo.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * LoginDTO
 *
 * @author flashvayne
 */
@Data
public class LoginDTO {
    @NotBlank
    private String userId;
    @NotBlank
    private String password;
}
