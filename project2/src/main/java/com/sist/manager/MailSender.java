package com.sist.manager;

import java.util.*;
import java.security.SecureRandom;
import javax.mail.*;
import javax.mail.internet.*;

import com.sist.vo.*;

public class MailSender {
    
    static final String HOST = "smtp.naver.com"; // SMTP 서버 정보를 설정
    static final String USER = "sist_team1@naver.com"; // 네이버 계정
    static final String PASSWORD = "sist_team1!"; // 패스워드 
    
    public void joinMailSend(UserVO vo) {
        
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USER, PASSWORD);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USER));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getU_email())); // 메일 수신자
            message.setSubject(vo.getU_name() + "님 힐링 캠프 가입을 환영합니다", "EUC-KR"); // 메일 제목

            String html = "<div style=\"text-align:center\"><h4>" + vo.getU_name() + "님 힐링 캠프에 가입하신 것을 환영합니다!</h4></div>" // 메일 내용
                        + "<div style=\"text-align:center\"><img src=\"https://user-images.githubusercontent.com/70963337/162582923-6d7dd9c5-f18e-4652-9018-59030db3dd6e.png\"></div>";

            message.setContent(html, "text/html; charset=EUC-KR"); 
            Transport.send(message);
            System.out.println("메시지 전송 완료");
        } catch (MessagingException e) {
            System.err.println("메시지 전송 실패");
        }
    }
    
    public String resetPwdMailSend(UserVO vo) {
        
        String newPassword = getRamdomPassword(8);
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USER, PASSWORD);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USER));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getU_email())); // 메일 수신자
            message.setSubject(vo.getU_name() + "님 비밀번호를 초기화하였습니다.", "EUC-KR"); // 메일 제목
        
            String html = "<div style=\"text-align:center\"><h4>" + "새로운 비밀번호는 " + newPassword + " 입니다.</h4></div>"; // 메일 내용
            
            message.setContent(html, "text/html; charset=EUC-KR"); 
            Transport.send(message);
            System.out.println("메시지 전송 완료");
        } catch (MessagingException e) {
            System.err.println("메시지 전송 실패");
        }
        
        return newPassword;
    }
    
    public String getRamdomPassword(int size) {
        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
                'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&' };
        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());
        int idx = 0;
        int len = charSet.length;
        for (int i = 0; i < size; i++) {
            idx = sr.nextInt(len); // 강력한 난수를 발생시키기 위해 SecureRandom을 사용
            sb.append(charSet[idx]);
        }
        return sb.toString();
    }
}