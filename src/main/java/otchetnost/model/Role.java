package otchetnost.model;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    SPECIALIST, MANAGER, ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
