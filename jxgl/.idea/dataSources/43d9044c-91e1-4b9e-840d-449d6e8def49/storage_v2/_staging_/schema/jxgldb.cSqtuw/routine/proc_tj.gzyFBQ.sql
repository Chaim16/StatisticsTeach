create
    definer = root@localhost procedure proc_tj(IN p_nd int(4), IN p_gh char(8)) comment '统计一个教师某年度的工作量'
BEGIN
  DECLARE  t_nd INT(4);
  DECLARE  t_gh CHAR(8);             
  DECLARE  t_xm VARCHAR(20);        
  DECLARE  t_zw VARCHAR(10);        
  DECLARE  t_yxmc VARCHAR(50);      
  DECLARE  t_edgzl FLOAT(8,1);       
  DECLARE  t_bkszdsk FLOAT(8,1);    
  DECLARE  t_bksktgzl FLOAT(8,1);   
  DECLARE  t_bkssjgzl FLOAT(8,1);   
  DECLARE  t_zlgcgzl FLOAT(8,1);    
  DECLARE  t_jxcggzl FLOAT(8,1);    
  DECLARE  t_bkszxxmgzl FLOAT(8,1); 
  DECLARE  t_bkshxxmgzl FLOAT(8,1); 
  DECLARE  t_jcgzl FLOAT(8,1);      
  DECLARE  t_jxgggzl FLOAT(8,1);    
  DECLARE  t_bksjsgzl FLOAT(8,1);   
  DECLARE  t_jsjsgzl FLOAT(8,1);    
  DECLARE  t_bkslwgzl FLOAT(8,1);   
  DECLARE  t_bksqtgzl FLOAT(8,1);   
  DECLARE  t_bkszgzl FLOAT(8,1);    
  DECLARE  t_yjsktjxgzl FLOAT(8,1); 
  DECLARE  t_yjssjjxgzl FLOAT(8,1); 
  DECLARE  t_xkjsgzl FLOAT(8,1);    
  DECLARE  t_yjsjyxmgzl FLOAT(8,1); 
  DECLARE  t_yjshxxmgzl FLOAT(8,1); 
  DECLARE  t_yjslwgzl FLOAT(8,1);   
  DECLARE  t_yjsjsgzl FLOAT(8,1);   
  DECLARE  t_yjsqtgzl FLOAT(8,1);   
  DECLARE  t_yjszgzl FLOAT(8,1);    
  DECLARE  t_sjjxgzl FLOAT(8,1);    
  DECLARE  t_bkshskwwc FLOAT(8,1);  
  DECLARE  t_edjxwwc FLOAT(8,1);    

  DECLARE  v_not_found INT DEFAULT 0; 
  DECLARE  cur_jbxx CURSOR FOR 
     SELECT nd,jbxx.gh,uname,zwmc,yxmc,edgzl,bkszdsk
     FROM   jbxx,yxbm,zwbm,users
     WHERE jbxx.yxbm=yxbm.yxbm AND 
           jbxx.gh=users.gh AND
           jbxx.zwbm=zwbm.zwbm AND 
           jbxx.nd=p_nd AND
           jbxx.gh=p_gh;
             
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_not_found=1;

    
  DELETE FROM tjb  WHERE gh=p_gh AND nd=p_nd;
  OPEN cur_jbxx;
  FETCH cur_jbxx INTO t_nd,t_gh,t_xm,t_zw,t_yxmc,t_edgzl,t_bkszdsk; 
  WHILE v_not_found=0 DO  
        
    SELECT SUM(jxgzl) INTO t_bksktgzl FROM bksktjx WHERE gh=t_gh AND nd=p_nd;    
    IF (t_bksktgzl IS NULL) THEN
        SET t_bksktgzl=0;    
    END IF;     
    
    SELECT SUM(gzl)   INTO t_bkssjgzl   FROM bkssjjx WHERE gh=t_gh AND nd=p_nd;    
    IF (t_bkssjgzl IS NULL) THEN
       SET t_bkssjgzl=0;    
    END IF; 
    
    SELECT SUM(gzl)   INTO t_zlgcgzl    FROM zlgc WHERE gh=t_gh AND nd=p_nd;    
    IF (t_zlgcgzl IS NULL) THEN
        SET t_zlgcgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_jxcggzl    FROM jxcg WHERE gh=t_gh AND nd=p_nd;
    IF (t_jxcggzl IS NULL) THEN
        SET t_jxcggzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_bkszxxmgzl FROM zxxm WHERE gh=t_gh AND nd=p_nd;
    IF (t_bkszxxmgzl IS NULL) THEN
        SET t_bkszxxmgzl=0;    
    END IF; 
    
    SELECT SUM(gzl)   INTO t_bkshxxmgzl FROM hxxm WHERE gh=t_gh AND nd=p_nd;
    IF (t_bkshxxmgzl IS NULL) THEN
        SET t_bkshxxmgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_jcgzl FROM jc WHERE gh=t_gh AND nd=p_nd;
    IF (t_jcgzl IS NULL) THEN
        SET t_jcgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_jxgggzl FROM jxgg WHERE gh=t_gh AND nd=p_nd;
    IF (t_jxgggzl IS NULL) THEN
        SET t_jxgggzl=0;    
    END IF; 
    
    SELECT SUM(gzl)   INTO t_bksjsgzl FROM zdxsjs WHERE jsxscc=1 AND gh=t_gh AND nd=p_nd;
    IF (t_bksjsgzl IS NULL) THEN
        SET t_bksjsgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_jsjsgzl FROM jsjs WHERE gh=t_gh AND nd=p_nd; 
    IF (t_jsjsgzl IS NULL) THEN
       SET t_jsjsgzl=0;     
    END IF;  
    
    SELECT SUM(gzl)   INTO t_bkslwgzl FROM zdxslw WHERE gh=t_gh AND nd=p_nd;
    IF (t_bkslwgzl IS NULL) THEN
        SET t_bkslwgzl=0;
    END IF; 
    
    SELECT SUM(qtgzl) INTO t_bksqtgzl FROM qtjxgz WHERE gh=t_gh AND nd=p_nd;
    IF (t_bksqtgzl IS NULL) THEN
        SET t_bksqtgzl=0;
    END IF; 
    
    SET t_bkszgzl=t_bksktgzl+t_bkssjgzl+t_zlgcgzl+t_jxcggzl+ 
                  t_bkszxxmgzl+t_bkshxxmgzl+t_jcgzl+t_jxgggzl+
                  t_bksjsgzl+t_jsjsgzl+t_bkslwgzl+t_bksqtgzl;     
    
    SELECT SUM(gzl)   INTO t_yjsktjxgzl FROM yjsktjx WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjsktjxgzl IS NULL) THEN
        SET t_yjsktjxgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_yjssjjxgzl FROM yjssjjx WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjssjjxgzl IS NULL) THEN
        SET t_yjssjjxgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_xkjsgzl  FROM jbjsyxkjs WHERE gh=t_gh AND nd=p_nd;
    IF (t_xkjsgzl IS NULL) THEN
        SET t_xkjsgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_yjsjyxmgzl FROM yjsjyxm WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjsjyxmgzl IS NULL) THEN
        SET t_yjsjyxmgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_yjshxxmgzl FROM yjshxxm WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjshxxmgzl IS NULL) THEN
        SET t_yjshxxmgzl=0;
    END IF; 
    
    SELECT SUM(gzl)  INTO t_yjslwgzl  FROM zdsslw WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjslwgzl IS NULL) THEN
        SET t_yjslwgzl=0;
    END IF; 
    
    SELECT SUM(gzl)   INTO t_yjsjsgzl FROM zdxsjs WHERE jsxscc=2 AND gh=t_gh AND nd=p_nd;
    IF (t_yjsjsgzl IS NULL) THEN
        SET t_yjsjsgzl=0;
    END IF; 
    SELECT SUM(gzl)   INTO t_yjsqtgzl FROM yjsqtjx WHERE gh=t_gh AND nd=p_nd;
    IF (t_yjsqtgzl IS NULL) THEN
        SET t_yjsqtgzl=0;
    END IF; 
 
   
    SET t_yjszgzl=t_yjsktjxgzl+t_yjssjjxgzl+t_xkjsgzl+t_yjsjyxmgzl+
                  t_yjshxxmgzl+t_yjslwgzl+t_yjsjsgzl+t_yjsqtgzl;
 
    
    SET t_sjjxgzl=t_bkszgzl+t_yjszgzl;

    
    SET t_bkshskwwc=t_bkszdsk-t_bksktgzl;
    IF t_bkshskwwc<0 THEN
     SET t_bkshskwwc=0; 
    END IF;
        
    SET t_edjxwwc=t_edgzl-t_sjjxgzl;    
    IF t_edjxwwc<0 THEN
       SET t_edjxwwc=0;
    END IF;
    INSERT INTO tjb(nd,gh,xm,zw,yxmc,edgzl,bkszdsk,bksktgzl,bkssjgzl,zlgcgzl,jxcggzl,bkszxxmgzl,
                bkshxxmgzl,jcgzl,jxgggzl,bksjsgzl,jsjsgzl,bkslwgzl,bksqtgzl,bkszgzl,yjsktjxgzl,
                jsjsjjxgzl,xkjsgzl,yjsjyxmgzl,yjshxxmgzl,yjslwgzl,yjsjsgzl,yjsqtgzl,yjszgzl,sjjxgzl,
                bksskwwc,edjxwwc)
    VALUES(t_nd,t_gh,t_xm,t_zw,t_yxmc,t_edgzl,t_bkszdsk,t_bksktgzl,t_bkssjgzl,t_zlgcgzl,t_jxcggzl,
           t_bkszxxmgzl,t_bkshxxmgzl,t_jcgzl,t_jxgggzl,t_bksjsgzl,t_jsjsgzl,t_bkslwgzl,t_bksqtgzl,
           t_bkszgzl,t_yjsktjxgzl,t_yjssjjxgzl,t_xkjsgzl,t_yjsjyxmgzl,t_yjshxxmgzl,t_yjslwgzl,
           t_yjsjsgzl,t_yjsqtgzl,t_yjszgzl,t_sjjxgzl,t_bkshskwwc,t_edjxwwc);
  
 FETCH cur_jbxx INTO t_nd,t_gh,t_xm,t_zw,t_yxmc,t_edgzl,t_bkszdsk; 
  END WHILE;  
  CLOSE cur_jbxx; 
END;

