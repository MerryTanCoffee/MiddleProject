package notice.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import notice.vo.NoticeVO;

// DB와 연결하여 SQL문을 수행하는 DAO 인터페이스 

public interface INoticeDao {
   
   public int insertNotice (NoticeVO nv);
   // NoticeVO에 담겨진 데이터를 DB에 insert하기 위한 메서드

   public boolean checkNotice(int noticeNo);
   // 해당하는 공지사항 정보가 있는지 체크하기 위한 메서드
   
   public int updateNotice(NoticeVO nv);
   // NoticeVO에 담겨진 데이터를 DB에 update하기 위한 메서드
   
   public int deleteNotice(int noticeNo);
   // 공지사항 삭제를 위한 메서드
   
   public List<NoticeVO> selectAllNotice();
   // DB에 존재하는 모든 공지사항 정보를 조회하기 위한 메서드 여러 건수가 나올 수 있으니 List로 출력
   
   public List<NoticeVO> searchNotice(NoticeVO nv);
   // 검색할 데이터에 해당하는 공지사항 목록을 조회하기 위한 메서드

   public int countList() throws SQLException;

   public String loginChk(Map<String, Object> map) throws SQLException;

   public List<NoticeVO> noticeList(Map<String, Object> map2) throws SQLException;

   public NoticeVO getNotice(int noticeNo);

   
}