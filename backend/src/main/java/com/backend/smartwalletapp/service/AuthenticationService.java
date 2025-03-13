package com.backend.smartwalletapp.service;

import java.text.ParseException;
import java.util.Date;
import java.util.Optional;
import java.util.StringJoiner;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.backend.smartwalletapp.dto.request.Login.AuthenticationRequest;
import com.backend.smartwalletapp.dto.request.Login.IntrospectRequest;
import com.backend.smartwalletapp.dto.request.Login.RefreshTokenRequest;
import com.backend.smartwalletapp.dto.response.AuthenticationResponse;
import com.backend.smartwalletapp.dto.response.IntrospectResponse;
import com.backend.smartwalletapp.dto.response.RefreshTokenResponse;
import com.backend.smartwalletapp.exception.AppException;
import com.backend.smartwalletapp.exception.ErrorCode;
import com.backend.smartwalletapp.model.RefreshToken;
import com.backend.smartwalletapp.model.User;
import com.backend.smartwalletapp.repository.RefreshTokenRepository;
import com.backend.smartwalletapp.repository.UserRepository;
import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.JWSHeader;
import com.nimbusds.jose.JWSObject;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.Payload;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;

import lombok.AccessLevel;
import lombok.RequiredArgsConstructor;
import lombok.experimental.FieldDefaults;

@Service
@RequiredArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = true)
public class AuthenticationService {
    UserRepository userRepository;
    RefreshTokenRepository refreshTokenRepository;
    PasswordEncoder passwordEncoder;

    protected static final String SECRET_KEY = "1g588fp61K3ru1mWsoT900vsoqykoJs63qAzM2917QKkIAf1ff0WwGHvNu3+vmJ7";

    public IntrospectResponse introspectResponse(IntrospectRequest request)
            throws JOSEException, ParseException {
        var token = request.getToken();
        JWSVerifier verifier = new MACVerifier(SECRET_KEY.getBytes());
        SignedJWT signedJWT = SignedJWT.parse(token);
        Date expirationTime = signedJWT.getJWTClaimsSet().getExpirationTime();
        boolean isVerified = signedJWT.verify(verifier);
        return IntrospectResponse.builder()
                .valid(isVerified && expirationTime.after(new Date()))
                .build();
    }

    public AuthenticationResponse authenticate(AuthenticationRequest request) {
        User user = userRepository.findByUsername(request.getUsername())
                .orElseThrow(() -> new AppException(ErrorCode.USER_NOT_FOUND));

        boolean authenticated = passwordEncoder.matches(request.getPassword(), user.getPassword());
        if (!authenticated)
            throw new AppException(ErrorCode.UNAUTHORIZED);

        String accessToken = generateAccessToken(user);
        String refreshToken = generateRefreshToken(user);

        // Lưu refresh token vào database
        RefreshToken refreshTokenEntity = new RefreshToken();
        refreshTokenEntity.setUser(user);
        refreshTokenEntity.setToken(refreshToken);
        refreshTokenEntity.setExpiryDate(new Date(System.currentTimeMillis() + 7 * 24 * 60 * 60 * 1000)); // 7 ngày

        refreshTokenRepository.save(refreshTokenEntity);

        return AuthenticationResponse.builder()
                .accessToken(accessToken)
                .refreshToken(refreshToken)
                .authenticated(true)
                .build();
    }

    public RefreshTokenResponse refreshToken(RefreshTokenRequest request) {
        String refreshToken = request.getRefreshToken();
        Optional<RefreshToken> optionalRefreshToken = refreshTokenRepository.findByToken(refreshToken);

        if (optionalRefreshToken.isEmpty()) {
            throw new AppException(ErrorCode.UNAUTHORIZED);
        }

        RefreshToken storedToken = optionalRefreshToken.get();
        if (storedToken.getExpiryDate().before(new Date())) {
            refreshTokenRepository.delete(storedToken);
            throw new AppException(ErrorCode.UNAUTHORIZED);
        }

        String newAccessToken = generateAccessToken(storedToken.getUser());
        return RefreshTokenResponse.builder()
                .accessToken(newAccessToken)
                .build();
    }

    private String generateAccessToken(User user) {
        return generateToken(user,10* 15 * 60 * 1000); // 15 phút
    }

    private String generateRefreshToken(User user) {
        return generateToken(user, 7 * 24 * 60 * 60 * 1000); // 7 ngày
    }

    private String generateToken(User user, long expirationTime) {
        JWSHeader jwsHeader = new JWSHeader(JWSAlgorithm.HS256);
        JWTClaimsSet jwtClaimsSet = new JWTClaimsSet.Builder()
                .subject(user.getUsername())
                .issuer("smartwalletapp")
                .issueTime(new Date())
                .expirationTime(new Date(System.currentTimeMillis() + expirationTime))
                .claim("scope", buildScope(user))
                .build();
        Payload payload = new Payload(jwtClaimsSet.toJSONObject());
        JWSObject jwsObject = new JWSObject(jwsHeader, payload);

        try {
            jwsObject.sign(new MACSigner(SECRET_KEY));
            return jwsObject.serialize();
        } catch (Exception e) {
            throw new AppException(ErrorCode.INTERNAL_SERVER_ERROR);
        }
    }

    private String buildScope(User user) {
        StringJoiner stringJoiner = new StringJoiner(" ");
        if (!CollectionUtils.isEmpty(user.getRole())) {
            user.getRole().forEach(stringJoiner::add);
        }
        return stringJoiner.toString();
    }
}
