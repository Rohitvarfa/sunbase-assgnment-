package com.ex.model;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
public class AuthRequest {
    String login_id;
    String password;
}
