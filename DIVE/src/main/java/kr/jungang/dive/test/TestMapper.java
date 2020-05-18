package kr.jungang.dive.test;

import org.apache.ibatis.annotations.Select;

public interface TestMapper {
	@Select("SELECT sysdate FROM dual")
	public String getTime();
	
	public String getTime2();
}
