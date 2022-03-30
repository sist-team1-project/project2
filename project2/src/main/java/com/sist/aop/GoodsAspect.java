package com.sist.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class GoodsAspect {
    
    @Around("execution(* com.sist.web.*Controller.*(..))")
    public Object around(ProceedingJoinPoint jp) {
        Object obj = null;
        // 트랜잭션, 로그 (시간)
        try {
            long start = System.currentTimeMillis();
            System.out.println("메소드 실행 시작전:" + jp.getSignature());
            obj = jp.proceed(); // 메소드 호출 
            System.out.println("메소드 수행 종료...");
            long end = System.currentTimeMillis();
            System.out.println("메소드 수행 시간:" + (end - start));
        } catch (Throwable ex) {
        }
        return obj;
    }
}