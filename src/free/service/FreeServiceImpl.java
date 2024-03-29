package free.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import free.dao.FreeDaoImpl;
import free.dao.IFreeDao;
import free.vo.FreeVO;

public class FreeServiceImpl implements IFreeService{


	private IFreeDao fdao;
	private static IFreeService fservice;
	
	private FreeServiceImpl() {
		fdao = FreeDaoImpl.getInstance();
	}
	
	public static IFreeService getInstance() {
		if(fservice == null) {
			fservice = new FreeServiceImpl();
		}
		return fservice;
	}
	
	@Override
	public int registFree(FreeVO fv) {
		return fdao.insertFree(fv);
	}

	@Override
	public boolean checkFree(String memId) {
		return fdao.checkFree(memId);
	}


	@Override
	public int modifyFree(FreeVO fv) {
		return fdao.updateFree(fv);
	}

	@Override
	public int removeFree(String memId) {
		return fdao.deleteFree(memId);
	}

	@Override
	public List<FreeVO> listAllFree() {
		return fdao.selectAllFree();
	}

	@Override
	public List<FreeVO> searchFree(FreeVO fv) {
		return fdao.searchFreeVO(fv);
	}

	@Override
	public FreeVO getFree(int fNo) {
		return fdao.getFree(fNo);
	}

	@Override
	public int removeFree(int fNo) {
		return fdao.deleteFree(fNo);
	}

	// JS 수정
	@Override
	public List<FreeVO> getMemId(String memId) {
		return fdao.getMemId(memId);
	}

	@Override
	public int countFree() {
		return fdao.countFree();
	}

	@Override
	public List<FreeVO> freeList(Map<String, Object> map) {
		return fdao.freeList(map);
	}
	
	

}
