package free.dao;

import java.util.List;

import free.vo.FComVO;

public interface IFreeComDao {
	public int insertFreeCom(FComVO fcv);
	public boolean checkFreeCom(String memId);
	public FComVO getMemId(String memId);
	public FComVO getFreeCom(int fNo);
	public int updateFreeCom(FComVO fcv);
	public int deleteFreeCom(String memId);
	public List<FComVO> selectAllFreeComVO();
	public List<FComVO> searchFreeComVO(FComVO fcv);
	public int deleteFreeCom(int fNo);
	public List<FComVO> getFreeComList(int fNo);
}
