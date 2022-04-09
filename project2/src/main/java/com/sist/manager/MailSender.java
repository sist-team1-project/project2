package com.sist.manager;


import java.util.Properties;
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
}