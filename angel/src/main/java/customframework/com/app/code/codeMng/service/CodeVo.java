package customframework.com.app.code.codeMng.service;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import customframework.com.cmm.service.DefaultVo;

@Repository
@Scope(value="prototype")
public class CodeVo extends DefaultVo{
    private static final long serialVersionUID = 1L;
}
