package com.ex.model;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
public class CreateCustomer {
    private String first_name, last_name, street, address, city, state, email, phone;
}
