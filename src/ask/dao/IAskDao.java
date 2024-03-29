package ask.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import ask.vo.AskVO;

// DB와 연결하여 SQL문을 수행하는 DAO 인터페이스 

public interface IAskDao {
   
   public int insertAsk (AskVO av);
   // AskVO에 담겨진 데이터를 DB에 insert하기 위한 메서드

   public boolean checkAsk(int askNo);
   // 해당하는 공지사항 정보가 있는지 체크하기 위한 메서드
   
   public int updateAsk (AskVO av);
   // AskVO에 담겨진 데이터를 DB에 update하기 위한 메서드
   
   public int deleteAsk (int askNo);
   // 문의사항 삭제를 위한 메서드
   
   public List<AskVO> selectAllAsk();
   // DB에 존재하는 모든 공지사항 정보를 조회하기 위한 메서드 여러 건수가 나올 수 있으니 List로 출력
   
   public List<AskVO> searchAsk(AskVO av);
   // 검색할 데이터에 해당하는 공지사항 목록을 조회하기 위한 메서드

   public int countList() throws SQLException;

   public String loginChk(Map<String, Object> map) throws SQLException;

   public List<AskVO> askList(Map<String, Object> map2) throws SQLException;

   public AskVO getAsk (int askNo);

   public List<AskVO> getMemId(String memId);

   
}