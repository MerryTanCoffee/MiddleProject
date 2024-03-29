package member.dao;

import java.util.List;
import java.util.Map;

import member.vo.MemberVO;

public interface IMemberDao {
	public int insertMember(MemberVO mv);
	
	public String checkMember(Map<String, Object> map);
	
	public MemberVO getMember(String memId);
	
	public int updateMember(MemberVO mv);
	
	public int updateMemberAll(MemberVO mv);
	
	public int deleteMember(String memId);
	
	public List<MemberVO> selectAllMember();
	
	public List<MemberVO> searchMember(MemberVO mv);

	public int updatePw(MemberVO mv);
}
